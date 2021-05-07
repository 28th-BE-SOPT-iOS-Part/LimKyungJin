//
//  CollectionViewController.swift
//  Week1HW
//
//  Created by kyoungjin on 2021/05/07.
//

import UIKit

class CollectionViewController: UIViewController {
    
    private var cellList : [CellDataModel] = []

    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setCellList()
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }
    
    func setCellList() {
        
        cellList.append(contentsOf: [
            
            CellDataModel(imageName: "messageTabIcon", menu: "메일"),
            
                            CellDataModel(imageName: "calendar", menu: "캘린더"),
                            
                            CellDataModel(imageName: "tray", menu: "서랍"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "카카오콘"),
                            
                            CellDataModel(imageName: "pencil", menu: "메이커스"),
                            
                            CellDataModel(imageName: "giftcard", menu: "선물하기"),
                            
                            CellDataModel(imageName: "face.smiling", menu: "이모티콘"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "프렌즈"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "쇼핑하기"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "스타일"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "주문하기"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "멜론티켓"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "게임"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "멜론"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "헤어샵"),
                            
                            CellDataModel(imageName: "messageTabIcon", menu: "전체서비스"),
                            ])
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

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)as?CollectionViewCell else {return UICollectionViewCell()}
        
        Cell.setData(imageName: cellList[indexPath.row].imageName, menu: cellList[indexPath.row].menu)
        
        return Cell
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
}

extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * 0.2
        
        let cellHeight = cellWidth * 0.85
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int)->UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
}
