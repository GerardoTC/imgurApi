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
    func showLoadingView()
    func hideLoadingView()
    func reloadTable()
    func setUpNavBar()
    func showDetail(itemSelected: DataItem)
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
        self.definesPresentationContext = true
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
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showDetail(itemSelected: DataItem) {
        let detailViewController = self.storyboard?
            .instantiateViewController(withIdentifier:
                "detailView") as? DetailViewController
        detailViewController?.itemDetail = itemSelected
        self.navigationController?.pushViewController(detailViewController!,
                                                      animated: true)
    }
    

}

extension GallerySearchViewController {
    func updateSearchResults(for searchController: UISearchController) {
        if (searchController.searchBar.text?.count ?? 0 > 0){
            presenter.searchUpdated(value:searchController.searchBar.text ?? "")
        }
    }
}


extension GallerySearchViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCellImgur", for: indexPath) as? ItemCellData else {
            fatalError("the cell does not exists")
        }
        return presenter.cellForRowAt(indexPath: indexPath, cell: cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRowAt(path: indexPath)
    }
}
