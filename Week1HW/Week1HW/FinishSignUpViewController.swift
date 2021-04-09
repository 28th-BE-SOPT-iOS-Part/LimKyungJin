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
    
   //첫번째 뷰로 돌아가는 시도 
   override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //print("뷰가 사라졌습니다")
        
        guard let signupVC =
                self.storyboard?.instantiateViewController(identifier: "SignUpViewController")as? SignUpViewController else{return}
    
        guard let loginVC =
                self.storyboard?.instantiateViewController(identifier: "LoginViewController")as? LoginViewController else{return}

        signupVC.navigationController?.popToViewController(loginVC, animated: true)

        
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
        guard let signupVC =
                self.storyboard?.instantiateViewController(identifier: "SignUpViewController")as? SignUpViewController else{return}
        signupVC.navigationController?
            .popToRootViewController(animated: true)
 
               
        guard let pvc = self.presentingViewController else { return }

        pvc.dismiss(animated: true) {
            //방법1: singupVC 안에 선언한 returnHome() 함수를 호출하여 Login VC로 돌아가기
            //signupVC.returnHome()
            
            //방법2: navigationController의 popToRoot 사용
            signupVC.navigationController?
                .popToRootViewController(animated: true)
            
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
