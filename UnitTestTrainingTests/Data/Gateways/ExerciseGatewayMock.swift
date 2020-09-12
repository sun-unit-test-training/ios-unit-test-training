//
//  ExerciseGatewayMock.swift
//  UnitTestTrainingTests
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining

final class ExerciseGatewayMock: ExerciseGatewayType {
    
    // MARK: - getExercies
    
    var getExerciesCalled = false
    var getExerciesReturnValue = (1...5).map { Exercise(title: "Exercise \($0)") }
    
    func getExercies() -> [Exercise] {
        getExerciesCalled = true
        return getExerciesReturnValue
    }
}
