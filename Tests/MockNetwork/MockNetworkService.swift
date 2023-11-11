//
//  MockNetworkService.swift
//  AllDessertsViewTests
//
//  Created by Chris Quagliani on 11/10/23.
//

import SwiftUI
@testable import SweetTreats

class MockNetworkService: NetworkServiceProtocol {
    var shouldReturnError = false

    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        if shouldReturnError {
            completion(nil, NSError(domain: "MockNetworkService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch"]))
        } else {
            completion(loadMockData(), nil)
        }
    }

    private func loadMockData() -> Data? {
        guard let path = Bundle(for: type(of: self)).path(forResource: "AllDessertsResponse", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
        }
        return data
    }
}
