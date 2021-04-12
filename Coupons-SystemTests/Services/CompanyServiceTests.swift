//
//  CompanyServiceTests.swift
//  CouponsTests
//
//  Created by Tal talspektor on 28/01/2021.
//

import XCTest
@testable import Coupons_System

class CompanyServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let login = LoginServiceTest()
//        login.testCompanyLogin()
    }
    
//    func testAddCoupon() {
//        let expectation = XCTestExpectation()
//        let company = Company(id: 0, name: "", email: "", password: "")
//        let coupon = Coupon(id: 0, company: company, category: Category.SPORTS.rawValue, title: "ios7", description: "ios7", startDate: Date().format(to: .serverDate), endDate: (Date() + (10 * 60 * 60 * 24)).format(to: .serverDate), amount: 5, price: 10, imageUrl: "")
//        CompanyServiceImp.addCoupon(coupon: coupon) { (result) in
//            switch result {
//            case .success:
//                assert(true, "add coupon")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "add coupon fail: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testUpdateCoupon() {
//        let expectation = XCTestExpectation()
//        let company = Company(id: 1, name: "", email: "", password: "")
//        let coupon = Coupon(id: 4, company: company, category: Category.SPORTS.rawValue, title: "ios4", description: "iosUp_1", startDate: Date().format(to: .serverDate), endDate: (Date() + (10 * 60 * 60 * 24)).format(to: .serverDate), amount: 5, price: 10, imageUrl: "")
//        CompanyServiceImp.updateCoupon(coupon: coupon) { (result) in
//            switch result {
//            case .success:
//                assert(true, "update coupon")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "update coupon fail: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testDeleteCoupon() {
//        let expectation = XCTestExpectation()
//        CompanyServiceImp.deleteCoupon(id: 4) { (result) in
//            switch result {
//            case .success:
//                assert(true, "deleteCoupon")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "deleteCoupon fail: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testGetAllCoupons() {
//        let expectation = XCTestExpectation()
//        CompanyServiceImp.getCoupons { (result) in
//            switch result {
//            case .success:
//                assert(true, "getCoupons")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "getCoupons fail: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testGetCouponsByPriceLessThen() {
//        let expectation = XCTestExpectation()
//        CompanyServiceImp.getCoupons(maxPrice: 1000) { (result) in
//            switch result {
//            case .success:
//                assert(true, "getCouponsByPriceLessThen")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "getCouponsByPriceLessThen fail: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testGetCompany() {
//        let expectation = XCTestExpectation()
//        CompanyServiceImp.getCompany { (result) in
//            switch result {
//            case .success:
//                assert(true, "getCompany")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "getCompanyl: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
}
