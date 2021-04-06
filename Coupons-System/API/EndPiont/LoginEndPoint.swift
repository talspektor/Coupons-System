//
//  LoginEndPoint.swift
//  Coupons-System
//
//  Created by Tal Spektor on 05/04/2021.
//  Copyright © 2021 Tal Spektor. All rights reserved.
//

import Foundation
typealias Email = String
typealias Password = String
enum LoginEndPoint: EndPointType {
    
    case login(UserType, Email, Password)
    
    var baseURL: URL { URL(string: "http://localhost:8080/login")! }
    
    var path: String {
        switch self {
        case .login(let type, let email, let password):
            return "\(type.rawValue)/\(email)/\(password)"
        }
    }
    
    var httpMethod: HTTPMethod {
        .post
    }
    
    var task: HTTPTask {
        .request
    }
    
    var headers: HTTPHeaders? {
        ["": ""]
    }
}
