//
//  ClotherCell.swift
//  UnitTestTraining
//
//  Created by nguyen.dong.son on 9/13/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable
import Then

final class ClotherCell: UITableViewCell, NibReusable {
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var minusButtonAction: (() -> Void)?
    var addButtonAction: (() -> Void)?
    
    @IBAction func minusButtonActionTapped(_ sender: Any) {
        minusButtonAction?()
    }
    
    @IBAction func addButtonActionTapped(_ sender: Any) {
        addButtonAction?()
    }
    
    func bindViewModel(_ viewModel: ClotherViewModel) {
        countLabel.text = viewModel.count
        nameLabel.text = viewModel.type.name
        minusButton.do {
            $0.alpha = !viewModel.minusButtonIsEnable ? 0.5 : 1
            $0.isEnabled = viewModel.minusButtonIsEnable
        }
    }
}
