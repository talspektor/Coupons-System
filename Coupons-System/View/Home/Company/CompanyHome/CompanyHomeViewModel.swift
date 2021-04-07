//
//  CompanyHomeViewNodel.swift
//  Coupons
//
//  Created by Tal talspektor on 01/02/2021.
//

import SwiftUI

extension ComapnyHameView {
    class CompanyHomeViewModel: ObservableObject {
        
        @Published private(set) var company: Company?
        @Published private(set) var categoryCoupons: [CategoryCoupons]?
        @Published private(set) var shouldShowAlert = false
        
        private var coupons: [Coupon] = []        
        var useMockData = false
        
        func dismissAlert() {
            shouldShowAlert = false
        }
        
        func getCompany(completion: @escaping (Company?) -> Void) {
            if useMockData {
                company = randomCompany
            } else {
//                CompanyServiceImp.getCompany { [weak self] (result) in
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success(let company):
//                            completion(company)
//                        case .failure:
//                            self?.shouldShowAlert = true
//                            completion(nil)
//                        }
//                    }
//                }
            }
            
        }
        
        func getCoupons() {
            if useMockData {
                categoryCoupons = mockSections
            } else {
//                CompanyServiceImp.getCoupons { [weak self] (result) in
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success(let coupons):
//                            self?.categoryCoupons = Utils.formatCouponsData(coupons: coupons)
//                        case .failure:
//                            self?.shouldShowAlert = true
//                        }
//                    }
//                }
            }
        }
        
        func addCoupon(_ coupon: Coupon) {
            if useMockData {
                
            } else {
//                CompanyServiceImp.addCoupon(coupon: coupon) { [weak self] (result) in
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success:
//                            break
//                        case .failure:
//                            self?.shouldShowAlert = true
//                        }
//                    }
//                }
            }
        }
    }
}

