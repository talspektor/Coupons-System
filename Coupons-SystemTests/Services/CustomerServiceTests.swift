//
//  CustomerServiceTests.swift
//  CouponsTests
//
//  Created by Tal talspektor on 28/01/2021.
//

import XCTest
@testable import Coupons_System

class CustomerServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let login = LoginServiceTest()
//        login.testCustomerLogin()
    }
    
//    func testGetAllCoupons() {
//        let expectation = XCTestExpectation()
//        CustomerServiceImp.getAllCoupons { (result) in
//            switch result {
//            case .success(let coupons):
//                assert(true, "Get all coupons")
//                coupons.forEach { debugPrint($0) }
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "Get all coupns fail: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testGetCustomerCoupons() {
//        let expectation = XCTestExpectation()
//        CustomerServiceImp.getCustomerCoupons { (result) in
//            switch result {
//            case .success:
//                assert(true, "Get customer coupons")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "Get customer coupons fail: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//
//    func testPurchaseCoupon() {
//        let expectation = XCTestExpectation()
//        CustomerServiceImp.purchaseCoupon(id: 7) { (result) in
//            switch result {
//            case .success:
//                assert(true, "purchase coupon")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "purchase coupon fali: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testGetCouponsByCategory() {
//        let expectation = XCTestExpectation()
//        CustomerServiceImp.getCoupons(categoty: .SPORTS) { (result) in
//            switch result {
//            case .success:
//                assert(true, "get couponsByCategory")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "get couponsByCategory fail: \(error)")
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//    
//    func testGetCouponsByMaxPrice() {
//        let expectation = XCTestExpectation()
//        CustomerServiceImp.getCoupons(maxPrice: 100) { (result) in
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
//    func testGetCustomer() {
//        let expectation = XCTestExpectation()
//        CustomerServiceImp.getCustomer { (result) in
//            switch result {
//            case .success:
//                assert(true, "getCustomer")
//                expectation.fulfill()
//            case .failure(let error):
//                assert(false, "getCustomer fail: \(error)")
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
}
