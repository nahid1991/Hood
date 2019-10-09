//
//  AvatarControllerVC.swift
//  Hood
//
//  Created by Nahid on 5/10/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import UIKit

class AvatarControllerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var imageString: String = ""
    
    // Variables
    var avatarType = AvatarType.dark
    var instanceOfCreateAccntVC: CreateAccntVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            self.avatarType = .dark
        } else {
            self.avatarType = .light
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numOfColumns: CGFloat = 3
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        
        if UIScreen.main.bounds.width > 320 {
            numOfColumns = 4
        }
        
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var avatarString = "dark"
        
        if avatarType == .light {
            avatarString = "light"
        }
        
        UserDataService.instance.setAvatarName(avatarName: "\(avatarString)\(indexPath.item)") { (success) in
            if UserDataService.instance.avatarName != "" {
                self.dismiss(animated: true, completion: nil)
            } else {
                debugPrint("Something went wrong!")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return AvatarCell()
    }
    
}
