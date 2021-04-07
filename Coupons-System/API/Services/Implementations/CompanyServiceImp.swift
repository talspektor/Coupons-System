//
//  CompanyServiceImp.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

enum CompanyServiceImp: CompanyService {
        
    static var client: CompanyClient { CompanyClient() }
    
    static func addCoupon(coupon: Coupon, completion: @escaping (Result<Coupon, Error>) -> Void) {
        client.router.request(.addCoupon(coupon)) { responseItem in
            ResponseHandler.handleWithDecoding(Coupon.self, responseItem) { (result) in
                completion(result)
            }
        }
    }
    
    static func updateCoupon(coupon: Coupon, completion: @escaping (Result<Coupon, Error>) -> Void) {
        client.router.request(.updateCoupon(coupon)) { responseItem in
            ResponseHandler.handleWithDecoding(Coupon.self, responseItem) { (result) in
                completion(result)
            }
        }
    }
    
    static func deleteCoupon(id: Int, completion: @escaping (Result<Coupon, Error>) -> Void) {
        client.router.request(.deleteCoupon(id)) { responseItem in
            ResponseHandler.handleWithDecoding(Coupon.self, responseItem) { (result) in
                completion(result)
            }
        }
    }
    
    static func getCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void) {
        client.router.request(.getCoupons) { responseItem in
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
    
    static func getCompany(completion: @escaping (Result<Company, Error>) -> Void) {
        client.router.request(.getCompany) { responseItem in
            ResponseHandler.handleWithDecoding(Company.self, responseItem) { (result) in
                completion(result)
            }
        }
    }
}
