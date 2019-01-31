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
    
    func searchGalleryByPage(page: Int, query: String, completion: @escaping (_ movies:Array<String>) -> Void) {
        
        let requestBuilder = try? RequestBuilderGET(baseUrl: BASE_URL + "\(page)")
            .buildQuery(name: QUERY_TAG, value: query)
            .buildHeader(value: CLIENT_ID, header: AUTH_TAG).buildRequest()
        
        guard let request = requestBuilder   else{
            completion([])
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            let response = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [String:Any]
            let gallery = response?["data"] as? [Any]
            let firstItem = gallery![0] as? [String:Any]
            (((firstItem!["images"] as? [Any])![0])as? [String:Any])!["link"]!
            completion([])
        }
        task.resume()
    }
}

extension String {
    func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
