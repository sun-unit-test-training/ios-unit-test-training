//
//  Exercise11Assembler.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable

protocol Exercise11Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise11ViewController
    func resolve(navigationController: UINavigationController) -> Exercise11ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise11NavigatorType
    func resolve() -> Exercise11UseCaseType
}

extension Exercise11Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise11ViewController {
        let vc = Exercise11ViewController.instantiate()
        let vm: Exercise11ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> Exercise11ViewModel {
        return Exercise11ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise11Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise11NavigatorType {
        return Exercise11Navigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> Exercise11UseCaseType {
        return Exercise11UseCase(articleGateway: resolve())
    }
}
