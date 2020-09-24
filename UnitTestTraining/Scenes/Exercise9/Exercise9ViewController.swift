//
//  Exercise9ViewController.swift
//  UnitTestTraining
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import MGArchitecture
import Reusable
import RxCocoa
import RxSwift

final class Exercise9ViewController: UITableViewController, Bindable {

    // MARK: - IBOutlets

    @IBOutlet weak var magicWandSelectionSwitch: UISwitch!
    @IBOutlet weak var strategistSelectionSwitch: UISwitch!
    @IBOutlet weak var darknessKeySelectionSwitch: UISwitch!
    @IBOutlet weak var lightSwordSelectionSwitch: UISwitch!
    @IBOutlet weak var hitBigBossButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - Properties

    var viewModel: Exercise9ViewModel!
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
        title = "Exercise 9"
    }

    func bindViewModel() {
        let input = Exercise9ViewModel.Input(
            magicWandSelectionTrigger: magicWandSelectionSwitch.rx.value.changed.asDriver(),
            strategistSelectionTrigger: strategistSelectionSwitch.rx.value.changed.asDriver(),
            darknessKeySelectionTrigger: darknessKeySelectionSwitch.rx.value.changed.asDriver(),
            lightSwordSelectionTrigger: lightSwordSelectionSwitch.rx.value.changed.asDriver(),
            hitBigBossTrigger: hitBigBossButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input, disposeBag: disposeBag)
        output.$gameResult
            .asDriver()
            .map { $0.description } 
            .drive(resultLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders

extension Exercise9ViewController {
}

// MARK: - StoryboardSceneBased

extension Exercise9ViewController: StoryboardSceneBased {

    static var sceneStoryboard = Storyboards.exercise9
}
