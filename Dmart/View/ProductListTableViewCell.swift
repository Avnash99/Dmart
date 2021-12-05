//
//  ProductListTableViewCell.swift
//  Dmart
//
//  Created by Avinash Shirsath on 04/12/21.
//

import UIKit
import SDWebImage

class ProductListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!{
        didSet{
            self.imgView.layer.cornerRadius = 4
            self.imgView.clipsToBounds = true
        }
    }
    @IBOutlet weak var btnAddToCart: UIButton!{
        didSet{
            btnAddToCart.layer.cornerRadius = 6
            btnAddToCart.clipsToBounds = true
        }
    }
    @IBOutlet weak var btnQuantityInLtr: UIButton!{
        didSet{
            btnQuantityInLtr.layer.cornerRadius = 6
            btnQuantityInLtr.clipsToBounds = true
            btnQuantityInLtr.layer.borderWidth = 2
            btnQuantityInLtr.layer.borderColor = UIColor.init(red: 48/255, green: 155/255, blue: 89/255, alpha: 1).cgColor
        }
    }
    
    var onTapOfAddToCart : ((UIButton)->Void)? = nil
    var onTapOfQuantityInLtr : ((UIButton)->Void)? = nil
    
    @IBAction func cellBtnClicked(_ sender: UIButton) {
        if sender.tag == 100 {
            self.onTapOfQuantityInLtr?(sender)
        } else {
            self.onTapOfAddToCart?(sender)
        }
    }
    
    func customCellSetUp(image: String) {
        self.imgView.image = UIImage(named: image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
