//
//  DetailsViewModelTests.swift
//  AllDessertsViewTests
//
//  Created by Chris Quagliani on 11/10/23.
//

import XCTest
@testable import SweetTreats

class DetailsViewModelTests: XCTestCase {
    
    var viewModel: DessertViewModel!
    var dessertDetails: DetailsViewModel!
    var mockNetworkService: MockNetworkService!
    let originalDessert: Dessert = Dessert( strMeal: "Christmas cake", strMealThumb: "https://www.themealdb.com/images/media/meals/ldnrm91576791881.jpg", idMeal: "52990")

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = DessertViewModel(networkService: mockNetworkService)
        dessertDetails = DetailsViewModel(networkService: mockNetworkService)
    }

    override func tearDown() {
        viewModel = nil
        dessertDetails = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchDessertsSuccess() {
        let expectation = self.expectation(description: "Fetch dessert details")

        mockNetworkService.shouldReturnError = false

        dessertDetails.fetch(idMeal: originalDessert.idMeal)

        DispatchQueue.main.async {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)

        XCTAssertEqual(dessertDetails.dessertDetails.count, 1)
    }

    func testFetchDessertsFailure() {
        let expectation = self.expectation(description: "Fetch dessert details with error")

        mockNetworkService.shouldReturnError = true

        dessertDetails.fetch(idMeal: originalDessert.idMeal)

        DispatchQueue.main.async {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    
        XCTAssertNotNil(dessertDetails.error)
    }

}
