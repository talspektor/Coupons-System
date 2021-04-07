//
//  CouponsAPI.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

enum AdminEndPoint: EndPointType {
    
    case login(String, String)
    case getCompanies
    case getCustomers
    case addComapny(Company)
    case addCustomer(Customer)
    case updateCompany(Company)
    case updateCustomer(Customer)
    case deleteCompany(Int)
    case deleteCustomer(Int)
    case getCompany(Int)
    case getCompanyByName(String)
    case getCustomer(Int)
    
    var baseURL: URL {
        return URL(string: "http://localhost:8080/api")!
    }

    var path: String {
        switch self {
        case .login(let email, let password):
            return "/login/ADMIN/\(email)/\(password)"
        case .addComapny:
            return "/add-company"
        case .getCompanies:
            return "/companies"
        case .getCustomers:
            return "/customers"
        case .addCustomer(_):
            return "/add-customer"
        case .updateCompany(_):
            return "/update-company"
        case .updateCustomer(_):
            return "/update-customer"
        case .deleteCompany(let id):
            return "/delete-company/\(id)"
        case .deleteCustomer(let id):
            return "/delete-customer/\(id)"
        case .getCompany(let id):
            return "/company/\(id)"
        case .getCompanyByName(let name):
            return "/company/name/\(name)"
        case .getCustomer(let id):
            return "customer/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .addComapny:
            return .post
        case .addCustomer:
            return .post
        case .deleteCompany:
            return .delete
        case .deleteCustomer:
            return .delete
        case .getCompanies:
            return .get
        case .getCustomers:
            return .get
        case .getCompany:
            return .get
        case .getCustomer:
            return .get
        case .getCompanyByName:
            return .get
        case .updateCompany:
            return .put
        case .updateCustomer:
            return .put
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login:
            return .request
        case .addComapny(let company):
            let params: Parameters = [
                "name": company.name,
                "email": company.email,
                "password": company.password
            ]
            return .requestParametersAnyHeaders(bodyParameters: params, urlParanatars: nil, additionalHeaders: headers)
        case .addCustomer(let customer):
            let params: Parameters = [
                "firstName": customer.firstName,
                "lastName": customer.lastName,
                "email": customer.email,
                "password": customer.password
            ]
            return .requestParametersAnyHeaders(bodyParameters: params, urlParanatars: nil, additionalHeaders: headers)
        case .deleteCompany:
            return .requestParametersAnyHeaders(bodyParameters: nil, urlParanatars: nil, additionalHeaders: headers)
        case .deleteCustomer:
            return .requestParametersAnyHeaders(bodyParameters: nil, urlParanatars: nil, additionalHeaders: headers)
        case .getCompanies:
            return .requestParametersAnyHeaders(bodyParameters: nil, urlParanatars: nil, additionalHeaders: headers)
        case .getCustomers:
            return .requestParametersAnyHeaders(bodyParameters: nil, urlParanatars: nil, additionalHeaders: headers)
        case .getCompany:
            return .requestParametersAnyHeaders(bodyParameters: nil, urlParanatars: nil, additionalHeaders: headers)
        case .getCustomer:
            return .requestParametersAnyHeaders(bodyParameters: nil, urlParanatars: nil, additionalHeaders: headers)
        case .getCompanyByName:
            return .requestParametersAnyHeaders(bodyParameters: nil, urlParanatars: nil, additionalHeaders: headers)
        case .updateCompany(let company):
            let params: Parameters = [
                "id": company.id,
                "name": company.name,
                "email": company.email,
                "password": company.password
            ]
            return .requestParametersAnyHeaders(bodyParameters: params, urlParanatars: nil, additionalHeaders: headers)
        case .updateCustomer(let customer):
            let params: Parameters = [
                "id": customer.id,
                "firstName": customer.firstName,
                "lastName": customer.lastName,
                "email": customer.email,
                "password": customer.password
            ]
             return .requestParametersAnyHeaders(bodyParameters: params, urlParanatars: nil, additionalHeaders: headers)
        }
        
    }
    var headers: HTTPHeaders? {
        return ["token": APIConstants.token]
    }
    
    
}
