//
//  Exercise4UseCaseMock.swift
//  UnitTestTraining
//
//  Created by Long Vu on 9/10/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

@testable import UnitTestTraining
import RxSwift
import Foundation
import UIKit

final class Exercise4UseCaseMock: Exercise4UseCaseType {
    
    // MARK: - getHolidays
    
    var getHolidaysCalled = false
    var getHolidaysReturnValue = [Date()]
    
    func getHolidays() -> [Date] {
        getHolidaysCalled = true
        return getHolidaysReturnValue
    }
    
    // MARK: - getDateColor
    
    var getDateColorCalled = false
    var getDateColorCalledReturnValue = UIColor.black
    
    func getDateColor(dto: GetDateColorDto) -> UIColor {
        getDateColorCalled = true
        return getDateColorCalledReturnValue
    }
}
