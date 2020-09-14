//
//  Exercise4UseCase.swift
//  UnitTestTraining
//
//  Created by Long Vu on 9/10/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

import RxSwift
import Foundation
import UIKit

protocol Exercise4UseCaseType {
    func getHolidays() -> [Date]
    func getDateColor(dto: GetDateColorDto) -> UIColor
}

struct Exercise4UseCase: Exercise4UseCaseType, GettingDates {
    var dateGateway: DateGatewayType
    
}
