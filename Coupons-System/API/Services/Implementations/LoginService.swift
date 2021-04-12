//
//  LoginServiceImp.swift
//  Coupons-System
//
//  Created by Tal Spektor on 05/04/2021.
//  Copyright © 2021 Tal Spektor. All rights reserved.
//

import Foundation
import Combine

enum LoginService {
    static var client: Router<LoginEndPoint> { Router<LoginEndPoint>() }
    static var cancelable = Set<AnyCancellable>()
    
    static func login(type: UserType, email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) throws {
        do {
            let _ = try client.request(.login(type, email, password), type: LoginResponseItem.self)
                .sink(receiveCompletion: { (completion) in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        debugPrint(error)
                    }
                    
                }, receiveValue: { (data, response) in
                    let networkResponseItem = NetworkResponseItem(data: data, response: response, error: nil)
                    let result = ResponseHandler.handleWithDecoding(LoginResponseItem.self, networkResponseItem)
                    switch result {
                    case .success(let response):
                        APIConstants.token = response.token
                        completion(.success(response.token))
                    case .failure(let error):
                        completion(.failure(error))
                        debugPrint(error)
                    }
                }).store(in: &cancelable)
        } catch {
            debugPrint(error)
            throw error
        }
    }
}
