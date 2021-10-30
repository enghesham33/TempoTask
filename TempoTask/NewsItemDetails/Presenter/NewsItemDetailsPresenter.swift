//
//  NewsItemDetailsPresenter.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Foundation

class NewsItemDetailsPresenter: NewsItemDetailsPresenterProtocol {
    var view: NewsItemDetailsViewProtocol?
    
    var interactor: NewsItemDetailsInteractorInputProtocol?
    
    var wireFrame: NewsItemDetailsWireframeProtocol?
    
    func viewDidLoad() {
        view?.showNewsItem()
    }
    
    func getNewsItemDetails() -> NewsItem? {
        return interactor?.getNewsItemDetails()
    }
    
    func openArticleSource(url: String) {
        wireFrame?.openArticleSource(url: url)
    }
}

extension NewsItemDetailsPresenter: NewsItemDetailsInteractorOutputProtocol {

}
