//
//  Exercise4Assembler.swift
//  UnitTestTraining
//
//  Created by Long Vu on 9/10/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa

protocol Exercise4Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise4ViewController
    func resolve(navigationController: UINavigationController) -> Exercise4ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise4NavigatorType
    func resolve() -> Exercise4UseCaseType
}

extension Exercise4Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise4ViewController {
        let vc = Exercise4ViewController.instantiate()
        let vm: Exercise4ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> Exercise4ViewModel {
        return Exercise4ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise4Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise4NavigatorType {
        return Exercise4Navigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> Exercise4UseCaseType {
        return Exercise4UseCase(dateGateway: resolve())
    }
}
