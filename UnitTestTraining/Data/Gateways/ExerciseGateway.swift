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
        return [
            Exercise(title: "Exercise 1", description: "Bia hơi Keangnam"),
            Exercise(title: "Exercise 2", description: "Cây ATM"),
            Exercise(title: "Exercise 3", description: "Quần áo nam trên Hoàn Kiếm"),
            Exercise(title: "Exercise 4", description: "Ứng dụng Calendar"),
            Exercise(title: "Exercise 5", description: "Cửa hàng pizza"),
            Exercise(title: "Exercise 6", description: "Trung tâm mua sắm Tây Hồ"),
            Exercise(title: "Exercise 7", description: "Vietnam Mart"),
            Exercise(title: "Exercise 8", description: "Sân chơi cầu lông"),
            Exercise(title: "Exercise 9", description: "Game Hanoi Quest"),
            Exercise(title: "Exercise 10", description: "Nhà hàng Nam Từ Liêm")
        ]
    }
}
