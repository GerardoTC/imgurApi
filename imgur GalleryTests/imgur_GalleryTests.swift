//
//  imgur_GalleryTests.swift
//  imgur GalleryTests
//
//  Created by Gerardo Tarazona on 30/01/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import XCTest
@testable import imgur_Gallery

class imgur_GalleryTests: XCTestCase {

    func testRequestBuilderGETValidURL() {
        do{
            let request = try RequestBuilderGET(baseUrl: "www.builder.com").buildRequest()
            guard let stringResult = request.url?.absoluteString else {
                XCTAssertTrue(false)
                return
            }
            XCTAssertTrue( stringResult == "www.builder.com")
        }
        catch {
            XCTAssertTrue(false)
        }
    }
    
    func testAPI() {
        let expectation = XCTestExpectation(description: "Download apple.com home page")
        GallerySearchAPI.sharedInstance.searchGalleryByPage(page: 0, query: "gallery") { (result) in
            expectation.fulfill()
        }
        
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    

}
