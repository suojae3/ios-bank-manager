//
//  BankViewModel.swift
//  BankManagerUIApp
//
//  Created by ㅣ on 2/8/24.
//

import Foundation

class Repository {
    
    private var waitingQueue: [Client] = []
    
    func getData(onCompleted: @escaping (Client) -> Void) {
        onCompleted(Client(number: 1, bankTask: .loan))
    }
}

final class BankViewModel {

    let timeHandler: TimerHandler
    let repository = Repository()
    
    init(timeHandler: TimerHandler) {
        self.timeHandler = timeHandler
    }
    
    var waitingClients: Observable<[Client]> = Observable([])
    
    // 레포지토리에서 데이터를 받아오는 메서드
    func fetchData() {
        repository.getData { newClient in
            self.waitingClients.value.append(newClient)
        }
    }
}
