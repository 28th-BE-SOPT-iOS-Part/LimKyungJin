//
//  FriendViewController.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/04/23.
//

import UIKit

class FriendViewController: UIViewController {

    
    @IBOutlet weak var friendsTableView: UITableView!
    
    var friendList: [FriendDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setFriendList()
        
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        friendsTableView.separatorStyle = .none
    }
    
    
    func setFriendList()
        {
            friendList.append(contentsOf: [
                
                FriendDataModel(imageName: "friendtabProfileImg",
                                name: "김솝트",
                                state: "시험이 안끝나요"),
                
                FriendDataModel(imageName: "profileImage1",
                                name: "안솝트",
                                state: "종강이 고파요"),
                
                
                FriendDataModel(imageName: "profileImage2",
                                name: "최솝트",
                                state: "자도 자도 졸려요"),
                
                FriendDataModel(imageName: "profileImage3",
                                name: "정솝트",
                                state: "떡볶이..로제 떡볶이..."),
                
                FriendDataModel(imageName: "profileImage4",
                                name: "이솝트",
                                state: "애옹.."),
                
                FriendDataModel(imageName: "profileImage5",
                                name: "유솝트",
                                state: "오늘은 일찍 자야지"),
                
                FriendDataModel(imageName: "profileImage6",
                                name: "박솝트",
                                state: "왈왈.."),
                
                FriendDataModel(imageName: "profileImage7",
                                name: "최솝트",
                                state: "날씨 왜이럴까여"),
                
                FriendDataModel(imageName: "profileImage8",
                                name: "원솝트",
                                state: "떡...볶ㅇ..."),
                
                FriendDataModel(imageName: "profileImage9",
                                name: "투솝트",
                                state: "내꿈은 대나무부자"),
                
                FriendDataModel(imageName: "profileImage10",
                                name: "권솝트",
                                state: "종강 coming soon!")
                
                
                
            ])
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

extension FriendViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}

extension FriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)as? TableViewCell else {return UITableViewCell() }
               
        friendCell.setData(imageName: friendList[indexPath.row].imageName,
                                   name: friendList[indexPath.row].name,
                                   state: friendList[indexPath.row].state)
               
               return friendCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           if let profileVC = storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController {
               
            profileVC.modalPresentationStyle = .fullScreen
            
            profileVC.name = friendList[indexPath.row].name
            profileVC.image = friendList[indexPath.row].imageName

            self.present(profileVC, animated: true, completion: nil)
           }
    }
    
    
}
