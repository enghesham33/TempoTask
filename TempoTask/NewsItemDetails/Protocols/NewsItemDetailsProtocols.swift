//
//  NewsItemDetailsProtocols.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import UIKit

protocol NewsItemDetailsViewProtocol: class {
    var presenter: NewsItemDetailsPresenterProtocol? { get set }
    
    func showNewsItem()
}

protocol NewsItemDetailsPresenterProtocol: class  {
    var view: NewsItemDetailsViewProtocol? { get set }
    var interactor: NewsItemDetailsInteractorInputProtocol? { get set }
    var wireFrame: NewsItemDetailsWireframeProtocol? { get set }
    
    func viewDidLoad()
    func getNewsItemDetails() -> NewsItem?
    func openArticleSource(url: String)
}

protocol NewsItemDetailsInteractorInputProtocol: class {
    var presenter: NewsItemDetailsInteractorOutputProtocol? { get set }
    var newsItemDetails: NewsItem! { get set }
    
    func getNewsItemDetails() -> NewsItem
}

protocol NewsItemDetailsInteractorOutputProtocol: class {
}

protocol NewsItemDetailsWireframeProtocol: class {
    var view: UIViewController? { get set }
    
    static func createNewsItemDetailsView(newsItem: NewsItem) -> NewsItemDetailsView
    func openArticleSource(url: String)
}

protocol NewsItemDetailsAPIDataManagerProtocol: class {
}
