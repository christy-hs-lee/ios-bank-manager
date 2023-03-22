//
//  StubBusinessSection.swift
//  BankTests
//
//  Created by Harry on 2023/03/22.
//

import Foundation
@testable import BankManagerUIApp

class StubBusinessSection: BusinessSectionProtocol {
    var isWorking: Bool = true
    var customer: Customer?
    var group: DispatchGroup?
    
    func processJob(for customer: Customer, group: DispatchGroup) {
        self.customer = customer
        self.group = group
    }
}
