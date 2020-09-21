//
//  Exercise5ViewController.swift
//  UnitTestTraining
//
//  Created by can.khac.nguyen on 9/17/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable
import MGArchitecture
import RxCocoa
import RxSwift

final class Exercise5ViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var couponView: UIView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var receiveMethodSegment: UISegmentedControl!
    @IBOutlet weak var usingCouponSwitch: UISwitch!
    @IBOutlet weak var intoMoneyButton: UIButton!
    @IBOutlet weak var promotionView: UIView!
    @IBOutlet weak var intoMoneyValueLabel: UILabel!
    @IBOutlet weak var discountButton: UIButton!
    @IBOutlet weak var potatoPromotionButton: UIButton!
    @IBOutlet weak var freeMondayPromotionButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: Exercise5ViewModel!
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
        title = "Exercise 5"
    }
    
    func bindViewModel() {
        let input = Exercise5ViewModel.Input(loadTrigger: Driver.just(()),
                                             priceTrigger: priceTextField.rx.text.orEmpty.asDriver(),
                                             receiveMethodTrigger: receiveMethodSegment.rx.value.asDriver(),
                                             usingCouponTrigger: usingCouponSwitch.rx.value.changed.asDriver(),
                                             intoMoneyTrigger: intoMoneyButton.rx.tap.asDriver())
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$isHiddenUsingCoupon
            .asDriver()
            .drive(couponView.rx.isHidden)
            .disposed(by: disposeBag)
        
        output.$errorMessage
            .asDriver()
            .drive(inputPriceErrorMessage)
            .disposed(by: disposeBag)
        
        output.$fee
            .asDriver()
            .drive(fee)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders

extension Exercise5ViewController {
    
    var inputPriceErrorMessage: Binder<String> {
        return Binder(self) { vc, errorMessage in
            vc.errorMessageLabel.isHidden = errorMessage.isEmpty
            vc.errorMessageLabel.text = errorMessage
        }
    }
    
    var fee: Binder<CalculatePizzaFeeResult> {
        return Binder(self) { vc, result in
            let hasPotatoPromotion = result.promotions.contains(.freePotato)
            let hasMondayPromotion = result.promotions.contains(.freeOnMonday)
            vc.discountButton.isHidden = !result.promotions.contains(.discount20Percent)
            vc.potatoPromotionButton.isHidden = !hasPotatoPromotion
            vc.freeMondayPromotionButton.isHidden = !hasMondayPromotion
            vc.promotionView.isHidden = !hasPotatoPromotion && !hasMondayPromotion
            vc.intoMoneyValueLabel.text = "\(result.fee) 円"
        }
    }
}

// MARK: - StoryboardSceneBased

extension Exercise5ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise5
}
