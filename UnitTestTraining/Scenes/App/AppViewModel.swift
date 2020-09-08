//
//  AppViewModel.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

// MARK: - ViewModelType
extension AppViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        
    }
    
    @discardableResult
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        input.loadTrigger
            .do(onNext: navigator.toMain)
            .drive()
            .disposed(by: disposeBag)
        
        return Output()
    }
}
