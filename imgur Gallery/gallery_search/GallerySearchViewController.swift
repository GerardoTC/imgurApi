//
//  ViewController.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 30/01/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol GallerySearchViewProtocol {
    func showItemsNotFoundAlert()
    func showLoadingView()
    func hideLoadingView()
    func reloadTable()
    func setUpNavBar()
}
class GallerySearchViewController: UIViewController,GallerySearchViewProtocol, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    
    @IBOutlet weak var tableView: UITableView!

    

    var presenter:GallerySearchPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMVP(interactor: GallerySearchInteractor())
        presenter.viewDidLoad()
    }
    
    func setUpNavBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func initMVP(interactor:GallerySearchInteractorProtocol) {
        presenter = GallerySearchPresenter(view: self, interactor: interactor)
    }
    
    func hideLoadingView() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func showLoadingView() {
        SVProgressHUD.show()
    }
    
    func showItemsNotFoundAlert() {
        
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension GallerySearchViewController {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


extension GallerySearchViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
