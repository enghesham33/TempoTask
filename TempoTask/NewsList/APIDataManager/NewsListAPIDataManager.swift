//
//  NewsListAPIDataManager.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Alamofire

class NewsListAPIDataManager: NewsListAPIDataManagerProtocol {
    
    func getNewsList(searchText: String, startFrom: String, page: Int, completionHandler: @escaping (NewsResponse) -> (), faildHandler: @escaping (ServerStatus?) -> Void) {
        var params = [String : Any]()
        params["page"] = page
        params["q"] = searchText
        params["apiKey"] = API_KEY
        params["sortBy"] = "publishedAt"
        params["from"] = startFrom
        NetworkingManager.sendRequest(method: .get, url: "everything", params: params) { response in
            if let response = response {
                let newsListResponse = NewsResponse(dictionary: response)
                completionHandler(newsListResponse)
            }
        } errorHandler: { serverStatus in
            faildHandler(serverStatus)
        }
    }
}
