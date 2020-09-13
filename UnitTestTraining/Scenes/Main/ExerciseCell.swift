//
//  ExerciseCell.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 9/8/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable

final class ExerciseCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindViewModel(_ viewModel: ExerciseItemViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}
