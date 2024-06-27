//
//  HomeViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit
import FLAnimatedImage

class HomeViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, HomeViewModelDelegate {
  
    private var initialScreen = HomeScreen()
    private var homeViewModel : HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialScreen.coffeeList.dataSource = self
        initialScreen.coffeeList.delegate = self
        initialScreen.coffeeList.register(CoffeeWithPriceCell.self, forCellWithReuseIdentifier: "CoffeeWithPriceCell")
        
        navigationController?.isNavigationBarHidden = true
        
        let coffeeRepository = CoffeeRepositoryImpl()
        let locationRepository = LocationRepositoryImpl()
        homeViewModel = HomeViewModel(coffeRepository: coffeeRepository, locationRepository: locationRepository)
        homeViewModel.delegate = self
        populateCoffeeList()
        populateLocatins()
        prepareLoadingImage()
        setupSearchListener()
        view = initialScreen
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel.coffeeListViewModel.coffeesViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeWithPriceCell", for: indexPath) as! CoffeeWithPriceCell
        cell.delegate = self

        cell.rating = ""
        cell.title = ""
        cell.coffeeType = ""
        cell.price = ""
        cell.imageView.image = UIImage()
        cell.showLoader()
                
        let vm = self.homeViewModel.coffeeListViewModel.coffeesViewModel[indexPath.row]
        
        cell.rating = vm.rating
        cell.title = vm.name
        cell.coffeeType = vm.grindOption
        cell.price = vm.price
        
        if let imageData = vm.image {
            cell.imageView.image = UIImage(data: imageData)
            cell.hideLoader()
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 238)
    }
    
    func updateCoffeeList() {
        DispatchQueue.main.async {
              self.initialScreen.coffeeList.reloadData()
          }
    }
    
    func populateCoffessType() {
        DispatchQueue.main.async {
            self.populateCoffeListCategory()
        }
    }
    
    private func prepareLoadingImage() {
        if let path = Bundle.main.path(forResource: "loading-coffee", ofType: "gif"),
        let gifData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            let animatedImage = FLAnimatedImage(animatedGIFData: gifData)
            initialScreen.setupLoadingImage(animatedImage: animatedImage)
        }else{
            print("Error loading GIF.")
        }
    }
    
    
    private func populateCoffeeList()  {
        Task {
            await homeViewModel.loadCoffeeListData()
        }
    }
    
    func handleLoadingState() {
        DispatchQueue.main.async {
            self.initialScreen.loadingImage.isHidden = self.homeViewModel.loadingImageIsHidden
            if (self.homeViewModel.loadingImageIsHidden) {
                self.initialScreen.searchComponent.setupEnabledState(placeholder: NSLocalizedString("search_coffee", comment: ""))
                self.notifyAccessibilityUIChanges()
            } else {
                self.initialScreen.searchComponent.setupDisableState()
            }
        }
    }
    
    private func notifyAccessibilityUIChanges(){
        UIAccessibility.post(notification: .announcement, argument: "The filtering component has been enabled to filter the list of coffees by name. Above the list, there is also a horizontal list of buttons where you can filter the coffees by preparation method.")
    }
    
    private func populateCoffeListCategory() {
        for type in homeViewModel.coffeeListViewModel.coffeesType {
            let button = SelectableCustomButton()
            button.delegate = self
            button.setTitle(type, for: .normal)
            initialScreen.listCategoryStackView.addArrangedSubview(button)
        }
    }
    
    private func populateLocatins() {
        Task{
            await homeViewModel.loadLocationsData()
            DispatchQueue.main.async{
                self.initialScreen.locationButton.menu = self.createLocationMenu(locations: self.homeViewModel.locationList)
            }
        }
    }
    
    @objc func menuButtonTapped(_ action: UIAction) {
        initialScreen.locationButton.setTitle(action.title, for: .normal)
     }
    
    private func createLocationMenu(locations : [Location]) -> UIMenu {
        let actions = locations.map { location in
            UIAction(title: location.name, handler: self.menuButtonTapped)
        }
        actions.forEach { action in
            action.isAccessibilityElement = true
            action.accessibilityHint = "Double tap to select location."
        }
        let menuTitle =  NSLocalizedString("location_options", comment: "")
        let locationMenu = UIMenu(
                    title: menuTitle,
                    options: .displayInline,
                    children: actions
        )
        return locationMenu
    }
    
    private func setupSearchListener() {
        initialScreen.searchComponent.addTarget(self, action: #selector(searchTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func searchTextFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            print(text)
//            homeViewModel.coffeeListViewModel.filterByCoffeeName(name: text)
            homeViewModel.coffeeListViewModel.applyNameFilter(name: text)
        }
    }
}

extension HomeViewController : SelectableCustomButtonDelegate {
    func buttonPressed(buttonTitle: String) {
        
//        homeViewModel.coffeeListViewModel.filterByGrind(grindOption: buttonTitle)
        homeViewModel.coffeeListViewModel.applyGrindFilter(grindFilter: buttonTitle)
        
        
        initialScreen.listCategoryStackView.subviews.forEach { subView in
            if let selectableCustomButton = subView as? SelectableCustomButton {
                if (selectableCustomButton.titleLabel?.text != buttonTitle) {
                    selectableCustomButton.setupDefaultState()
                }
            }
        }
    }
}

extension HomeViewController: CoffeeWithPriceCellDelegate {
    func didTap() {
        print("Cell pressed")
        navigateToDetailsScreen()
    }
    
    func navigateToDetailsScreen() {
        let detailsScreen = DetailsViewController()
        navigationController?.pushViewController(detailsScreen, animated: true)
    }
}
