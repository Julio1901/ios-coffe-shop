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
    
    func testCoffeeTypeListShouldBePopulatedRandomlyCorrectly() async throws{
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
    
    
    

}


class CoffeeListViewModelDelegateMock: CoffeeListViewModelDelegate {
    func updateCoffeeList() {
        // Do nthing
    }
    
    func populateCoffessType() {
        // Do nthing
    }
}
