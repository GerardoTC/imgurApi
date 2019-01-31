//
//  ViewController.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 30/01/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import UIKit
protocol GallerySearchViewProtocol {
    
}
class GallerySearchViewController: UIViewController,GallerySearchViewProtocol {

    var presenter:GallerySearchPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMVP(interactor: GallerySearchInteractor())
    }

    func initMVP(interactor:GallerySearchInteractorProtocol) {
        presenter = GallerySearchPresenter(view: self, interactor: interactor)
    }

}

