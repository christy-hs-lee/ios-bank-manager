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
    var timer: StubBusinessTimer!
    
    override func setUp() {
        loanSection = StubBusinessSection()
        depositSection = StubBusinessSection()
        timer = StubBusinessTimer()
        sut = Bank(loanSection: loanSection, depositSection: depositSection, timer: timer)
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
        
        switch customer.businessType {
        case .deposit:
            XCTAssertEqual(expectedResult, depositSection.customer?.waitingNumber)
        case .loan:
            XCTAssertEqual(expectedResult, loanSection.customer?.waitingNumber)
        }
    }
    
    func test_startBankService_호출시_cancel이_한번만_호출된다() {
        // given
        let customer = Customer(waitingNumber: 1)!
        sut.setUpCustomerQueue(customers: [customer])
        
        // when
        sut.startBankService()
                
        // then
        XCTAssertEqual(timer.count, 1)
    }
}
