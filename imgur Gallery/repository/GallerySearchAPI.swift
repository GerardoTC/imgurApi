//
//  GallerySearchAPI.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 30/01/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import UIKit

class GallerySearchAPI {
    static let sharedInstance = GallerySearchAPI()
    
    private init(){}
    
    func searchGalleryByPage(page: Int, query: String, completion: @escaping (_ movies:Array<DataItem>) -> Void) {
        
        let requestBuilder = try? RequestBuilderGET(baseUrl: BASE_URL + "\(page)")
            .buildQuery(name: QUERY_TAG, value: query)
            .buildHeader(value: CLIENT_ID, header: AUTH_TAG).buildRequest()
        
        guard let request = requestBuilder   else{
            completion([])
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error == nil &&  data != nil{
                let serverResponse = try? JSONDecoder().decode(ServerResponse.self, from: data!)
                if serverResponse != nil {
                    guard let dataItems = serverResponse?.data else {
                        completion([])
                        return
                    }
                    completion(dataItems)
                    return
                }
            }
            completion([])
        }
        task.resume()
    }
}

