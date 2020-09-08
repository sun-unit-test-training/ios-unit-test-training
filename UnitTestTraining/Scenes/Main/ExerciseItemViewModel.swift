//
//  ExerciseItemViewModel.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

struct ExerciseItemViewModel {
    let title: String
    
    init(exercise: MainViewModel.Exercise) {
        self.title = exercise.title
    }
}
