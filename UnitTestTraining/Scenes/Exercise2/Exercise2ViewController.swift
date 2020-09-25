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

final class Exercise2ViewController: UITableViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var vipSwitch: UISwitch!
    @IBOutlet weak var feeLabel: UILabel!
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
            isVIPTrigger: vipSwitch.rx.isOn.asDriver(),
            dateTrigger: datePicker.rx.value.asDriver(),
            submitTrigger: submitButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$fee
            .asDriver()
            .drive(fee)
            .disposed(by: disposeBag)
        
        output.$pickedDate
            .asDriver()
            .drive(pickedDate)
            .disposed(by: disposeBag)
    }
    
    private func configLabelWith(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        let selectedDate: String = dateFormatter.string(from: date)
        dateLabel.text = selectedDate
    }
}

// MARK: - Binders
extension Exercise2ViewController {
    
    var pickedDate: Binder<Date> {
        return Binder(self) { vc, date in
            vc.configLabelWith(date)
        }
    }

    var fee: Binder<Int> {
        return Binder(self) { vc, fee in
            vc.feeLabel.text = "Fee: \(fee)円"
        }
    }
}

// MARK: - StoryboardSceneBased
extension Exercise2ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise2
}
