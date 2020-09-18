//
//  Exercise6UseCaseMock.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import Foundation
import Dto

final class Exercise6UseCaseMock: Exercise6UseCaseType {
    
    var calculateFreeMinutesCalled = false
    var calculateFreeMinutesReturnValue = 0.0
    var watchMovie = false
    var moneySpent = 0.0
    
    var isvalidateMoneySpentCalled = false
    var validateMoneySpentSuccess = ValidationResult.success(())
    
    func calculateFreeMinutes(dto: CalculateFreeMinutesDto) -> Double {
        calculateFreeMinutesCalled = true
        watchMovie = dto.isWatchMovie
        moneySpent = dto.moneySpent
        return calculateFreeMinutesReturnValue
    }
    
    func validateMoneyAmount(_ amount: String) -> ValidationResult {
        isvalidateMoneySpentCalled = true
        return validateMoneySpentSuccess
    }
}
