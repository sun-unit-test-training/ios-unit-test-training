//
//  Exercise8ViewController.swift
//  UnitTestTraining
//
//  Created by dungkv-1044 on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable
import MGArchitecture
import RxSwift
import RxCocoa

final class Exercise8ViewController: UITableViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: Exercise8ViewModel!
    var disposeBag = DisposeBag()
    
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
        title = "Exercise 8"
    }

    func bindViewModel() {
        let input = Exercise8ViewModel.Input(loadTrigger: Driver.just(()),
                                             ageTrigger: ageTextField.rx.text.orEmpty.asDriver(),
                                             isMaleTrigger: genderSwitch.rx.value.changed.asDriver(),
                                             dateTrigger: datePicker.rx.value.changed.asDriver())
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$errorMessage
            .asDriver()
            .drive(errorMessageLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.$fee
            .asDriver()
            .map { $0.japanCurrency }
            .drive(feeLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.$genderString
            .asDriver()
            .drive(genderLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension Exercise8ViewController {

}

// MARK: - StoryboardSceneBased
extension Exercise8ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise8
}
