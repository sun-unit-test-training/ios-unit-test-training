//
//  Exersice6UseCase.swift
//  UnitTestTraining
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Dto
import RxSwift
import ValidatedPropertyKit

protocol Exercise6UseCaseType {
    func calculateFreeMinutes(dto: TayHoOrderDto) -> Double
    func validateMoneyAmount(_ amount: String) -> ValidationResult
}

struct Exercise6UseCase: Exercise6UseCaseType, CalculatingFreeMinutes {
    
}
