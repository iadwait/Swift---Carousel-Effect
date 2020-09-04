//
//  CollectionViewCell.swift
//  Carousel Effect
//
//  Created by Adwait Barkale on 04/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 13.0
        mainView.layer.shadowColor = UIColor.blue.cgColor
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowPath = UIBezierPath(rect: self.mainView.bounds).cgPath
        mainView.layer.shouldRasterize = true
    }

}
