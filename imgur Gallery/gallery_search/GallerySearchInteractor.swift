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
}

class GallerySearchInteractor:GallerySearchInteractorProtocol {
    var presenter: GallerySearchPresenterProtocol!
    
    func setPresenter(presenter:GallerySearchPresenterProtocol) {
        self.presenter = presenter
    }
}
