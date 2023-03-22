//
//  StubBusinessTimer.swift
//  BankTests
//
//  Created by brody, christy, harry on 2023/03/16.
//

import Foundation
@testable import BankManagerUIApp

class StubBusinessTimer: StateChangeable {
    var count: Int = 0
    func start(handler: @escaping () -> ()) {}
    
    func cancel() {
        count += 1
    }
}
