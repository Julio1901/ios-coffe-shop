//
//  CoffeeRepositoryTests.swift
//  CoffeShopTests
//
//  Created by Julio Cesar Pereira on 08/06/24.
//

import XCTest
@testable import CoffeShop

final class CoffeeRepositoryTests: XCTestCase {

    var coffeeRepositoryMock: CoffeeRepositoryMock!
    
    override func setUpWithError() throws {
        coffeeRepositoryMock = CoffeeRepositoryMock()
        coffeeRepositoryMock.loadImageDataFromProject(named: "coffe-product-image")
    }

    override func tearDownWithError() throws {
        coffeeRepositoryMock = nil
    }
    
    func testFetchImageDataSuccess() async throws {
        XCTAssertNotNil(coffeeRepositoryMock.imageDataToReturn, "Image data should not be nil")
        let mockUrl = "https://coffee.alexflipnote.dev/3mcdQliW_Qg_coffee.jpg"
        let data = try await coffeeRepositoryMock.fetchImageData(urlString: mockUrl)
        XCTAssertEqual(data, coffeeRepositoryMock.imageDataToReturn, "Fetched image data should match the data from the project image")
    }
    
    func testFetchImageDataError () async throws {
        struct TestError: Error {}
        let expectedError = TestError()
        coffeeRepositoryMock.errorToThrow = expectedError
        let mockUrl = "https://coffee.alexflipnote.dev/3mcdQliW_Qg_coffee.jpg"
        
        do {
            _ = try await coffeeRepositoryMock.fetchImageData(urlString: mockUrl)
            XCTFail("Expected error, but got no error")
       } catch {
           XCTAssertTrue(error is TestError, "Error should match expected error type")
       }
    }
    
    func testShouldFetchCoffeeListCorrectly () async throws {
        let coffeeList = try await coffeeRepositoryMock.getCoffeeList()
        XCTAssertEqual(5, coffeeList.count)
    }


    
}
