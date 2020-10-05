//
//  Exercise11ViewController.swift
//  UnitTestTraining
//
//  Created by Tuan Truong on 10/5/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa
import MGArchitecture
import MGLoadMore
import Then

final class Exercise11ViewController: UIViewController, Bindable {

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: PagingTableView!

    // MARK: - Properties

    var viewModel: Exercise11ViewModel!
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
        title = "News API"
        
        tableView.do {
            $0.register(cellType: ArticleCell.self)
            $0.delegate = self
            $0.prefetchDataSource = self
            $0.estimatedRowHeight = 550
            $0.rowHeight = UITableView.automaticDimension
            $0.refreshFooter = nil
        }
    }

    func bindViewModel() {
        let input = Exercise11ViewModel.Input(
            loadTrigger: Driver.just(()),
            reloadTrigger: tableView.refreshTrigger,
            loadMoreTrigger: tableView.loadMoreTrigger,
            selectArticleTrigger: tableView.rx.itemSelected.asDriver()
        )

        let output = viewModel.transform(input, disposeBag: disposeBag)

        output.$articleList
            .asDriver()
            .drive(tableView.rx.items) { tableView, row, article in
                return tableView.dequeueReusableCell(
                    for: IndexPath(row: row, section: 0),
                    cellType: ArticleCell.self
                )
                .then {
                    $0.bindViewModel(article)
                }
            }
            .disposed(by: disposeBag)

        output.$error
            .asDriver()
            .unwrap()
            .drive(rx.error)
            .disposed(by: disposeBag)
        
        output.$isLoading
            .asDriver()
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
        
        output.$isReloading
            .asDriver()
            .drive(tableView.isRefreshing)
            .disposed(by: disposeBag)

        output.$isLoadingMore
            .asDriver()
            .drive(tableView.isLoadingMore)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension Exercise11ViewController {

}

// MARK: - UITableViewDelegate
extension Exercise11ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSourcePrefetching
extension Exercise11ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {

    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        
    }
}

// MARK: - StoryboardSceneBased
extension Exercise11ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.exercise11
}
