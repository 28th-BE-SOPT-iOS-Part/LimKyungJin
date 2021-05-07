//
//  TableViewCell.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/05/07.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier : String = "TableViewCell"
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData (imageName: String, name: String, state: String) {
        if let image = UIImage(named: imageName) {
            profileImage.image = image
        }
        
        nameLabel.text = name
        messageLabel.text = state
        
        
    }
    

}
