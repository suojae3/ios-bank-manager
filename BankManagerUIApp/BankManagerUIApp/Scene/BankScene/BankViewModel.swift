//
//  BankViewModel.swift
//  BankManagerUIApp
//
//  Created by ㅣ on 2/8/24.
//

import Foundation

final class BankViewModel: ViewModel {
    
    let timeHandler: TimerHandler
    var output = Output()
    init(timeHandler: TimerHandler) {
        self.timeHandler = timeHandler
    }
    
    final class Input {
        var addCustomerButtonTapped: (()->Void)?
        var resetButtonTapped: (()->Void)?
    }
    
    final class Output {
        var updatedTimerString: ((String)->Void)?
    }
    
    func transform(input: Input) -> Output {
        input.addCustomerButtonTapped = { [weak self] in
            self?.timeHandler.startTimer()
        }

        output.updatedTimerString = (timeHandler.timeString)
    
        return output
    }

}
