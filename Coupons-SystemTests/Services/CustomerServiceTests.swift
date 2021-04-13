//
//  CustomerServiceTests.swift
//  CouponsTests
//
//  Created by Tal talspektor on 28/01/2021.
//

import XCTest
import Combine
@testable import Coupons_System

class CustomerServiceTests: XCTestCase {
    var cancelable = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        let login = LoginServiceTest()
        login.testCustomerLogin()
    }
    
    func testGetAllCoupons() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.getAllCoupons()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Get all coupns fail: \(error)")
                    expectation.fulfill()
                }
            }) { (coupons) in
                assert(true, "Get all coupons")
                coupons.forEach { debugPrint($0) }
                expectation.fulfill()
                
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCustomerCoupons() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.getCustomerCoupons()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                        assert(false, "Get customer coupons fail: \(error)")
                        expectation.fulfill()
                }
            }) { (coupons) in
                coupons.forEach { debugPrint($0) }
                assert(true, "Get customer coupons")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testPurchaseCoupon() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.purchaseCoupon(id: 7)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "purchase coupon fali: \(error)")
                    expectation.fulfill()
                }
            }) { (coupon) in
                debugPrint(coupon)
                assert(true, "purchase coupon")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCouponsByCategory() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.getCoupons(categoty: .SPORTS)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "get couponsByCategory fail: \(error)")
                    expectation.fulfill()
                }
            }) { (coupons) in
                coupons.forEach { debugPrint($0) }
                assert(true, "get couponsByCategory")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCouponsByMaxPrice() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.getCoupons(maxPrice: 100)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "getCoupons fail: \(error)")
                    expectation.fulfill()
                }
            }) { (coupons) in
                coupons.forEach { debugPrint($0) }
                assert(true, "getCoupons")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetCustomer() {
        let expectation = XCTestExpectation()
        CustomerServiceImp.getCustomer()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "getCustomer fail: \(error)")
                }
            }) { (customer) in
                debugPrint(customer)
                assert(true, "getCustomer")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
}
