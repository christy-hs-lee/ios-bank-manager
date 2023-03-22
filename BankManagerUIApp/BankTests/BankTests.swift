//
//  BankTests.swift
//  BankTests
//
//  Created by Harry on 2023/03/22.
//

import XCTest
@testable import BankManagerUIApp

final class BankTests: XCTestCase {
    var sut: Bank!
    var loanSection: StubBusinessSection!
    var depositSection: StubBusinessSection!
    
    override func setUp() {
        loanSection = StubBusinessSection()
        depositSection = StubBusinessSection()
        sut = Bank(loanSection: loanSection, depositSection: depositSection)
    }

    override func tearDown() {
        sut = nil
        loanSection = nil
        depositSection = nil
    }
    
    func test_startBankService_호출시_Section에_customer가_전달된다() {
        let customer = Customer(waitingNumber: 1)!
        sut.setUpCustomerQueue(customers: [customer])
        let expectedResult = customer.waitingNumber
        
        sut.startBankService()
        
        XCTAssertEqual(expectedResult, loanSection.customer?.waitingNumber)
    }
}
