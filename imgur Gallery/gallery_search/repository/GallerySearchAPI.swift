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
    
    func searchGalleryByPage(page: Int, query: String, completion: @escaping (_ movies:Array<String>) -> Void){
        do {
            let requestBuilder = try RequestBuilderGET(baseUrl: BASE_URL)
                .buildQuery(name: QUERY_TAG, value: query)
                .buildHeader(value: CLIENT_ID, header: AUTH_TAG).buildRequest()
            
                completion([])
            return
        }catch RequestError.invalidBaseURL {
            print("Malformed URL")
        }catch RequestError.invalidQueryItems {
            print("Invalid Query items")
        }catch {
            print("Uknown Error")
        }
        completion([])
    }
    
}
