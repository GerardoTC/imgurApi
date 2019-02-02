//
//  GallerySearchPresenter.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 30/01/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import Foundation

protocol GallerySearchPresenterProtocol: class {
    func viewDidLoad()
    func updateItems(items : [DataItem])
    func itemsNotFound()
}

class GallerySearchPresenter:GallerySearchPresenterProtocol {
    
    
    var view : GallerySearchViewProtocol?
    var interactor: GallerySearchInteractorProtocol?
    var page: Int = 0
    let debouncer = Debouncer(timeInterval: 0.5)
    var images: [DataItem] = []
    
    
    
    init(view: GallerySearchViewProtocol, interactor: GallerySearchInteractorProtocol) {
        self.interactor = interactor
        self.view = view
        interactor.setPresenter(presenter: self)
        initDebouncerClosure()
    }
    func initDebouncerClosure(){
        debouncer.closure = {
            
        }
    }
    func viewDidLoad() {
        view?.setUpNavBar()
        view?.showLoadingView()
        interactor?.getItemsByPage(page: page, query: "Cats")
    }
    
    func updateItems(items: [DataItem]) {
        view?.hideLoadingView()
        self.images = items
    }
    
    func itemsNotFound() {
        self.view?.showItemsNotFoundAlert()
    }
}
