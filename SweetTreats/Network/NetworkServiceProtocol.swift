//
//  NetworkServiceProtocol.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/10/23.
//

import SwiftUI

protocol NetworkServiceProtocol {
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}
