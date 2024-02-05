//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/02/01.
//

import Foundation

struct Client {
    let number: Int
    let bankTask: BankTask
    
    init(number: Int, bankTask: BankTask) {
        self.number = number
        self.bankTask = bankTask
    }
}
