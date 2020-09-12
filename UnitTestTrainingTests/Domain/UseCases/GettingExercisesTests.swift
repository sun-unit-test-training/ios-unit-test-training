//
//  GettingExercisesTests.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining
import XCTest

final class GettingExercisesTests: XCTestCase, GettingExercises {
    var exerciseGateway: ExerciseGatewayType {
        return exerciseGatewayMock
    }
    
    private var exerciseGatewayMock: ExerciseGatewayMock!
    
    override func setUp() {
        super.setUp()
        exerciseGatewayMock = ExerciseGatewayMock()
    }
    
    func test_loadTrigger_getExerciesList() {
        // act
        let result = self.getExercies()
        
        // assert
        XCTAssert(exerciseGatewayMock.getExerciesCalled)
        XCTAssertEqual(result.count, 5)
    }
}
