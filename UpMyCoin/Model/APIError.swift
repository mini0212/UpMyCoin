//
//  APIError.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/24.
//

import Foundation

struct APIError: Error, Decodable {
    let error: ErrorMessage
}

struct ErrorMessage: Error, Decodable {
    let message: String
    let name: Int
    
    init(message: String,
         name: Int) {
        self.message = message
        self.name = name
    }
}
