//
//  GallerySearchPresenter.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 30/01/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import Foundation
import ImageLoader

protocol GallerySearchPresenterProtocol: class {
    func viewDidLoad()
    func updateItems(items : [DataItem])
    func itemsNotFound()
    func cellForRowAt(indexPath:IndexPath, cell: ItemCellData) -> UITableViewCell
    func searchUpdated(value:String)
    func didSelectRowAt(path:IndexPath)
    func numberOfRowsInSection() -> Int
}

class GallerySearchPresenter:GallerySearchPresenterProtocol {

    
    var view : GallerySearchViewProtocol?
    var interactor: GallerySearchInteractorProtocol?
    var page: Int = 0
    let debouncer = Debouncer(timeInterval: 0.5)
    var itemsArray: [DataItem] = []
    var query: String = "Cats"
    
    
    init(view: GallerySearchViewProtocol, interactor: GallerySearchInteractorProtocol) {
        self.interactor = interactor
        self.view = view
        interactor.setPresenter(presenter: self)
        initDebouncerClosure()
    }
    func initDebouncerClosure(){
        debouncer.closure = {
            self.callInteractorForItems()
        }
    }
    func viewDidLoad() {
        view?.setUpNavBar()
        view?.showLoadingView()
        callInteractorForItems()
    }
    
    func updateItems(items: [DataItem]) {
        view?.hideLoadingView()
        self.itemsArray += items
        view?.reloadTable()
    }
    
    func itemsNotFound() {
        view?.hideLoadingView()
        view?.reloadTable()
    }
    
    func callInteractorForItems() {
        interactor?.getItemsByPage(page: page, query: query)
    }
    
    func searchUpdated(value:String) {
        query = value
        page = 1
        itemsArray = []
        view?.reloadTable()
        view?.showLoadingView()
        debouncer.restarInterval()
        callInteractorForItems()
    }
    
    func cellForRowAt(indexPath:IndexPath,cell:ItemCellData) -> UITableViewCell{
        cell.title.text = itemsArray[indexPath.item].title
        cell.cellImage?.image = UIImage(named: "placeHolder")
        if itemsArray[indexPath.item].images?.count ?? 0 > 0 {
            DispatchQueue.main.async {
                cell.cellImage?.load.request(with: self.itemsArray[indexPath.item].images?[0].link ?? "")
                cell.cellImage?.contentMode = .scaleAspectFit
            }
        }
        if indexPath.item == itemsArray.count - 1 {
            page = page + 1
            callInteractorForItems()
            view?.showLoadingView()
        }
        return cell
    }
    
    func didSelectRowAt(path: IndexPath) {
        view?.showDetail(itemSelected: itemsArray[path.item])
    }
    
    func numberOfRowsInSection() -> Int {
        return self.itemsArray.count
    }

}
