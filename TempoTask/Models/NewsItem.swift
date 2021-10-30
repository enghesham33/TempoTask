//
//  NewsItem.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Foundation

struct NewsItem: Codable {
    var source: ArticleSource?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
    
    public init(dictionary: [String : Any]?) {
        source = ArticleSource(dictionary: dictionary?["source"] as? [String : Any])
        author = dictionary?["author"] as? String
        title = dictionary?["title"] as? String
        description = dictionary?["description"] as? String
        url = dictionary?["url"] as? String
        urlToImage = dictionary?["urlToImage"] as? String
        publishedAt = dictionary?["publishedAt"] as? String
        content = dictionary?["content"] as? String
    }
}
