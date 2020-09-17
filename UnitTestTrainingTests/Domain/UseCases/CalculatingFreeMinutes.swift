//
//  CalculatingFreeMinutes.swift
//  UnitTestTrainingTests
//
//  Created by nguyen.the.trinh on 9/18/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculateFreeMinutesTest: XCTestCase, CalculatingFreeMinute {
    override func setUp() {
        super.setUp()
    }
    
    /// Test case 1
    /// - Spent less than 2000
    /// - Not Watch Movie
    func test_calculateFreeMinutes_lessthan_2000_not_watchMovie() {
        // act
        let dto = CalculateFreeMinuteDto(watchMovie: false, moneySpent: 1000)
        let result = self.calculateFreeMinute(dto: dto)
        
        // assert
        XCTAssertEqual(result, 0.0)
    }
    
    /// Test case 2
    /// - Spent less than 2000
    /// - Watch Movie
    func test_calculateFreeMinutes_lessthan_2000_watchMovie() {
        // act
        let dto = CalculateFreeMinuteDto(watchMovie: true, moneySpent: 1000)
        let result = self.calculateFreeMinute(dto: dto)
        
        // assert
        XCTAssertEqual(result, 180.0)
    }
    
    /// Test case 3
    /// - Spent more than 2000, less than 5000
    /// - Not Watch Movie
    func test_calculateFreeMinutes_lessthan_2000_morethan_5000_not_watchMovie() {
        // act
        let dto = CalculateFreeMinuteDto(watchMovie: false, moneySpent: 2000)
        let result = self.calculateFreeMinute(dto: dto)
        
        // assert
        XCTAssertEqual(result, 60.0)
    }
    
    /// Test case 4
    /// - Spent more than 2000, less than 5000
    /// - Watch Movie
    func test_calculateFreeMinutes_lessthan_2000_morethan_5000_watchMovie() {
        // act
        let dto = CalculateFreeMinuteDto(watchMovie: true, moneySpent: 2000)
        let result = self.calculateFreeMinute(dto: dto)
        
        // assert
        XCTAssertEqual(result, 240.0)
    }
    
    /// Test case 5
    /// - Spent more than 5000
    /// - Not Watch Movie
    func test_calculateFreeMinutes_morethan_5000_not_watchMovie() {
        // act
        let dto = CalculateFreeMinuteDto(watchMovie: false, moneySpent: 5000)
        let result = self.calculateFreeMinute(dto: dto)
        
        // assert
        XCTAssertEqual(result, 120.0)
    }
    
    /// Test case 6
    /// - Spent more than 5000
    /// - Watch Movie
    func test_calculateBeerPrice() {
        // act
        let dto = CalculateFreeMinuteDto(watchMovie: false, moneySpent: 5000)
        let result = self.calculateFreeMinute(dto: dto)
        
        // assert
        XCTAssertEqual(result, 300.0)
    }
    
}
