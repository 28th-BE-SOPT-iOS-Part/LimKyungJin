//
//  FinishSignUpViewController.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/04/05.
//

import UIKit

class FinishSignUpViewController: UIViewController {

    @IBOutlet weak var checkMessage: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    var contactInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCheckLabel()
        // Do any additional setup after loading the view.
        
    }
    
    func setCheckLabel() {
        if let msg = self.contactInfo {
            checkMessage.numberOfLines = 0
            checkMessage.text = "\(msg)님\n 가입이 완료되었습니다"
            checkMessage.textAlignment = .center
        }
    
    }
    
    @IBAction func checkButtonClicked(_ sender: Any) {
        //create push view
        guard let loginVC =
                self.storyboard?.instantiateViewController(identifier: "LoginViewController")as? LoginViewController else{return}
        //add it to the navigation stack
        /*self.navigationController?
            .dismiss(animated: true, completion: nil)*/
        guard let pvc = self.presentingViewController else { return }

        self.dismiss(animated: true) {
          //pvc.present(loginVC, animated: false, completion: loginVC)
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
