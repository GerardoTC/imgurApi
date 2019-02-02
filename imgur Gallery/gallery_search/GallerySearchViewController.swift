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
class GallerySearchViewController: UIViewController,GallerySearchViewProtocol, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    
    @IBOutlet weak var table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    var presenter:GallerySearchPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMVP(interactor: GallerySearchInteractor())
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func initMVP(interactor:GallerySearchInteractorProtocol) {
        presenter = GallerySearchPresenter(view: self, interactor: interactor)
    }

}

extension GallerySearchViewController {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.
    }
}
