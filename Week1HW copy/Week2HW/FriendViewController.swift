//
//  FriendViewController.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/04/23.
//

import UIKit

class FriendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileClicked(_ sender: Any) {
        
        guard let profileVC =
                self.storyboard?.instantiateViewController(identifier: "ProfileViewController")as? ProfileViewController else{return}
        
        profileVC.modalPresentationStyle = .fullScreen
        
        self.present(profileVC, animated: true, completion: nil)
        
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
