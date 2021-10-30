//
//  NewsListInteractor.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Foundation

class NewsListInteractor: NewsListInteractorInputProtocol {
    var presenter: NewsListInteractorOutputProtocol?
    
    var APIDataManager: NewsListAPIDataManagerProtocol?
    
    var newsList: [NewsItem]? = [NewsItem]()
    
    var searchText: String = ""
    
    var currentPage: Int = 1
    
    var canLoadMore: Bool = true
    
    func getNewsList(searchText: String, startFrom: String) {
        if searchText != self.searchText {
            canLoadMore = true
            currentPage = 1
            newsList?.removeAll()
        }
        if canLoadMore {
            presenter?.showLoader()
            APIDataManager?.getNewsList(searchText: searchText, startFrom: startFrom, page: currentPage, completionHandler: { [weak self] newsResponse in
                self?.searchText = searchText
                self?.newsList?.append(contentsOf: newsResponse.articles ?? [])
                self?.presenter?.hideLoader()
                self?.presenter?.getNewsListSuccess()
                if newsResponse.totalResults ?? 0 == self?.newsList?.count ?? 0  {
                    self?.canLoadMore = false
                } else {
                    self?.currentPage += 1
                }
            }, faildHandler: { [weak self] serverStatus in
                self?.presenter?.hideLoader()
                self?.presenter?.showErrorMessage(message: serverStatus?.errorMessage ?? "")
            })
        }
    }
    
}
