//
//  Exercise6ViewController.swift
//  UnitTestTraining
//
//  Created by nguyen.the.trinh on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class Exercise6ViewController: UITableViewController, Bindable {
   // MARK: - Properties
    
    @IBOutlet weak var moneySpentTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var freeMinutesLabel: UILabel!
    @IBOutlet weak var watchMovieSwitch: UISwitch!
    
    var viewModel: Exercise6ViewModel!
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
        title = "Exercise 6"
    }
    
    func bindViewModel() {
        let input = Exercise6ViewModel.Input(
            loadTrigger: Driver.just(()),
            isWatchMovieTrigger: watchMovieSwitch.rx.value.changed.asDriverOnErrorJustComplete(),
            moneySpentTrigger: moneySpentTextField.rx.text.orEmpty.changed.asDriverOnErrorJustComplete()
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$freeMinutes
            .asDriver()
            .drive(freeMinutesLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.$errorMessage
            .asDriver()
            .drive(errorMessageLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension Exercise6ViewController {

}

// MARK: - StoryboardSceneBased
extension Exercise6ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise6
}

