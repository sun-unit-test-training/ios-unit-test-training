//
//  Exercise8UseCase.swift
//  UnitTestTraining
//
//  Created by dungkv-1044 on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//
import Dto

protocol Exercise8UseCaseType {
    func validateAge(_ age: String) -> ValidationResult
    func calculatePlayFee(dto: CalculateBadmintonFeeDto) -> Double
}

struct Exercise8UseCase: Exercise8UseCaseType, CalculateBadmintonFee {

}
