//
//  RequestBuilder.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 30/01/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case invalidQueryItems
    case invalidBaseURL
}

class RequestBuilderGET {
    private var baseUrl:String = ""
    private var queryItems:[NSURLQueryItem] = [NSURLQueryItem]()
    private var headers: [String: String] = [:]
    init(baseUrl:String) {
        if !baseUrl.isEmpty {
            self.baseUrl = baseUrl
        }
    }
    
    func buildQuery(name:String, value:String) -> RequestBuilderGET {
        self.queryItems.append(NSURLQueryItem(name: name, value: value))
        return self
    }
    
    func buildHeader(value:String, header:String) -> RequestBuilderGET {
        self.headers[header] = value
        return self
    }
    
    func buildRequest() throws -> URLRequest {
        
        let urlComps = NSURLComponents(string: baseUrl)
        
        guard let baseURLRequest =  URL(string: baseUrl) else {
            throw RequestError.invalidBaseURL
        }
        var request = URLRequest(url: baseURLRequest )
        
        urlComps?.queryItems = queryItems as [URLQueryItem]
        
        guard let urlResult = urlComps?.url else {
            throw RequestError.invalidQueryItems
        }
        
        if queryItems.count > 0 {
            request = URLRequest(url: urlResult)
        }
        
        headers.forEach { (key:String, value:String) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
}
