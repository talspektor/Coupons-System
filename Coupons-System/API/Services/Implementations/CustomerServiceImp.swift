//
//  CustomerServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
import Combine

enum CustomerServiceImp: CustomerService {
        
    static var client: CustomerClient { CustomerClient() }

    static func getAllCoupons() -> AnyPublisher<[Coupon], Error> {
        client.router.request(.getCoupons, type: [Coupon].self)
    }
    
    static func getCustomerCoupons() -> AnyPublisher<[Coupon], Error> {
        client.router.request(.getCustomerCoupons, type: [Coupon].self)
    }
    
    static func purchaseCoupon(id: Int) -> AnyPublisher<Coupon, Error> {
        client.router.request(.purchaseCoupon(id), type: Coupon.self)
    }
    
    static func getCoupons(categoty: Category) -> AnyPublisher<[Coupon],Error> {
        client.router.request(.getCoupons, type: [Coupon].self)
    }
    
    static func getCoupons(maxPrice: Double) -> AnyPublisher<[Coupon], Error> {
        client.router.request(.getCouponsPriceLessThen(maxPrice), type: [Coupon].self)
    }
    
    static func getCustomer() -> AnyPublisher<Customer, Error> {
        client.router.request(.getCustoemr, type: Customer.self)
    }
}
