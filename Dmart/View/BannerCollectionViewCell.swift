//
//  BannerCollectionViewCell.swift
//  Dmart
//
//  Created by Avinash Shirsath on 04/12/21.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImageView: UIImageView!{
        didSet{
            bannerImageView.layer.cornerRadius = 4
            bannerImageView.clipsToBounds = true
        }
    }
    
}
