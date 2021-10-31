//
//  NewsListProtocols.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import UIKit

protocol NewsListViewProtocol: class {
    var presenter: NewsListPresenterProtocol? { get set }
    
    func showLoader()
    func hideLoader()
    func showErrorMessage(message: String)
    func showNewsList()
}

protocol NewsListPresenterProtocol: class  {
    var view: NewsListViewProtocol? { get set }
    var interactor: NewsListInteractorInputProtocol? { get set }
    var wireFrame: NewsListWireframeProtocol? { get set }
    
    func viewDidLoad()
    func getNumberOfItems() -> Int
    func getItemForRow(index: Int) -> NewsItem?
    func getNewsList(searchText: String)
    func openNewsDetails(newsItem: NewsItem)
}

protocol NewsListInteractorInputProtocol: class {
    var presenter: NewsListInteractorOutputProtocol? { get set }
    var APIDataManager: NewsListAPIDataManagerProtocol? { get set }
    var newsList: [NewsItem]? { get set }
    var currentPage: Int { get set }
    var canLoadMore: Bool { get set }
    var searchText: String { get set }
    
    func getNewsList(searchText: String)
}

protocol NewsListInteractorOutputProtocol: class {
    func getNewsListSuccess()
    func showLoader()
    func hideLoader()
    func showErrorMessage(message: String)
}

protocol NewsListWireframeProtocol: class {
    var view: UIViewController? { get set }
    
    static func createNewsListView() -> NewsListView
    func openNewsDetails(newsItem: NewsItem)
}

protocol NewsListAPIDataManagerProtocol: class {
    func getNewsList(searchText: String, page: Int, completionHandler: @escaping (NewsResponse) -> (), faildHandler: @escaping (ServerStatus?) -> Void)
}
