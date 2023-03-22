//
//  StateChangeable.swift
//  BankManagerUIApp
//
//  Created by brody, christy, harry on 2023/03/23.
//

import Foundation

protocol StateChangeable {
    func start(handler: @escaping () -> ())
    func cancel() 
}

