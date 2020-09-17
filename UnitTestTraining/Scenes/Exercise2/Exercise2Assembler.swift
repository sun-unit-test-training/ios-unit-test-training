//
//  Exercise2Assembler.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import UIKit

protocol Exercise2Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise2ViewController
    func resolve(navigationController: UINavigationController) -> Exercise2ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise2NavigatorType
    func resolve() -> Exercise2UseCaseType
}

extension Exercise2Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise2ViewController {
        let vc = Exercise2ViewController.instantiate()
        let vm: Exercise2ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> Exercise2ViewModel {
        return Exercise2ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise2Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise2NavigatorType {
        return Exercise2Navigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> Exercise2UseCaseType {
        return Exercise2UseCase(dateGateway: resolve())
    }
}
