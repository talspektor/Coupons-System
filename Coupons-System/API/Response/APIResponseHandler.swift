//
//  APIResponseHandler.swift
//  Coupons
//
//  Created by Tal talspektor on 06/02/2021.
//

import Foundation

enum APIResponseHandler {
    static func handleResponse<T>(result: Result<T, Error>) -> Result<T, Error> {
        switch result {
        case .success(let response):
            return (.success(response))
        case .failure(let error):
            return (.failure(error))
        }
    }
}
