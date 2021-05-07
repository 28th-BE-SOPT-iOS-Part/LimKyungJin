//
//  CollectionViewCell.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/05/07.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "CollectionViewCell"
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    func setData(imageName: String, menu: String) {
        if let image = UIImage(named: imageName) {
            iconImageView.image = image
            
        }
        label.text = menu
    }
    
}
