//
//  ImgurItem.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 1/31/19.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//


struct ImgurItem: Codable {
    var id:String = ""
    var url:String = ""
    var title:String = ""
    var images:[ImageUrlString] = []
}


struct ImageUrlString:Codable {
    var id:String = ""
    var type:String = ""
    var link:String = ""
    var width:Int = 0
    var height:Int
    
    
}
