//
//  ArticleCell.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable

final class ArticleCell: UITableViewCell, NibReusable {
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindViewModel(_ viewModel: ArticleItemViewModel) {
        authorLabel.text = viewModel.author
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}
