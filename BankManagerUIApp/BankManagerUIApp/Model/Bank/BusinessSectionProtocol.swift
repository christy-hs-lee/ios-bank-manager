//
//  BusinessSectionProtocol.swift
//  BankManagerUIApp
//
//  Created by Harry on 2023/03/22.
//

import Foundation

protocol BusinessSectionProtocol {
    var isWorking: Bool { get set }
    
    func processJob(for customer: Customer, group: DispatchGroup)
}
