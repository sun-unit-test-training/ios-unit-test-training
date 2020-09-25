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
    
    var getHolidaysCalled = false
    var getHolidaysValues = [Date()]
    
    func getHolidays() -> [Date] {
        getHolidaysCalled = true
        return getHolidaysValues
    }
    
    var calculateFeeCalled = false
    var calculateFeeValues = 0
    
    func calculateFee(dto: ATMWithdrawalDto) -> Int {
        calculateFeeCalled = true
        return calculateFeeValues
    }
}
