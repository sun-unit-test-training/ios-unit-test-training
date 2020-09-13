//
//  Exercise1ViewController.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class Exercise1ViewController: UITableViewController, Bindable {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var voucherSwitch: UISwitch!
    @IBOutlet weak var promotionTimeSwitch: UISwitch!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: Exercise1ViewModel!
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
        title = "Exercise 1"
    }
    
    func bindViewModel() {
        let input = Exercise1ViewModel.Input(
            loadTrigger: Driver.just(()),
            voucherTrigger: voucherSwitch.rx.value.changed.asDriver(),
            promotionTimeTrigger: promotionTimeSwitch.rx.value.changed.asDriver()
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$price
            .asDriver()
            .drive(priceLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension Exercise1ViewController {
    
}

// MARK: - StoryboardSceneBased
extension Exercise1ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise1
}
