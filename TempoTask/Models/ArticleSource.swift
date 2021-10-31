//
//  ArticleSource.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Foundation

struct ArticleSource: Codable {
    var id: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
    
    public init(dictionary: [String : Any]?) {
        id = dictionary?["id"] as? Int
        name = dictionary?["name"] as? String
    }
    
    // This constructor for mocking the data
    public init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
