//
//  API+Article.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation
import MGAPIService
import RxSwift
import ObjectMapper

// MARK: - GetArticles
extension API {
    func getArticles(_ input: GetArticlesInput) -> Observable<GetArticlesOutput> {
        return request(input)
    }
    
    final class GetArticlesInput: APIInput {
        init(dto: GetArticlesDto) {
            let params: [String: Any] = [
                "q": dto.query,
                "apiKey": dto.apiKey,
                "page": dto.page,
                "pageSize": dto.pageSize
            ]
            
            super.init(urlString: API.Urls.getArticles,
                       parameters: params,
                       method: .get,
                       requireAccessToken: true)
        }
    }
    
    final class GetArticlesOutput: APIOutput {
        private(set) var articles = [Article]()
        
        override func mapping(map: Map) {
            super.mapping(map: map)
            articles <- map["articles"]
        }
    }
}
