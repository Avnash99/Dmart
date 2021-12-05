//
//  SignInView.swift
//  Dmart
//
//  Created by Avinash Shirsath on 04/12/21.
//

import Foundation
import UIKit

class SignInView: UIViewController {
    
    @IBOutlet weak var btnDmart: UIButton!{
        didSet{
            self.btnDmart.layer.cornerRadius = 4
            self.btnDmart.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DMart"
    }
    
    @IBAction func btnDmartClicked(_ sender: UIButton) {
        
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
