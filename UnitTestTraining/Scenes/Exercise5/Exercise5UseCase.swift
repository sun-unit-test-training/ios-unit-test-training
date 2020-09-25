//
//  Exercise5UseCase.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import Dto
import ValidatedPropertyKit

protocol Exercise5UseCaseType {
    func calculateFee(dto: PizzaOrderDto) -> CalculatePizzaFeeResult
    func validatePizzaPrice(_ price: String) -> ValidationResult
}

struct Exercise5UseCase: Exercise5UseCaseType, CalculatePizzaFee {
}
