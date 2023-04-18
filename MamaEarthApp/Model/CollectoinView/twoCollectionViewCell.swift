//
//  twoCollectionViewCell.swift
//  MamaEarthApp
//
//  Created by sanjana pethani on 22/02/23.
//

import UIKit

class twoCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var myImageView2: UIImageView!
    

    @IBOutlet weak var nameLabel: UILabel!
    
override func awakeFromNib() {
         super.awakeFromNib()
            
            
            myImageView2.layer.cornerRadius = 35
            myImageView2.layer.borderWidth = 1//45
            myImageView2.layer.masksToBounds = true
            
    }

}
