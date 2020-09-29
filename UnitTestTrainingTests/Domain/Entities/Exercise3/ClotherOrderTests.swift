//
//  ClotherOrderTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/30/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class ClotherOrderTests: XCTestCase {
    
    var clotherOrder: ClotherOrder!
    
    func test_havingWhiteShirt() {
        // arrange
        clotherOrder = ClotherOrder(items: [
            ClotherOrderItem(total: 1, type: .whiteShirt)
        ])
        
        // assert
        XCTAssert(clotherOrder.havingWhiteShirt)
        XCTAssertEqual(clotherOrder.totalItemsCount, 1)
    }
    
    func test_havingTie() {
        // arrange
        clotherOrder = ClotherOrder(items: [
            ClotherOrderItem(total: 2, type: .tie)
        ])
        
        // assert
        XCTAssert(clotherOrder.havingTie)
        XCTAssertEqual(clotherOrder.totalItemsCount, 2)
    }
    
    func test_addItem() {
        // arrange
        clotherOrder = ClotherOrder(items: [
            ClotherOrderItem(total: 0, type: .whiteShirt)
        ])
        
        // act
        clotherOrder.add(ClotherOrderItem(total: 1, type: .whiteShirt))
        
        // assert
        XCTAssert(clotherOrder.havingWhiteShirt)
        XCTAssertEqual(clotherOrder.totalItemsCount, 1)
    }
    
    func test_subtractItem_noItem() {
        // arrange
        clotherOrder = ClotherOrder(items: [
            ClotherOrderItem(total: 0, type: .whiteShirt)
        ])
        
        // act
        clotherOrder.subtract(ClotherOrderItem(total: 1, type: .whiteShirt))
        
        // assert
        XCTAssertFalse(clotherOrder.havingWhiteShirt)
        XCTAssertEqual(clotherOrder.totalItemsCount, 0)
    }
    
    func test_subtractItem() {
        // arrange
        clotherOrder = ClotherOrder(items: [
            ClotherOrderItem(total: 1, type: .whiteShirt)
        ])
        
        // act
        clotherOrder.subtract(ClotherOrderItem(total: 1, type: .whiteShirt))
        
        // assert
        XCTAssertFalse(clotherOrder.havingWhiteShirt)
        XCTAssertEqual(clotherOrder.totalItemsCount, 0)
    }
    
    func test_subtractItem_remain() {
        // arrange
        clotherOrder = ClotherOrder(items: [
            ClotherOrderItem(total: 2, type: .whiteShirt)
        ])
        
        // act
        clotherOrder.subtract(ClotherOrderItem(total: 1, type: .whiteShirt))
        
        // assert
        XCTAssert(clotherOrder.havingWhiteShirt)
        XCTAssertEqual(clotherOrder.totalItemsCount, 1)
    }

}
