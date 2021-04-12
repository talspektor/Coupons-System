//
//  AdminServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

enum AdminServiceImp: AdminService {
    
    
    static var client: AdminCilent { AdminCilent() }
    
//    static func getCustomers(completion: @escaping (Result<[Customer], Error>) -> Void) {
//        return 
//        client.router.request(.getCustomers) { responseItem in
//            ResponseHandler.handleWithDecoding([Customer].self ,responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//    
//    static func getCompanies(completion: @escaping (Result<[Company], Error>) -> Void) {
//        client.router.request(.getCompanies) { responseItem in
//            ResponseHandler.handleWithDecoding([Company].self ,responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//    
//    static func addCompany(company: Company, completion: @escaping (Result<Company, Error>) -> Void) {
//        client.router.request(.addComapny(company)) { responseItem in
//            ResponseHandler.handleWithDecoding(Company.self, responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//
//    static func updateCompany(company: Company, completion: @escaping (Result<Company, Error>) -> Void) {
//        client.router.request(.updateCompany(company)) { responseItem in
//            ResponseHandler.handleWithDecoding(Company.self, responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//
//    static func deleteCompany(id: Int, completion: @escaping (Result<Company, Error>) -> Void) {
//        client.router.request(.deleteCompany(id)) { responseItem in
//            ResponseHandler.handleWithDecoding(Company.self, responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//
//    static func getCompany(id: Int, completion: @escaping (Result<Company, Error>) -> Void) {
//        client.router.request(.getCompany(id)) { responseItem in
//            ResponseHandler.handleWithDecoding(Company.self ,responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//
//    static func getCompany(name: String, completion: @escaping (Result<Company, Error>) -> Void) {
//        client.router.request(.getCompanyByName(name)) { responseItem in
//            ResponseHandler.handleWithDecoding(Company.self ,responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//
//    static func addCustomer(customer: Customer, completion: @escaping (Result<Customer, Error>) -> Void) {
//        client.router.request(.addCustomer(customer)) { responseItem in
//            ResponseHandler.handleWithDecoding(Customer.self, responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//
//    static func updateCustomer(customer: Customer, completion: @escaping (Result<Customer, Error>) -> Void) {
//        client.router.request(.updateCustomer(customer)) { responseItem in
//            ResponseHandler.handleWithDecoding(Customer.self, responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//
//    static func deleteCustomer(id: Int, completion: @escaping (Result<Customer, Error>) -> Void) {
//        client.router.request(.deleteCustomer(id)) { responseItem in
//            ResponseHandler.handleWithDecoding(Customer.self, responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
//
//    static func getCustomer(id: Int, completion: @escaping (Result<Customer, Error>) -> Void) {
//        client.router.request(.getCustomer(id)) { responseItem in
//            ResponseHandler.handleWithDecoding(Customer.self ,responseItem) { (result) in
//                completion(result)
//            }
//        }
//    }
}
