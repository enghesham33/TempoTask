//
//  NewsItemDetailsInteractor.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Foundation

class NewsItemDetailsInteractor: NewsItemDetailsInteractorInputProtocol {
    var presenter: NewsItemDetailsInteractorOutputProtocol?
    
    var newsItemDetails: NewsItem!
    
    func getNewsItemDetails() -> NewsItem {
        return newsItemDetails
    }
}
