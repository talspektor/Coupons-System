//
//  CustomerServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

enum CustomerServiceImp: CustomerService {
        
    static var client: CustomerClient { CustomerClient() }

    static func getAllCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCoupons) { responseItem in
            ResponseHandler.handleWithDecoding([Coupon].self, responseItem) { (result) in
                completion(result)
            }
        }
    }
    
    static func getCustomerCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCustomerCoupons) { responseItem in
            ResponseHandler.handleWithDecoding([Coupon].self, responseItem) { (result) in
                completion(result)
            }
        }
    }
    
    static func purchaseCoupon(id: Int, completion: @escaping (Result<Coupon, Error>) -> Void) {
        client.router.request(.purchaseCoupon(id)) { responseItem in
            ResponseHandler.handleWithDecoding(Coupon.self, responseItem) { (result) in
                completion(result)
            }
        }
    }
    
    static func getCoupons(categoty: Category, completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCouponsByCategury(categoty)) { responseItem in
            ResponseHandler.handleWithDecoding([Coupon].self, responseItem) { (result) in
                completion(result)
            }
        }
    }
    
    static func getCoupons(maxPrice: Double, completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCouponsPriceLessThen(maxPrice)) { responseItem in
            ResponseHandler.handleWithDecoding([Coupon].self, responseItem) { (result) in
                completion(result)
            }
        }
    }
    
    static func getCustomer(completion: @escaping (Result<Customer, Error>) -> Void) {
        client.router.request(.getCustoemr) { responseItem in
            ResponseHandler.handleWithDecoding(Customer.self, responseItem) { (result) in
                completion(result)
            }
        }
    }
}
