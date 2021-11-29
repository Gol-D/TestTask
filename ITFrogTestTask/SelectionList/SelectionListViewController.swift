//
//  AddListViewController.swift
//  ITFrogTestTask
//
//  Created by Daniel Golovin on 23.11.2021.
//

import UIKit



class SelectionListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISheetPresentationControllerDelegate {
    
    @IBOutlet weak var listsCollectionView: UICollectionView!
    private let listsCollectionViewFlowLayout = ListsCollectionViewFlowLayout()
    var centerCell: CollectionViewCell?
    override var sheetPresentationController:UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listsCollectionView.delegate = self
        listsCollectionView.dataSource = self
        listsCollectionView.collectionViewLayout = self.listsCollectionViewFlowLayout
        presentModal()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let layoutMargins:CGFloat = self.listsCollectionView.layoutMargins.left + self.listsCollectionView.layoutMargins.right
        let sideInset = (self.view.frame.width / 2) - layoutMargins
        self.listsCollectionView.contentInset = UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    var lists = [0xFFFFFF]
    
     func presentModal() {
       
         sheetPresentationController.delegate = self
         sheetPresentationController.selectedDetentIdentifier = .medium
         sheetPresentationController.prefersGrabberVisible = true
         sheetPresentationController.detents = [.medium(),.large()]
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdentifier = (indexPath.item == 0) ? "CellAdd" : "Cell"
        
        let cell = listsCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.clipsToBounds = true
        cell.layer.cornerRadius = cell.frame.width / 2
        cell.backgroundColor = uiColorFromHex(rgbValue: lists[indexPath.row])
        
        return cell
    }
                                                      
        func uiColorFromHex(rgbValue: Int) -> UIColor {
          
          let red =   CGFloat((rgbValue & 0xFF0000) >> 16) / 0xFF
          let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 0xFF
          let blue =  CGFloat(rgbValue & 0x0000FF) / 0xFF
          let alpha = CGFloat(1.0)
          
          return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }
        
        let centerPoint = CGPoint(x: self.listsCollectionView.frame.size.width / 2 + scrollView.contentOffset.x,
                                  y: self.listsCollectionView.frame.size.height / 2 + scrollView.contentOffset.y)
        
        if let indexPath = self.listsCollectionView.indexPathForItem(at: centerPoint) {
            self.centerCell = (self.listsCollectionView.cellForItem(at: indexPath) as! CollectionViewCell)
            self.centerCell?.transformToLarge()
        }
        
        if let cell = centerCell {
            let offsetX = centerPoint.x - cell.center.x
            
            if offsetX < -30 || offsetX > 30 {
                cell.transformToStandart()
                self.centerCell = nil
            }
        }
    }
}

