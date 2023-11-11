//
//  AllDessertsViewModelTests.swift
//  AllDessertsViewTests
//
//  Created by Chris Quagliani on 11/10/23.
//

import XCTest
@testable import SweetTreats

class DessertViewModelTests: XCTestCase {
    
    var viewModel: DessertViewModel!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        viewModel = DessertViewModel(networkService: mockNetworkService)
    }

    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchDessertsSuccess() {
        let expectation = self.expectation(description: "Fetch desserts")

        mockNetworkService.shouldReturnError = false

        viewModel.fetch()

        DispatchQueue.main.async {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)

        XCTAssertEqual(viewModel.desserts.count, 1)
    }

    func testFetchDessertsFailure() {
        let expectation = self.expectation(description: "Fetch desserts with error")

        mockNetworkService.shouldReturnError = true

        viewModel.fetch()

        DispatchQueue.main.async {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    
        XCTAssertNotNil(viewModel.error)
    }

}
