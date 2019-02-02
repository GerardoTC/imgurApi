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
}

class GallerySearchPresenter:GallerySearchPresenterProtocol {
    var view : GallerySearchViewProtocol?
    var interactor: GallerySearchInteractorProtocol?
    let debouncer = Debouncer(timeInterval: 0.5)
    let images: [ImgurItem] = []
    
    
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
        
    }
}
