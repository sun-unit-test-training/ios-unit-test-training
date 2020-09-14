//
//  Exercise4ViewController.swift
//  UnitTestTraining
//
//  Created by Long Vu on 9/10/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

import UIKit
import Reusable
import MGArchitecture
import RxSwift
import RxCocoa

final class Exercise4ViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var dateBackgroundView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Properties
    
    var viewModel: Exercise4ViewModel!
    var disposeBag = DisposeBag()
    
    private let dateTrigger = BehaviorSubject<Date>(value: Date())

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configLabelWith(Date())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeBackButtonTitle()
    }

    deinit {
        logDeinit()
    }
    
    // MARK: - Methods

    private func configView() {
        title = "Exercise 4"
    }

    func bindViewModel() {
        let input = Exercise4ViewModel.Input(
            loadTrigger: Driver.just(()),
            dateTrigger: dateTrigger.asDriverOnErrorJustComplete()
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$dateColor
            .asDriver()
            .drive(onNext: { [unowned self] color in
                self.dateBackgroundView.backgroundColor = color
            })
            .disposed(by: disposeBag)
        
        output.$currentDate
            .asDriver()
            .drive(onNext: { [unowned self] date in
                self.configLabelWith(date)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        dateTrigger.onNext(sender.date)
    }
    
    private func configLabelWith(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy (EEE)"
        let selectedDate: String = dateFormatter.string(from: date)
        dateLabel.text = selectedDate
    }
}

// MARK: - Binders
extension Exercise4ViewController {

}

// MARK: - StoryboardSceneBased
extension Exercise4ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise4
}
