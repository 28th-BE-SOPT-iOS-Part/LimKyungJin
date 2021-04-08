//
//  LoginViewController.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/04/05.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailphoneTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    var contactInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        //alert to notify empty input
        let alert = UIAlertController(title: "알림", message: "이메일/전화번호와 비밀번호를 모두 입력해주세요!", preferredStyle: UIAlertController.Style.alert)
        
        //set default action in the alert
        let defaultAction = UIAlertAction(title: "입력창 돌아가기", style: .destructive, handler: nil)
        
        alert.addAction(defaultAction)
        
        guard let finalVC = self.storyboard?.instantiateViewController(identifier: "FinishSignUpViewController")as? FinishSignUpViewController else { return }
        
        //move on to the final view only if both fields are entered correctly
        if emailphoneTextField.hasText && pwTextField.hasText {
            finalVC.contactInfo = emailphoneTextField.text
            
            self.present(finalVC, animated: true, completion: nil)
        } else {
            //when the expected fields are not entered
            self.present(alert, animated:true, completion: nil)
        }

    }
    
    @IBAction func signupClicked(_ sender: Any) {
        
        //create push view
        guard let signupVC =
                self.storyboard?.instantiateViewController(identifier: "SignUpViewController")as? SignUpViewController else{return}
        
        /*
        guard let checkVC =
                self.storyboard?.instantiateViewController(identifier: "FinishSignUpViewController")as? FinishSignUpViewController else{return}*/
        
        //add it to the navigation stack
        self.navigationController?
            .pushViewController(signupVC, animated: true)
        
        
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
