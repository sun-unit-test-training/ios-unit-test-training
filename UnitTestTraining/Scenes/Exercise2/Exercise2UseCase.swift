//
//  Exercise2UseCase.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation
import UIKit

protocol Exercise2UseCaseType {
    func getHolidays() -> [Date]
    func calculateFee(dto: CalculateChargeFeeDto) -> Int
}

struct Exercise2UseCase: Exercise2UseCaseType, CalculatingFee, GettingDates {
    var dateGateway: DateGatewayType
}
