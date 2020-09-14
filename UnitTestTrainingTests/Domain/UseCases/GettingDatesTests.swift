//
//  GettingDatesTests.swift
//  UnitTestTrainingTests
//
//  Created by vu.thanh.long on 9/11/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift

final class GettingDatesTests: XCTestCase, GettingDates {
    var dateGateway: DateGatewayType {
        return dateGatewayMock
    }
    
    private var dateGatewayMock: DateGatewayMock!
    
    override func setUp() {
        super.setUp()
        dateGatewayMock = DateGatewayMock()
    }
    
    func test_getHolidays() {
        // act
        let result = self.getHolidays()
        
        // assert
        XCTAssert(dateGatewayMock.getHolidaysCalled)
        XCTAssertEqual(result.count, 276)
    }
    
    private func createDayWith(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 7)
        return formatter.date(from: string) ?? Date()
    }
    
    /// Test case 1
    /// - Holiday
    /// - is Saturday
    func test_dateColor_holiday_isSaturday() {
        let result = self.getDateColor(dto: GetDateColorDto(date: createDayWith(string: "2021/05/01"),
                                                            holidays: self.getHolidays()))
        XCTAssertEqual(result, UIColor.red)
    }
    
    /// Test case 2
    /// - Holiday
    /// - is Sunday
    func test_dateColor_holiday_isSunday() {
        let result = self.getDateColor(dto: GetDateColorDto(date: createDayWith(string: "2018/09/02"),
                                                            holidays: self.getHolidays()))
        
        XCTAssertEqual(result, UIColor.red)
    }
    
    /// Test case 3
    /// - Holiday
    /// - is Normal
    func test_dateColor_holiday_isNormal() {
        let result = self.getDateColor(dto: GetDateColorDto(date: createDayWith(string: "2020/09/02"),
                                                            holidays: self.getHolidays()))
        
        XCTAssertEqual(result, UIColor.red)
    }
    
    /// Test case 4
    /// - not Holiday
    /// - is Saturday
    func test_dateColor_notHoliday_isSaturday() {
        let result = self.getDateColor(dto: GetDateColorDto(date: createDayWith(string: "2020/09/12"),
                                                            holidays: self.getHolidays()))
        
        XCTAssertEqual(result, UIColor.blue)
    }
    
    /// Test case 5
    /// - not Holiday
    /// - is Sunday
    func test_dateColor_notHoliday_isSunday() {
        let result = self.getDateColor(dto: GetDateColorDto(date: createDayWith(string: "2020/09/13"),
                                                            holidays: self.getHolidays()))
        
        XCTAssertEqual(result, UIColor.red)
    }
    
    /// Test case 6
    /// - not Holiday
    /// - is Normal
    func test_dateColor_notHoliday_isNormal() {
        let result = self.getDateColor(dto: GetDateColorDto(date: createDayWith(string: "2020/09/14"),
                                                            holidays: self.getHolidays()))
        
        XCTAssertEqual(result, UIColor.black)
    }
}

