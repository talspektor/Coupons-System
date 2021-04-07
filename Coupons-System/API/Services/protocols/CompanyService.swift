//
//  CompanyService.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

protocol CompanyService {
    static var client: CompanyClient { get }
    static func addCoupon(coupon: Coupon, completion: @escaping (Result<Coupon, Error>) -> Void)
    static func updateCoupon(coupon: Coupon, completion: @escaping (Result<Coupon, Error>) -> Void)
    static func deleteCoupon(id: Int, completion: @escaping (Result<Coupon, Error>) -> Void)
    static func getCoupons(completion: @escaping (Result<[Coupon], Error>) -> Void)
    static func getCoupons(maxPrice: Double, completion: @escaping (Result<[Coupon], Error>) -> Void)
    static func getCompany(completion: @escaping (Result<Company, Error>) -> Void)
}
