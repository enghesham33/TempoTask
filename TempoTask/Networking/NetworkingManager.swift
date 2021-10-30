//
//  NetworkingManager.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import Alamofire
import ReachabilitySwift

class NetworkingManager {
    
    static  func checkNetConnection() -> Bool{
        let reachability: Reachability
        reachability =  Reachability()!
        return reachability.isReachable
    }
    
    static func sendRequest(method: HTTPMethod, url: String, headers: HTTPHeaders? = nil,
                            params: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default,
                            successHandler: @escaping (_ response: [String : Any]?)->(),
                                errorHandler: @escaping (_ error:ServerStatus?)->()) {
        
        if(!NetworkingManager.checkNetConnection()){
            errorHandler(ServerStatus(statusCode: nil, errorMessage: "No internet connection!"))
            return
        }

        var recievedHeaders = headers
        if recievedHeaders == nil {
            recievedHeaders = HTTPHeaders()
        }
        recievedHeaders?.add(name: "Content-Type", value: "application/json")
        
        AF.request(BASE_URL + url, method: method,parameters: params ?? [:], encoding: encoding, headers: recievedHeaders)
            .responseJSON(completionHandler: { response in
                print(BASE_URL + url)
                print(response)
                if response.response?.statusCode == 200 {
                    successHandler(response.value as? [String : Any])
                    return
                } else {
                    let errorMessage = response.error?.errorDescription
                    let serverStatus = ServerStatus(statusCode: response.response?.statusCode, errorMessage: errorMessage)
                    errorHandler(serverStatus)
                    return
                }
            })
    }
}

