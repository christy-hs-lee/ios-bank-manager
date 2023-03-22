//
//  BankWorkable.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

import Foundation

protocol BankWorkable {
    var bankDispatchQueue: DispatchQueue { get }
    var bankSemaphore: DispatchSemaphore { get }
    var businessType: BusinessType { get }
    var isWorking: Bool { get set }
    
    func processJob(for customer: Customer, group: DispatchGroup)
}
