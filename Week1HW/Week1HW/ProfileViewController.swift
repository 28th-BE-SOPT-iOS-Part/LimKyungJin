//
//  ProfileViewController.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/04/23.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    var name : String?
    var image : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfile()
        // Do any additional setup after loading the view.
    }
    func setProfile() {
        if let myName = self.name {
            profileName.text = myName
        }
        
        if let myPicture = self.image {
            profilePicture.image = UIImage(named: myPicture)
        }
    }
    @IBAction func dismissClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
