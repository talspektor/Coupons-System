//
//  AdminServicesTests.swift
//  CouponsTests
//
//  Created by Tal talspektor on 28/01/2021.
//

import XCTest
import Combine
@testable import Coupons_System

class AdminServicesTests: XCTestCase {
    var cancelable = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        let login = LoginServiceTest()
        login.testAdminLogin()
    }

    func testGetCompanies() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCompanies()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "testGetCompanies fail error: \(error)")
                }
            }) { (companies) in
                companies.forEach { debugPrint($0) }
                assert(true)
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetCustomers() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCustomers()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Get Customer fail erorr: \(error)")
                }
            }) { (customers) in
                customers.forEach { debugPrint($0) }
                assert(true, "Get Customer")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetCompanyById() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCompany(id: 1)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Get Company fail erorr: \(error)")
                    expectation.fulfill()
                }
            }) { (company) in
                debugPrint(company)
                assert(true, "Get Company")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetCompanyByName() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCompany(name: "string")
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Get Company by name fail erorr: \(error)")
                    expectation.fulfill()
                }
            }) { (company) in
                debugPrint(company)
                assert(true, "Get Company by name")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetCustomerById() {
        let expectation = XCTestExpectation()
        AdminServiceImp.getCustomer(id: 2)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Get Customer fail: \(error)")
                    expectation.fulfill()
                }
            }) { (customer) in
                debugPrint(customer)
                assert(true, "Get Customer")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testAddCompany() {
        let expectation = XCTestExpectation()
        let company = Company(id: 1, name: "test_ios9", email: "test_ios9", password: "test_ios9")
        AdminServiceImp.addCompany(company: company)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Add company fail: \(error)")
                    expectation.fulfill()
                }
            }) { (company) in
                debugPrint(company)
                assert(true, "Add company")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testAddCustomer() {
        let expectation = XCTestExpectation()
        let customer = Customer(id: 1, firstName: "test_ios6", lastName: "test_ios6", email: "test_ios6", password: "test_ios6")
        AdminServiceImp.addCustomer(customer: customer)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "Add customer fail: \(error)")
                    expectation.fulfill()
                }
            }) { (costomer) in
                debugPrint(costomer)
                assert(true, "Add customer")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testUpdateCustomer() {
        let expectation = XCTestExpectation()
        let customer = Customer(id: 1, firstName: "test_ios1", lastName: "test_ios1", email: "test_ios1", password: "test_ios1")
        AdminServiceImp.updateCustomer(customer: customer)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "update customer fail: \(error)")
                    expectation.fulfill()
                }
            }) { (customer) in
                debugPrint(customer)
                assert(true, "update customer")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testUpdateComany() {
        let expectation = XCTestExpectation()
        let company = Company(id: 2, name: "test_ios9", email: "test_ios8", password: "test_ios8")
        AdminServiceImp.updateCompany(company: company)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "update cumpany fail: \(error)")
                    expectation.fulfill()
                }
            }) { (company) in
                debugPrint(company)
                assert(true, "update cumpany")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testDeleteComapny() {
        let expectation = XCTestExpectation()
        AdminServiceImp.deleteCompany(id: 2)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "delete company fail: \(error)")
                    expectation.fulfill()
                }
            }) { (company) in
                debugPrint(company)
                assert(true, "delete company")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }

    func testDeleteCustomer() {
        let expectation = XCTestExpectation()
        AdminServiceImp.deleteCustomer(id: 1)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    assert(false, "delete company fail: \(error)")
                    expectation.fulfill()
                }
            }) { (customer) in
                debugPrint(customer)
                assert(true, "delete company")
                expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 10.0)
    }
}
