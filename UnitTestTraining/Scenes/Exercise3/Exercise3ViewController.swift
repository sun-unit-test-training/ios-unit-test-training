//
//  Exercise3ViewController.swift
//  UnitTestTraining
//
//  Created by Nguyen.dong.son on 9/11/20.
//  Copyright © 2020 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa
import MGArchitecture

final class Exercise3ViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets

    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: Exercise3ViewModel!
    var disposeBag = DisposeBag()
    
    private let minusTrigger = PublishSubject<IndexPath>()
    private let addTrigger = PublishSubject<IndexPath>()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
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
        title = "Exercise 3"
        tableView.do {
            $0.register(cellType: ClotherCell.self)
            $0.estimatedRowHeight = 220
            $0.rowHeight = UITableView.automaticDimension
        }
    }

    func bindViewModel() {
        let input = Exercise3ViewModel.Input(loadTrigger: Driver.just(()),
                                             addTrigger: addTrigger.asDriverOnErrorJustComplete(),
                                             minusTrigger: minusTrigger.asDriverOnErrorJustComplete())
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$clotherList
            .asDriver()
            .drive(tableView.rx.items) { [weak self] tableView, index, clother in
                return tableView.dequeueReusableCell(
                    for: IndexPath(row: index, section: 0),
                    cellType: ClotherCell.self
                    )
                    .then {
                        $0.bindViewModel(clother)
                        $0.selectionStyle = .none
                        $0.addButtonAction = { [weak self] in
                            self?.addTrigger.onNext(IndexPath(row: index, section: 0))
                        }
                        
                        $0.minusButtonAction = { [weak self] in
                            self?.minusTrigger.onNext(IndexPath(row: index, section: 0))
                        }
                    }
            }
            .disposed(by: disposeBag)
        
        output.$discount
            .asDriver()
            .drive(onNext: {[unowned self] discount in
                self.discountLabel.text = "Discount \(discount)"
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension Exercise3ViewController {

}

// MARK: - StoryboardSceneBased
extension Exercise3ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise3
}

