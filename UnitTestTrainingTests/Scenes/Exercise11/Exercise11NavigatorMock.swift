//
//  Exercise11NavigatorMock.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

@testable import UnitTestTraining

final class Exercise11NavigatorMock: Exercise11NavigatorType {
    
    // MARK: - toArticleDetail

    var toArticleDetailCalled = false

    func toArticleDetail(article: Article) {
        toArticleDetailCalled = true
    }
}