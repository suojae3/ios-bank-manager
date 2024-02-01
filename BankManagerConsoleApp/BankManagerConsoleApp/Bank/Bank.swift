//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class Bank {
    
    private let bankManager: BankManager
    private var customerCount: Int?
    private let startNumber: Int = 1
    private let userChoiceRange: ClosedRange<Int> = 1...2
    private let customerCountRange: ClosedRange<Int> = 10...30
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    func open() async {
        print(Message.default.showMessage())
        print(Message.userInput.showMessage(), terminator: "")
        
        let userInput = readLine()
        
        do {
            customerCount = try validateUserInput(with: userInput)
            await startTask()
        } catch {
            print(Message.inputError.showMessage())
            await open()
        }
    }
    
    private func validateUserInput(with userInput: String?) throws -> Int? {
        guard let userInput,
              let userChoice = Int(userInput),
              userChoiceRange.contains(userChoice)
        else {
            throw BankError.inputError
        }
        
        return userChoice == startNumber ? Int.random(in: customerCountRange) : nil
    }
    
    private func showProcessState() {
        bankManager.updateTaskState = { result in
            switch result {
            case .start(let num):
                print(Message.startTask(number: num).showMessage())
            case .finish(let num):
                print(Message.finishTask(number: num).showMessage())
            }
        }
    }
    
    private func startTask() async {
        guard let customerCount = customerCount else { return }
        await bankManager.makeCustomerQueue(with: customerCount)
        showProcessState()
        await bankManager.handleTask { totalDuration in
            let duration: Double = round(totalDuration * 100) / 100
            print(Message.report(count: customerCount, duration: duration).showMessage())
        }
        await open()
    }
}
