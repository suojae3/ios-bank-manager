//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class BankManager {
    var updateTaskState: ((TaskState) -> Void)?
    
    private var clientQueue = Queue<Client>()
    var totalDuration = 0.0
    let loanQueue = DispatchQueue(label: "loanQueue")
    let dispatchGroup = DispatchGroup()
    let semaphore = DispatchSemaphore(value: 2)
}

// MARK: - Methods
extension BankManager {
    
    func makeCustomerQueue(with customerCount: Int) {
        (1...customerCount).forEach {
            guard let task = BankTask.allCases.randomElement() else { return }
            clientQueue.enqueue(Client(number: $0, bankTask: task))
        }
    }
    
    func handleTask(completion: @escaping (Double) -> Void) {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            
            if client.bankTask == .loan { // 대출 -> serial 큐
                loanQueue.async(group: dispatchGroup) { [weak self] in
                    self?.performTask(client)
                }
            } else { // 예금 -> concurrent 큐 (스레드 2개)
                semaphore.wait() // semaphore 감소
                DispatchQueue.global().async(group: dispatchGroup) { [weak self] in
                    self?.performTask(client)
                    self?.semaphore.signal()
                }
            }
        }

        dispatchGroup.wait()
        completion(totalDuration)
//        dispatchGroup.notify(queue: .main) {
//            print("-------------------------")
//            completion(totalDuration)
//        }
    }

    
    private func performTask(_ client: Client) {
        updateTaskState?(.start(number: client.number, task: client.bankTask))
        Thread.sleep(forTimeInterval: client.bankTask.requiredTime)
        totalDuration += client.bankTask.requiredTime
        updateTaskState?(.finish(number: client.number, task: client.bankTask))
    }
}
