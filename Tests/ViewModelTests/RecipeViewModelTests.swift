//
//  AllRecipesViewModelTests.swift
//  AllRecipesViewTests
//
//  Created by Chris Quagliani on 11/10/23.
//

import XCTest
@testable import SweetTreats

class RecipeViewModelTests: XCTestCase {
    
    var viewModel: RecipeViewModel!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = RecipeViewModel(networkService: mockNetworkService)
    }

    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchRecipesSuccess() {
        let expectation = self.expectation(description: "Fetch Recipes")

        mockNetworkService.shouldReturnError = false

        viewModel.fetch(strCategory: "Desserts")

        DispatchQueue.main.async {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)

        XCTAssertEqual(viewModel.recipes.count, 1)
    }

    func testFetchRecipesFailure() {
        let expectation = self.expectation(description: "Fetch Recipes with error")

        mockNetworkService.shouldReturnError = true

        viewModel.fetch(strCategory: "Dessert")

        DispatchQueue.main.async {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    
        XCTAssertNotNil(viewModel.error)
    }

}
