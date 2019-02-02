//
//  DetailViewController.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 01/02/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    var itemDetail: DataItem?
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var textDetail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDetail.load.request(with: itemDetail?.images?.first?.link ?? "")
        imageDetail.contentMode = .scaleAspectFit
        textDetail.text = itemDetail?.title
        navigationItem.largeTitleDisplayMode = .never
    }
    
}
