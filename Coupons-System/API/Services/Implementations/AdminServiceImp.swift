//
//  AdminServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
import Combine

enum AdminServiceImp: AdminService {
    
    static var client: AdminCilent { AdminCilent() }
    
    static func getCustomers() -> AnyPublisher<[Customer], Error> {
        client.router.request(.getCustomers, type: [Customer].self)
    }
    
    static func getCompanies() -> AnyPublisher<[Company], Error> {
        client.router.request(.getCompanies, type: [Company].self)
    }
    
    static func addCompany(company: Company) -> AnyPublisher<Company, Error> {
        client.router.request(.addComapny(company), type: Company.self)
    }

    static func updateCompany(company: Company) -> AnyPublisher<Company, Error> {
        client.router.request(.updateCompany(company), type: Company.self)
    }

    static func deleteCompany(id: Int) -> AnyPublisher<Company, Error> {
        client.router.request(.deleteCompany(id), type: Company.self)
    }

    static func getCompany(id: Int) -> AnyPublisher<Company, Error> {
        client.router.request(.getCompany(id), type: Company.self)
    }

    static func getCompany(name: String) -> AnyPublisher<Company, Error> {
        client.router.request(.getCompanyByName(name), type: Company.self)
    }

    static func addCustomer(customer: Customer) -> AnyPublisher<Customer, Error> {
        client.router.request(.addCustomer(customer), type: Customer.self)
    }

    static func updateCustomer(customer: Customer) -> AnyPublisher<Customer, Error> {
        client.router.request(.updateCustomer(customer), type: Customer.self)
    }

    static func deleteCustomer(id: Int) -> AnyPublisher<Customer, Error> {
        client.router.request(.deleteCustomer(id), type: Customer.self)
    }

    static func getCustomer(id: Int) -> AnyPublisher<Customer, Error> {
        return client.router.request(.getCustomer(id), type: Customer.self)
    }
}
