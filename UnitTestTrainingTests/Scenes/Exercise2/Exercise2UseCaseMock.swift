//
//  Exercise2UseCaseMock.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import Dto

final class Exercise2UseCaseMock: Exercise2UseCaseType {
    
    var getHolidays_Called = false
    var getHolidays_Values = [Date()]
    func getHolidays() -> [Date] {
        getHolidays_Called = true
        return getHolidays_Values
    }
    
    var calculateFee_Called = false
    var calculateFee_Values = 0
    func calculateFee(dto: CalculateChargeFeeDto) -> Int {
        calculateFee_Called = true
        return calculateFee_Values
    }
}
