//
//  HomeViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit
import FLAnimatedImage

class HomeViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, HomeViewModelDelegate  {
    
    private var initialScreen = HomeScreen()
    private var homeViewModel : HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialScreen.coffeeList.dataSource = self
        initialScreen.coffeeList.delegate = self
        initialScreen.coffeeList.register(CoffeeWithPriceCell.self, forCellWithReuseIdentifier: "CoffeeWithPriceCell")
        let coffeeRepository = CoffeeRepositoryImpl()
        homeViewModel = HomeViewModel(coffeRepository: coffeeRepository)
        homeViewModel.delegate = self
        homeViewModel.loadCoffeeListData()
        prepareLoadingImage()
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

        cell.rating = ""
        cell.title = ""
        cell.coffeeType = ""
        cell.price = ""
        cell.image.image = UIImage()
                
        let vm = self.homeViewModel.coffeeListViewModel.coffeesViewModel[indexPath.row]
        
        cell.rating = vm.rating
        cell.title = vm.name
        cell.coffeeType = vm.grindOption
        cell.price = vm.price

        
        Task{
            
            guard let coffeeImage = vm.image?.file else { return }
            
                if let image = await fetchImageData(from: coffeeImage) {
                            // Atualize a UI na thread principal
                            DispatchQueue.main.async {
                                cell.image.image = image
                            }
                }
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
    
    
    func fetchImageData(from urlString: String) async -> UIImage? {
            guard let url = URL(string: urlString) else { return nil }
            
            do {
                // Baixe os dados da imagem
                let (data, _) = try await URLSession.shared.data(from: url)
                return UIImage(data: data)
            } catch {
                print("Erro ao baixar a imagem: \(error)")
                return nil
            }
    }
    
    func prepareLoadingImage() {
        if let path = Bundle.main.path(forResource: "loading-coffee", ofType: "gif"),
        let gifData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            let animatedImage = FLAnimatedImage(animatedGIFData: gifData)
            initialScreen.loadingImage.animatedImage = animatedImage
        }else{
            print("Erro ao carregar o GIF.")
        }
    }

}

