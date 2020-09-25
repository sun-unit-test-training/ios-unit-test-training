//
//  CalculateRestaurantPromotionTests.swift
//  UnitTestTrainingTests
//
//  Created by can.khac.nguyen on 9/24/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest
import RxSwift
import RxCocoa

final class CalculateRestaurantPromotionTests: XCTestCase, CalculateRestaurantPromotion {
    
    override func setUp() {
        super.setUp()
    }
    
    // MARK: - Tests case for silver member
    
    func test_silverRank_cardValue3000() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .silver,
                                                  prepaidPaymentLimit: 3000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 1)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_silverRank_cardValue5000_participateLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .silver,
                                                  prepaidPaymentLimit: 5000,
                                                  participateLottery: true)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 2)
        XCTAssert(result.haveCoupon)
    }
    
    func test_silverRank_cardValue5000_skipLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .silver,
                                                  prepaidPaymentLimit: 5000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 2)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_silverRank_cardValue10000_participateLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .silver,
                                                  prepaidPaymentLimit: 10000,
                                                  participateLottery: true)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 4)
        XCTAssert(result.haveCoupon)
    }
    
    func test_silverRank_cardValue10000_skipLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .silver,
                                                  prepaidPaymentLimit: 10000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 4)
        XCTAssertFalse(result.haveCoupon)
    }
    
    // MARK: - Tests case for gold member
    
    func test_goldRank_cardValue3000() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .gold,
                                                  prepaidPaymentLimit: 3000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 3)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_goldRank_cardValue5000_participateLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .gold,
                                                  prepaidPaymentLimit: 5000,
                                                  participateLottery: true)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 5)
        XCTAssert(result.haveCoupon)
    }
    
    func test_goldRank_cardValue5000_skipLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .gold,
                                                  prepaidPaymentLimit: 5000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 5)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_goldRank_cardValue10000_participateLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .gold,
                                                  prepaidPaymentLimit: 10000,
                                                  participateLottery: true)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 10)
        XCTAssert(result.haveCoupon)
    }
    
    func test_goldRank_cardValue10000_skipLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .gold,
                                                  prepaidPaymentLimit: 10000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 10)
        XCTAssertFalse(result.haveCoupon)
    }
    
    // MARK: - Tests case for black member
    
    func test_blackRank_cardValue3000() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .black,
                                                  prepaidPaymentLimit: 3000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 5)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_blackRank_cardValue5000_participateLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .black,
                                                  prepaidPaymentLimit: 5000,
                                                  participateLottery: true)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 7)
        XCTAssert(result.haveCoupon)
    }
    
    func test_blackRank_cardValue5000_skipLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .black,
                                                  prepaidPaymentLimit: 5000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 7)
        XCTAssertFalse(result.haveCoupon)
    }
    
    func test_blackRank_cardValue10000_participateLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .black,
                                                  prepaidPaymentLimit: 10000,
                                                  participateLottery: true)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 15)
        XCTAssert(result.haveCoupon)
    }
    
    func test_blackRank_cardValue10000_skipLottery() {
        let dto = CalculateRestaurantPromotionDto(memberRank: .black,
                                                  prepaidPaymentLimit: 10000,
                                                  participateLottery: false)
        let result = calculateRestaurantPromotion(dto: dto)
        XCTAssertEqual(result.discount, 15)
        XCTAssertFalse(result.haveCoupon)
    }
}
