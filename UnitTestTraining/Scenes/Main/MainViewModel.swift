//
//  MainViewModel.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import MGArchitecture
import RxSwift
import RxCocoa
import UIKit

struct MainViewModel {
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
}

// MARK: - ViewModelType
extension MainViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }
    
    struct Output {
        @Property var exercises = [ExerciseItemViewModel]()
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let exercises = input.loadTrigger
            .map { self.useCase.getExercies() }
        
        exercises
            .map { $0.map(ExerciseItemViewModel.init(exercise:)) }
            .drive(output.$exercises)
            .disposed(by: disposeBag)
        
        input.selectTrigger
            .map { $0.row }
            .withLatestFrom(exercises) { row, exercises in
                exercises[row]
            }
            .drive(onNext: { exercise in
                switch exercise.id {
                case 1:
                    self.navigator.toExercise1()
                case 2:
                    self.navigator.toExercise2()
                case 3:
                    self.navigator.toExercise3()
                case 4:
                    self.navigator.toExercise4()
                case 5:
                    self.navigator.toExercise5()
                case 6:
                    self.navigator.toExercise6()
                case 7:
                    self.navigator.toExercise7()
                case 8:
                    self.navigator.toExercise8()
                case 9:
                    self.navigator.toExercise9()
                case 10:
                    self.navigator.toExercise10()
                case 11:
                    self.navigator.toExercise11()
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
        return output
    }
}
