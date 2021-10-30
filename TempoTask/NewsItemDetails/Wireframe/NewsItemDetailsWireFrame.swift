//
//  NewsItemDetailsWireFrame.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import UIKit

class NewsItemDetailsWireframe: NewsItemDetailsWireframeProtocol {
    var view: UIViewController?
    
    static func createNewsItemDetailsView(newsItem: NewsItem) -> NewsItemDetailsView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "NewsItemDetailsView") as! NewsItemDetailsView
        let presenter: NewsItemDetailsPresenterProtocol & NewsItemDetailsInteractorOutputProtocol = NewsItemDetailsPresenter()
        let interactor:NewsItemDetailsInteractorInputProtocol = NewsItemDetailsInteractor()
        interactor.newsItemDetails = newsItem
        let wireframe: NewsItemDetailsWireframeProtocol = NewsItemDetailsWireframe()
        
        view.presenter = presenter
        presenter.view = view
        wireframe.view = view
        presenter.wireFrame = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func openArticleSource(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}
