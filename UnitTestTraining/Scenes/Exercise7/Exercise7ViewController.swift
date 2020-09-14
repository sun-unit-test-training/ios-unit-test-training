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
    
    @IBOutlet weak var lbTotalFee: UILabel!
    @IBOutlet weak var lbStandardFee: UILabel!
    @IBOutlet weak var lbQTFee: UILabel!
    @IBOutlet weak var swMemberShip: UISwitch!
    @IBOutlet weak var swCartAmount: UISwitch!
    @IBOutlet weak var swQuickDeliver: UISwitch!
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
            isPremiumTrigger: swMemberShip.rx.value.changed.asDriver(),
            isCartAmountGreaterThan5000: swCartAmount.rx.value.changed.asDriver(),
            isSelectQuickDeliver: swQuickDeliver.rx.value.changed.asDriver())
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.$fee
            .asDriver()
            .map { $0.standardFee.japanCurrency }
            .drive(lbStandardFee.rx.text)
            .disposed(by: disposeBag)
        
        output.$fee
        .asDriver()
            .map { $0.quickFee.japanCurrency }
        .drive(lbQTFee.rx.text)
        .disposed(by: disposeBag)
        
        output.$fee
        .asDriver()
            .map { ($0.standardFee + $0.quickFee).japanCurrency }
        .drive(lbTotalFee.rx.text)
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
