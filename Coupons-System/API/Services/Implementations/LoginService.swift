//
//  LoginServiceImp.swift
//  Coupons-System
//
//  Created by Tal Spektor on 05/04/2021.
//  Copyright © 2021 Tal Spektor. All rights reserved.
//

import Foundation

enum LoginService {
    static var client: Router<LoginEndPoint> { Router<LoginEndPoint>() }
    
    static func login(type: UserType, email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        client.request(.login(UserType.admin, email, password)) { responseItem in
            ResponseHandler.handleWithDecoding(String.self, responseItem) { (result) in
                completion(APIResponseHandler.handleResponse(result: result))
            }
        }
    }
}