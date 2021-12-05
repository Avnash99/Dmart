//
//  GridCollectionViewCell.swift
//  Dmart
//
//  Created by Avinash Shirsath on 04/12/21.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var grideImageView: UIImageView!{
        didSet{
            grideImageView.layer.cornerRadius = 4
            grideImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var lblTitle: UILabel!
    
}
