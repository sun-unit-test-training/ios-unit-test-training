//
//  Exercise11Navigator.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit

protocol Exercise11NavigatorType {
    func toArticleDetail(article: Article)
}

struct Exercise11Navigator: Exercise11NavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController

    func toArticleDetail(article: Article) {

    }
}
