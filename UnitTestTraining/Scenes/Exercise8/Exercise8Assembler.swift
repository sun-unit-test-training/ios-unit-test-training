//
//  Exercise8Assembler.swift
//  UnitTestTraining
//
//  Created by dungkv-1044 on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa

protocol Exercise8Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise8ViewController
    func resolve(navigationController: UINavigationController) -> Exercise8ViewModel
    func resolve(navigationController: UINavigationController) -> Exercise8NavigatorType
    func resolve() -> Exercise8UseCaseType
}

extension Exercise8Assembler {
    func resolve(navigationController: UINavigationController) -> Exercise8ViewController {
        let vc = Exercise8ViewController.instantiate()
        let vm: Exercise8ViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> Exercise8ViewModel {
        return Exercise8ViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension Exercise8Assembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> Exercise8NavigatorType {
        return Exercise8Navigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> Exercise8UseCaseType {
        return Exercise8UseCase()
    }
}
