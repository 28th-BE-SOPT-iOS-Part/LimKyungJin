//
//  SignUpViewController.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/04/08.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    @IBOutlet weak var contactTextField: UITextField!
    
    //passwordTextField랑 retypeTextField에서 thirdPartyKeyboards오류
    //secureEntry 체크했을때
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypeTextField: UITextField!

    @IBAction func createNewAccountClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "알림", message: "제시된 항목을 다 입력해주세요!", preferredStyle:UIAlertController.Style.alert )
        
        let defaultAction = UIAlertAction(title: "입력창 돌아가기", style: .destructive, handler: nil)
        
        alert.addAction(defaultAction)
        
        guard let nextVC =  self.storyboard?.instantiateViewController(identifier: "FinishSignUpViewController")as?FinishSignUpViewController else {return}
        
        if  passwordTextField.text == retypeTextField.text && contactTextField.hasText {
            nextVC.contactInfo = contactTextField.text
            
            self.present(nextVC, animated:true, completion: nil)
            
            nextVC.modalTransitionStyle = .crossDissolve
            nextVC.modalPresentationStyle = .currentContext
        
        } else {
            if (passwordTextField.text != retypeTextField.text && contactTextField.hasText) {
                alert.message = "재입력된 비밀번호가 일치하지 않습니다"
            }
            self.present(alert, animated:true, completion: nil)
        }
 
    }
    
    //tried to call this function to go back to the rootView
    //function is called, but it doesn't go back to rootView
    @IBAction func returnHome(){
        
         guard let prevVC =  self.storyboard?.instantiateViewController(identifier: "LoginViewController")as?LoginViewController else {return}
        
        self.navigationController?.popToViewController(prevVC, animated: true)
        
        
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
