//
//  GallerySearchInteractor.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 30/01/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import UIKit

protocol GallerySearchInteractorProtocol {
    func setPresenter(presenter:GallerySearchPresenterProtocol)
    func getItemsByPage(page:Int,query:String)
}

class GallerySearchInteractor:GallerySearchInteractorProtocol {
    func getItemsByPage(page: Int, query: String) {
        GallerySearchAPI.sharedInstance.searchGalleryByPage(page: page, query: query) { [weak self] (itemsResult) in
            if itemsResult.count > 0 {
                self?.presenter.updateItems(items: itemsResult)
            } else {
                self?.presenter.itemsNotFound()
            }
        }
    }
    
    var presenter: GallerySearchPresenterProtocol!
    
    func setPresenter(presenter:GallerySearchPresenterProtocol) {
        self.presenter = presenter
    }
}
