//
//  AdminServicesTests.swift
//  CouponsTests
//
//  Created by Tal talspektor on 28/01/2021.
//

import XCTest
@testable import Coupons_System

class AdminServicesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let login = LoginServiceTest()
        login.testAdminLogin()
    }

    func testGetCompanies() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCompanies { (result) in
            switch result {
            case .success:
                assert(true, "Get Companies")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Companies fail error: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetCustomers() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCustomers { (result) in
            switch result {
            case .success:
                assert(true, "Get Customer")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Customer fail erorr: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetCompanyById() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCompany(id: 1) { (result) in
            switch result {
            case .success:
                assert(true, "Get Company")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Company fail erorr: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetCompanyByName() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCompany(name: "string") { (result) in
            switch result {
            case .success:
                assert(true, "Get Company by name")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Company by name fail erorr: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetCustomerById() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCustomer(id: 1) { (result) in
            switch result {
            case .success:
                assert(true, "Get Customer")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Get Customer fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testAddCompany() {
        let expectation = XCTestExpectation()
        let company = Company(id: 1, name: "test_ios9", email: "test_ios9", password: "test_ios9")
        AdminServiceImp.addCompany(company: company) { (result) in
            switch result {
            case .success:
                assert(true, "Add company")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Add company fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testAddCustomer() {
        let expectation = XCTestExpectation()
        let customer = Customer(id: 1, firstName: "test_ios6", lastName: "test_ios6", email: "test_ios6", password: "test_ios6")
        AdminServiceImp.addCustomer(customer: customer) { (result) in
            switch result {
            case .success:
                assert(true, "Add customer")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "Add customer fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testUpdateCustomer() {
        let expectation = XCTestExpectation()
        let customer = Customer(id: 1, firstName: "test_ios1", lastName: "test_ios1", email: "test_ios1", password: "test_ios1")
        AdminServiceImp.updateCustomer(customer: customer) { (result) in
            switch result {
            case .success:
                assert(true, "update customer")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "update customer fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testUpdateComany() {
        let expectation = XCTestExpectation()
        let company = Company(id: 2, name: "test_ios9", email: "test_ios8", password: "test_ios8")
        AdminServiceImp.updateCompany(company: company) { (result) in
            switch result {
            case .success:
                assert(true, "update cumpany")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "update cumpany fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testDeleteComapny() {
        let expectation = XCTestExpectation()
        AdminServiceImp.deleteCompany(id: 2) { (result) in
            switch result {
            case .success:
                assert(true, "delete company")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "delete company fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testDeleteCustomer() {
        let expectation = XCTestExpectation()
        AdminServiceImp.deleteCustomer(id: 1) { (result) in
            switch result {
            case .success:
                assert(true, "delete company")
                expectation.fulfill()
            case .failure(let error):
                assert(false, "delete company fail: \(error)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
