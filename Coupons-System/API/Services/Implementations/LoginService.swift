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
    
    static func login(type: UserType, email: String, password: String) -> AnyPublisher<LoginResponseItem, Error> {
        return client.request(.login(type, email, password), type: LoginResponseItem.self)
    }
}
