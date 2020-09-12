//
//  ExerciseGateway.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol ExerciseGatewayType {
    func getExercies() -> [Exercise]
}

struct ExerciseGateway: ExerciseGatewayType {
    func getExercies() -> [Exercise] {
        return (1...10).map { Exercise(title: "Exercise \($0)") }
    }
}
