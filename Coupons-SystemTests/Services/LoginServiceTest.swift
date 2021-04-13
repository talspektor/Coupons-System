//
//  LoginServiceTest.swift
//  Coupons-SystemTests
//
//  Created by Tal Spektor on 05/04/2021.
//  Copyright © 2021 Tal Spektor. All rights reserved.
//

import XCTest
import Combine
@testable import Coupons_System

class LoginServiceTest: XCTestCase {

    var cancelable = Set<AnyCancellable>()
    
    func testAdminLogin() {
        let expectation = XCTestExpectation()
        LoginService.login(type: .admin, email: "com.admin@admin", password: "admin")
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Login fail error: \(error)")
                    expectation.fulfill()
                }
            }, receiveValue: { (loginResponseItem) in
                APIConstants.token = loginResponseItem.token
                debugPrint("Token: \(loginResponseItem.token)")
                assert(true)
                expectation.fulfill()
            }).store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCustomerLogin() {
        let expectation = XCTestExpectation()
        LoginService.login(type: UserType.customer, email: "test_ios6", password: "test_ios6")
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Login fail error: \(error)")
                    expectation.fulfill()
                }
            }, receiveValue: { (loginResponseItem) in
                APIConstants.token = loginResponseItem.token
                debugPrint("Token: \(loginResponseItem.token)")
                assert(true)
                expectation.fulfill()
            }).store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testCompanyLogin() {
        let expectation = XCTestExpectation()
        LoginService.login(type: UserType.company, email: "string", password: "string")
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Login fail error: \(error)")
                    expectation.fulfill()
                }
            }, receiveValue: { (loginResponseItem) in
                APIConstants.token = loginResponseItem.token
                debugPrint("Token: \(loginResponseItem.token)")
                assert(true)
                expectation.fulfill()
            }).store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
}


