//
//  ItemCellData.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 01/02/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class ItemCellData: UITableViewCell {
    
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
