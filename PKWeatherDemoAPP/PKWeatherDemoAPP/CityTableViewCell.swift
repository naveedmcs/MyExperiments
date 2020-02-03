//
//  CityTableViewCell.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadCell(object: City) {
        self.title.text = object.name ?? "name not found"
    }
}


extension UITableView {
    
    func registerHeaderFooterCell(_ id: String )  {
        let nib = UINib(nibName: id, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: id)
    }
    
    func registerCell(_ id: String )  {
        self.register(UINib(nibName: id, bundle: nil), forCellReuseIdentifier: id)
    }
    
}
