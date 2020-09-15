//
//  Exercise7ViewController.swift
//  UnitTestTrainning
//
//  Created by dungkv-1044 on 9/14/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class Exercise7ViewController: UITableViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var cartAmountTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var totalFeeLabel: UILabel!
    @IBOutlet weak var standardFeeLabel: UILabel!
    @IBOutlet weak var quickTransportFeeLabel: UILabel!
    @IBOutlet weak var membershipSwitch: UISwitch!
    @IBOutlet weak var quickDeliverSwitch: UISwitch!
    
    // MARK: - Properties
    var viewModel: Exercise7ViewModel!
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
        title = "Exercise 7"
    }

    func bindViewModel() {
        
        let input = Exercise7ViewModel.Input(
            loadTrigger: Driver.just(()),
            isPremiumTrigger: membershipSwitch.rx.value.changed.asDriver(),
            cartAmount: cartAmountTextField.rx.text.orEmpty.asDriver(),
            isSelectQuickDeliver: quickDeliverSwitch.rx.value.changed.asDriver())
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$fee
            .asDriver()
            .map { $0.standardFee.japanCurrency }
            .drive(standardFeeLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.$fee
            .asDriver()
            .map { $0.quickFee.japanCurrency }
            .drive(quickTransportFeeLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.$fee
            .asDriver()
            .map { ($0.standardFee + $0.quickFee).japanCurrency }
            .drive(totalFeeLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.$errorMessage
            .asDriver()
            .drive(errorLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension Exercise7ViewController {

}

// MARK: - StoryboardSceneBased
extension Exercise7ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise7
}
