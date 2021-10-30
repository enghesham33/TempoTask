//
//  NewsResponse.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Foundation

struct NewsResponse: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [NewsItem]?
    
    enum CodingKeys: String, CodingKey {
        case status, totalResults, articles
    }
    
    public init(dictionary: [String : Any]) {
        status = dictionary["status"] as? String
        totalResults = dictionary["totalResults"] as? Int
        let articlesDic = dictionary["articles"] as? [[String : Any]]
        articles = []
        articlesDic?.forEach({ articleDic in
            articles?.append(NewsItem(dictionary: articleDic))
        })
        
    }
}
