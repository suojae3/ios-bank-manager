//
//  TaskState.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

enum TaskState {
    case start(number: Int, task: BankTask)
    case finish(number: Int, task: BankTask)
}
