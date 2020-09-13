//
//  MainViewController.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class MainViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: MainViewModel!
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
        title = "Exercise List"
        
        tableView.do {
            $0.delegate = self
            $0.rowHeight = 68
            $0.register(cellType: ExerciseCell.self)
        }
    }
    
    func bindViewModel() {
        let input = MainViewModel.Input(
            loadTrigger: Driver.just(()),
            selectTrigger: tableView.rx.itemSelected.asDriver()
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$exercises
            .asDriver()
            .drive(tableView.rx.items) { tableView, row, exercise in
                return tableView.dequeueReusableCell(
                    for: IndexPath(row: row, section: 0),
                    cellType: ExerciseCell.self
                )
                .then {
                    $0.bindViewModel(exercise)
                }
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - StoryboardSceneBased
extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
