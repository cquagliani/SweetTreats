//
//  NetworkService.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/10/23.
//

import SwiftUI

class NetworkService: NetworkServiceProtocol {
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            completion(data, error)
        }
        task.resume()
    }
}
