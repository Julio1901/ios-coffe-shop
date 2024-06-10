//
//  CoffeeListViewModelTests.swift
//  CoffeShopTests
//
//  Created by Julio Cesar Pereira on 08/06/24.
//

import XCTest
@testable import CoffeShop

final class CoffeeListViewModelTests: XCTestCase {

    var coffeeRepositoryMock: CoffeeRepositoryMock!
    var coffeeListViewModel: CoffeeListViewModel!
    var coffeeListViewModelDelegateMock: CoffeeListViewModelDelegate!
    
    
    override func setUpWithError() throws {
        coffeeRepositoryMock = CoffeeRepositoryMock()
        coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        coffeeListViewModel = CoffeeListViewModel(coffeeRepository: coffeeRepositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
    }

    override func tearDownWithError() throws {
        coffeeRepositoryMock = nil
        coffeeListViewModel = nil
    }


    func testCoffeeListShouldBePopulatedCorrectlyDuringInitialization() async throws {
        await coffeeListViewModel.loadData()
        XCTAssertEqual(5, coffeeListViewModel.coffeesViewModel.count, "Coffee list should contain 5 items after initialization")
    }
    
    func testCoffeeTypeListShouldBePopulatedRandomlyCorrectly() async throws {
        await coffeeListViewModel.loadData()
        XCTAssertTrue(coffeeListViewModel.coffeesType.count > 0)
    }
    
    func testCoffeeTypeListSholdBePopulateJustWithValidOptions() async throws {
        let coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        let repositoryMock = CoffeeTypeTestRepositoryMock()
        let coffeeListViewModel = CoffeeListViewModel(coffeeRepository: repositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
        let expectedCoffeeTypes = ["ESPRESSO", "WHOLE BEAN", "FRENCH PRESS", "FILTER"]
        
        await coffeeListViewModel.loadData()
        
        XCTAssertEqual(4, coffeeListViewModel.coffeesType.count)
        XCTAssertTrue(coffeeListViewModel.coffeesType.contains(expectedCoffeeTypes[0]))
        XCTAssertTrue(coffeeListViewModel.coffeesType.contains(expectedCoffeeTypes[1]))
        XCTAssertTrue(coffeeListViewModel.coffeesType.contains(expectedCoffeeTypes[2]))
        XCTAssertTrue(coffeeListViewModel.coffeesType.contains(expectedCoffeeTypes[3]))
    }

    func testShouldApplyNameFilterReturningElementsThatContainPatternAnywhereInName() async throws {
        let coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        let repositoryMock = CoffeeFilterRepositoryMock()
        let coffeeListViewModel = CoffeeListViewModel(coffeeRepository: repositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
    
        await coffeeListViewModel.loadData()
        coffeeListViewModel.applyNameFilter(name: "Mo")
    
        XCTAssertEqual(2, coffeeListViewModel.coffeesViewModel.count)
    }
    
    
    func testShouldApplyCoffeeTypeFilterReturningOnlyElementsOfThatType() async throws {
        let coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        let repositoryMock = CoffeeFilterRepositoryMock()
        let coffeeListViewModel = CoffeeListViewModel(coffeeRepository: repositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
    
        await coffeeListViewModel.loadData()
        coffeeListViewModel.applyGrindFilter(grindFilter: "Espresso")
        XCTAssertEqual(3, coffeeListViewModel.coffeesViewModel.count)
    }
    
    
    func testShouldApplyNameFilterWhenTypeFilterIsAlreadyApplied() async throws {
        let coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        let repositoryMock = CoffeeFilterRepositoryMock()
        let coffeeListViewModel = CoffeeListViewModel(coffeeRepository: repositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
        
        
        await coffeeListViewModel.loadData()
      
        coffeeListViewModel.applyGrindFilter(grindFilter: "Filter")
        coffeeListViewModel.applyNameFilter(name: "Mo")
        
        XCTAssertEqual(1, coffeeListViewModel.coffeesViewModel.count)
    }
    
    func testShouldApplyTypeFilterWhenNameFilterIsAlreadyApplied() async throws {
        let coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        let repositoryMock = CoffeeFilterRepositoryMock()
        let coffeeListViewModel = CoffeeListViewModel(coffeeRepository: repositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
        
        
        await coffeeListViewModel.loadData()

        coffeeListViewModel.applyNameFilter(name: "Mo")
        coffeeListViewModel.applyGrindFilter(grindFilter: "Filter")
     
        
        XCTAssertEqual(1, coffeeListViewModel.coffeesViewModel.count)
        
    }
    
    func testShouldRetainNameFilterAfterTypeFilterIsRemoved() async throws {
        let coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        let repositoryMock = CoffeeFilterRepositoryMock()
        let coffeeListViewModel = CoffeeListViewModel(coffeeRepository: repositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
        
        
        await coffeeListViewModel.loadData()
        coffeeListViewModel.applyNameFilter(name: "Mo")
    
        coffeeListViewModel.applyGrindFilter(grindFilter: "Filter")
        coffeeListViewModel.applyGrindFilter(grindFilter: "")
        XCTAssertEqual(2, coffeeListViewModel.coffeesViewModel.count)
    }
    
 
    func testShouldRetainTypeFilterAfterNameFilterIsRemoved() async throws {
        let coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        let repositoryMock = CoffeeFilterRepositoryMock()
        let coffeeListViewModel = CoffeeListViewModel(coffeeRepository: repositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
        
        await coffeeListViewModel.loadData()
        
        coffeeListViewModel.applyGrindFilter(grindFilter: "French press")
        
        coffeeListViewModel.applyNameFilter(name: "Mo")
        coffeeListViewModel.applyNameFilter(name: "")
        
        XCTAssertEqual(2, coffeeListViewModel.coffeesViewModel.count)
    }
    
    func testShouldReturnAllInitialElementsWhenFiltersAreRemoved() async throws {
        
        let coffeeListViewModelDelegateMock = CoffeeListViewModelDelegateMock()
        let repositoryMock = CoffeeFilterRepositoryMock()
        let coffeeListViewModel = CoffeeListViewModel(coffeeRepository: repositoryMock)
        coffeeListViewModel.delegate = coffeeListViewModelDelegateMock
        
        await coffeeListViewModel.loadData()
        let initialElements = coffeeListViewModel.coffeesViewModel
        coffeeListViewModel.applyGrindFilter(grindFilter: "French press")
        coffeeListViewModel.applyNameFilter(name: "Mo")
        
        coffeeListViewModel.applyGrindFilter(grindFilter: "")
        coffeeListViewModel.applyNameFilter(name: "")
        
        XCTAssertTrue(initialElements.allSatisfy { coffee in
               coffeeListViewModel.coffeesViewModel.contains { $0.name == coffee.name }
           }, "All initial elements should be present after removing filters")
    }
    
}


class CoffeeListViewModelDelegateMock: CoffeeListViewModelDelegate {
    func updateCoffeeList() {
        // Do nthing
    }
    
    func populateCoffessType() {
        // Do nthing
    }
}
