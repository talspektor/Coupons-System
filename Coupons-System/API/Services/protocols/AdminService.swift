//
//  AdminService.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

protocol AdminService {
    static var client: AdminCilent { get }
    static func getCustomers(completion: @escaping (Result<[Customer], Error>) -> Void)
    static func getCompanies(completion: @escaping (Result<[Company], Error>) -> Void)
    static func addCompany(company: Company, completion: @escaping (Result<Company, Error>) -> Void)
    static func updateCompany(company: Company, completion: @escaping (Result<Company, Error>) -> Void)
    static func deleteCompany(id: Int, completion: @escaping (Result<Company, Error>) -> Void)
    static func getCompany(id: Int, completion: @escaping (Result<Company, Error>) -> Void)
    static func getCompany(name: String, completion: @escaping (Result<Company, Error>) -> Void)
    static func addCustomer(customer: Customer, completion: @escaping (Result<Customer, Error>) -> Void)
    static func updateCustomer(customer: Customer, completion: @escaping (Result<Customer, Error>) -> Void)
    static func deleteCustomer(id: Int, completion: @escaping (Result<Customer, Error>) -> Void)
    static func getCustomer(id: Int,completion: @escaping (Result<Customer, Error>) -> Void)
}
