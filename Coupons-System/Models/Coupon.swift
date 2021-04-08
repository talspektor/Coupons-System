//
//  Coupon.swift
//  CouponSystem
//
//  Created by Tal talspektor on 14/01/2021.
//

import Foundation

struct Coupon: Codable, Equatable, Identifiable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let id: Int64
    var company: Company
    var category: Category.RawValue
    var title: String
    var description: String
    var startDate: String
    var endDate: String
    var amount: Int
    var price: Double
    var imageUrl: String
}
