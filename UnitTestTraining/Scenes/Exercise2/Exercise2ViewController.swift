//
//  Exercise2ViewController.swift
//  TrainingTest
//
//  Created by trinh.giang.dong on 9/16/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable
import MGArchitecture
import RxSwift
import RxCocoa

final class Exercise2ViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var vipSwitch: UISwitch!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: - Properties
    var disposeBag = DisposeBag()
    
    var viewModel: Exercise2ViewModel!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    deinit {
        logDeinit()
    }
    
    // MARK: - Methods

    private func configView() {
        title = "Exercise 2"
    }

    func bindViewModel() {
        let input = Exercise2ViewModel.Input(
            isVIP: vipSwitch.rx.isOn.asDriver(),
            submitTrigger: submitButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$fee
            .asDriver()
            .drive(fee)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension Exercise2ViewController {

    var fee: Binder<Int> {
        return Binder(self) { vc, fee in
            vc.showAutoCloseMessage(image: nil, title: "Charge Fee", message: "\(fee)円")
        }
    }
}

// MARK: - StoryboardSceneBased
extension Exercise2ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise2
}
