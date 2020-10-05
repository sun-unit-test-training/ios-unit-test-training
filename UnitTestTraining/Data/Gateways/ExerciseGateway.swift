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
            Exercise(id: 1, title: "Exercise 1", description: "Bia hơi Keangnam"),
            Exercise(id: 2, title: "Exercise 2", description: "Cây ATM"),
            Exercise(id: 3, title: "Exercise 3", description: "Quần áo nam trên Hoàn Kiếm"),
            Exercise(id: 4, title: "Exercise 4", description: "Ứng dụng Calendar"),
            Exercise(id: 5, title: "Exercise 5", description: "Cửa hàng pizza"),
            Exercise(id: 6, title: "Exercise 6", description: "Trung tâm mua sắm Tây Hồ"),
            Exercise(id: 7, title: "Exercise 7", description: "Vietnam Mart"),
            Exercise(id: 8, title: "Exercise 8", description: "Sân chơi cầu lông"),
            Exercise(id: 9, title: "Exercise 9", description: "Game Hanoi Quest"),
            Exercise(id: 10, title: "Exercise 10", description: "Nhà hàng Nam Từ Liêm"),
            Exercise(id: 11, title: "Exercise 11", description: "News API")
        ]
    }
}
