//
//  Exercise4ViewModel.swift
//  UnitTestTraining
//
//  Created by Long Vu on 9/10/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

import MGArchitecture
import RxSwift
import RxCocoa
import Foundation
import UIKit

struct Exercise4ViewModel {
    let navigator: Exercise4NavigatorType
    let useCase: Exercise4UseCaseType
}

// MARK: - ViewModelType
extension Exercise4ViewModel: ViewModel {
    
    struct Input {
        let loadTrigger: Driver<Void>
        let dateTrigger: Driver<Date>
    }

    struct Output {
        @Property var dateColor = UIColor.black
        @Property var currentDate = Date()
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let holidays = input.loadTrigger
            .map {
                self.useCase.getHolidays()
            }
        
        input.dateTrigger
            .drive(output.$currentDate)
            .disposed(by: disposeBag)
        
        Driver.combineLatest(input.dateTrigger,
                             holidays)
            .map {
                self.useCase.getDateColor(dto: GetDateColorDto(date: $0.0, holidays: $0.1))
            }
            .drive(output.$dateColor)
            .disposed(by: disposeBag)
        
        return output
    }
}
