//
//  CollectionViewCell.swift
//  ITFrogTestTask
//
//  Created by Daniel Golovin on 23.11.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var addList: UIButton!
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2 ,delay: 0) {
            self.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1.3
        }
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    func transformToStandart() {
        UIView.animate(withDuration: 0.2 ,delay: 0) {
            self.layer.borderWidth = 0
            self.transform = CGAffineTransform.identity
        }
    }
}
