//
//  GettingExercises.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/12/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol GettingExercises {
    var exerciseGateway: ExerciseGatewayType { get }
}

extension GettingExercises {
    func getExercies() -> [Exercise] {
        return exerciseGateway.getExercies()
    }
}
