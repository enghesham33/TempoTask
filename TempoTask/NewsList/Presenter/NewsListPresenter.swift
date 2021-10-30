//
//  NewsListPresenter.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Foundation

class NewsListPresenter: NewsListPresenterProtocol {
    weak var view: NewsListViewProtocol?
    
    var interactor: NewsListInteractorInputProtocol?
    
    var wireFrame: NewsListWireframeProtocol?
    
    func viewDidLoad() {
        getNewsList(searchText: "Egypt", startFrom: "2021-10-01")
    }
    
    func getNumberOfItems() -> Int {
        return interactor?.newsList?.count ?? 0
    }
    
    func getItemForRow(index: Int) -> NewsItem? {
        return interactor?.newsList?[index]
    }
    
    func getNewsList(searchText: String, startFrom: String) {
        interactor?.getNewsList(searchText: searchText, startFrom: startFrom)
    }
    
    func openNewsDetails(newsItem: NewsItem) {
        wireFrame?.openNewsDetails(newsItem: newsItem)
    }
}

extension NewsListPresenter: NewsListInteractorOutputProtocol {
    func getNewsListSuccess() {
        view?.showNewsList()
    }
    
    func showLoader() {
        view?.showLoader()
    }
    
    func hideLoader() {
        view?.hideLoader()
    }
    
    func showErrorMessage(message: String) {
        view?.showErrorMessage(message: message)
    }
}
