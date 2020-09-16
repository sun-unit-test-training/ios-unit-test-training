//
//  CalculateFeeTest.swift
//  UnitTestTrainingTests
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculateFeeTest: XCTestCase, CalculatingFee, GettingDates {
    var dateGateway: DateGatewayType {
        return dateGatewayMock
    }
    
    private var dateGatewayMock: DateGatewayMock!

    override func setUp() {
        super.setUp()
        
        dateGatewayMock = DateGatewayMock()
    }
    
    private func createDayWith(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 7)
        return formatter.date(from: string) ?? Date()
    }
    
    func test_VIPAccount() {
        let dto = CalculateChargeFeeDto(isVIP: true, date: Date(), holidays: self.getHolidays())
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_normalAccount_normalDay_freeTime() {
        let date = createDayWith(string: "2020/09/16 09:00:00")
        let dto = CalculateChargeFeeDto(isVIP: false, date: date, holidays: self.getHolidays())
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_normalAccount_normalDay_notFreeTime() {
        let date = createDayWith(string: "2020/09/16 01:00:00")
        let dto = CalculateChargeFeeDto(isVIP: false, date: date, holidays: self.getHolidays())
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result, 110)
    }
    
    func test_normalAccount_weekend_freeTime() {
        let date = createDayWith(string: "2020/09/19 08:45:00")
        let dto = CalculateChargeFeeDto(isVIP: false, date: date, holidays: self.getHolidays())
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result, 110)
    }
    
    func test_normalAccount_holiday_notFreeTime() {
        let date = createDayWith(string: "2020/04/30 18:30:00")
        let dto = CalculateChargeFeeDto(isVIP: false, date: date, holidays: self.getHolidays())
        let result = self.calculateFee(dto: dto)
        
        XCTAssertEqual(result, 110)
    }

}
