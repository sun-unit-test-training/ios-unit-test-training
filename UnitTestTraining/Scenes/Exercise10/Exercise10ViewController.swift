//
//  Exercise10ViewController.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/23/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable
import MGArchitecture
import RxSwift
import RxCocoa

final class Exercise10ViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var participateLotteryView: UIView!
    @IBOutlet weak var memberRankSegment: UISegmentedControl!
    @IBOutlet weak var prepaidCardTypeSegment: UISegmentedControl!
    @IBOutlet weak var participateLotterySwitch: UISwitch!
    @IBOutlet weak var bonusValueLabel: UILabel!
    @IBOutlet weak var receiveCouponLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: Exercise10ViewModel!
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
        title = "Exercise 10"
    }
    
    func bindViewModel() {
        let input = Exercise10ViewModel.Input(loadTrigger: Driver.just(()),
                                              memberRankTrigger: memberRankSegment.rx.value.asDriver(),
                                              prepaidTypeTrigger: prepaidCardTypeSegment.rx.value.asDriver(),
                                              participateLotteryTrigger: participateLotterySwitch.rx.value.asDriver())
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$restaurantPromotion
            .asDriver()
            .drive(restaurantPromotion)
            .disposed(by: disposeBag)
        
        output.$availableToParticipateLottery
            .asDriver()
            .drive(participateLotteryView.rx.isHidden)
            .disposed(by: disposeBag)
    }

}

// MARK: - Binders

extension Exercise10ViewController {
    
    var restaurantPromotion: Binder<RestaurantPromotion> {
        return Binder(self) { (vc, promotion) in
            vc.bonusValueLabel.text = "+\(promotion.discount)%"
            vc.receiveCouponLabel.text = promotion.haveCoupon ? "YES" : "NO"
            vc.receiveCouponLabel.textColor = promotion.haveCoupon ? .green : .red
        }
    }
    
}

// MARK: - StoryboardSceneBased

extension Exercise10ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise10
}
