//
//  Exercise2ViewModel.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import MGArchitecture
import RxSwift
import RxCocoa
import UIKit
import Foundation

struct Exercise2ViewModel {
    let navigator: Exercise2NavigatorType
    let useCase: Exercise2UseCaseType
}

// MARK: - ViewModelType
extension Exercise2ViewModel: ViewModel {
    struct Input {
        let isVIP: Driver<Bool>
        let submitTrigger: Driver<Void>
    }

    struct Output {
        @Property var fee: Int = 0
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        input.submitTrigger
            .withLatestFrom(input.isVIP)
            .map { isVIP -> Int in
                let holidays = self.useCase.getHolidays()
                let dto = CalculateChargeFeeDto(isVIP: isVIP,
                                                date: Date(),
                                                holidays: holidays)
                return self.useCase.calculateFee(dto: dto)
            }
            .drive(output.$fee)
            .disposed(by: disposeBag)
        
        return output
    }
}
