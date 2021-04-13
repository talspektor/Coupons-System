//
//  CompanyServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
import Combine

enum CompanyServiceImp: CompanyService {
        
    static var client: CompanyClient { CompanyClient() }
    
    static func addCoupon(coupon: Coupon) -> AnyPublisher<Coupon, Error> {
        client.router.request(.addCoupon(coupon), type: Coupon.self)
    }
    
    static func updateCoupon(coupon: Coupon) -> AnyPublisher<Coupon, Error> {
        client.router.request(.updateCoupon(coupon), type: Coupon.self)
    }
    
    static func deleteCoupon(id: Int) -> AnyPublisher<Coupon, Error> {
        client.router.request(.deleteCoupon(id), type: Coupon.self)
    }
    
    static func getCoupons() -> AnyPublisher<[Coupon], Error> {
        client.router.request(.getCoupons, type: [Coupon].self)
    }
    
    static func getCoupons(maxPrice: Double) -> AnyPublisher<[Coupon], Error> {
        client.router.request(.getCouponsPriceLessThen(maxPrice), type: [Coupon].self)
    }
    
    static func getCompany() -> AnyPublisher<Company, Error> {
        client.router.request(.getCompany, type: Company.self)
    }
}
