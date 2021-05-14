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
        
        self.makeRequestAlert(title: "알림",
                                    message: "로그인을 하시겠습니까?",
                                    okAction: { _ in
                                      self.loginAction()
                                    })
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        
        //create push view
        guard let signupVC =
                self.storyboard?.instantiateViewController(identifier: "SignUpViewController")as? SignUpViewController else{return}
        
        //moves to SignupViewController
        self.navigationController?
            .pushViewController(signupVC, animated: true)
        
        
    }
    
    func changeView()
        {
        guard let friendVC = self.storyboard?.instantiateViewController(identifier: "FriendViewController")as? FriendViewController else{return}
        friendVC.modalPresentationStyle = .fullScreen
        self.present(friendVC, animated: true)
        }
    
    func loginAction()
        {
            LoginService.shared.login(email: self.emailphoneTextField.text!, password: self.pwTextField.text!) { result in
                switch result
                {
                case .success(let message):
                    
                    if let message = message as? String{
                        
                        self.makeAlert(title: "알림",
                                       message: message, okAction: { _ in
                                        self.changeView()})
                        
                    }
                    /*guard let friendVC = self.storyboard?.instantiateViewController(identifier: "FriendViewController")as? FriendViewController else{return}
                    self.present(friendVC, animated: true)*/
                    
                case .requestErr(let message):
                    
                    if let message = message as? String{
                        
                        self.makeAlert(title: "알림",
                                  message: message)
                    }
                               
                    
                default :
                    print("ERROR")
                }
            }
        }
    
    
   

}
