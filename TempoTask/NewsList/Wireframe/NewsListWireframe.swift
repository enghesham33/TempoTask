//
//  NewsListWireframe.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import UIKit

class NewsListWireframe: NewsListWireframeProtocol {
    
    weak var view: UIViewController?
    
    static func createNewsListView() -> NewsListView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "NewsListView") as! NewsListView
        let presenter: NewsListPresenterProtocol & NewsListInteractorOutputProtocol = NewsListPresenter()
        let interactor:NewsListInteractorInputProtocol = NewsListInteractor()
        let wireframe: NewsListWireframeProtocol = NewsListWireframe()
        let APIDataManager: NewsListAPIDataManagerProtocol = NewsListAPIDataManager()
        
        view.presenter = presenter
        presenter.view = view
        wireframe.view = view
        presenter.wireFrame = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        
        return view
    }
    
    func openNewsDetails(newsItem: NewsItem) {
        let vc = NewsItemDetailsWireframe.createNewsItemDetailsView(newsItem: newsItem)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
