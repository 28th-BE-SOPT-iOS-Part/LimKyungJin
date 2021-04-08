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

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var retypeTextField: UITextField!
    
    @IBAction func createNewAccountClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "알림", message: "세 항목을 모두 채워주세요!", preferredStyle:UIAlertController.Style.alert )
        
        let defaultAction = UIAlertAction(title: "입력창 돌아가기", style: .destructive, handler: nil)
        
        alert.addAction(defaultAction)
        
        guard let nextVC =  self.storyboard?.instantiateViewController(identifier: "FinishSignUpViewController")as?FinishSignUpViewController else {return}
        
        if contactTextField.hasText && pwTextField.hasText && retypeTextField.hasText {
            nextVC.contactInfo = contactTextField.text
            self.present(nextVC, animated:true, completion: nil)
        } else {
            self.present(alert, animated:true, completion: nil)
        }
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
