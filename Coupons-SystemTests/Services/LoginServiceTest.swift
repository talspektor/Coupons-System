//
//  LoginServiceTest.swift
//  Coupons-SystemTests
//
//  Created by Tal Spektor on 05/04/2021.
//  Copyright © 2021 Tal Spektor. All rights reserved.
//

import XCTest
@testable import Coupons_System

class LoginServiceTest: XCTestCase {

    func testAdminLogin() {
        let expectation = XCTestExpectation()
        LoginService.login(type: UserType.admin, email: "com.admin@admin", password: "admin") { (result) in
            switch result {
            case .success(let token):
                assert(true)
                debugPrint("Token: \(token)")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Login fail error: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
}


