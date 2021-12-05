//
//  DmartBase.swift
//  Dmart
//
//  Created by Avinash Shirsath on 04/12/21.
//

import Foundation
import UIKit

class DmartBase: UIViewController,UINavigationControllerDelegate ,UIPopoverPresentationControllerDelegate {
    
    func backNavigation() {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "arrowback"), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        button.addTarget(self, action: #selector(popToNavigation), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    @objc func popToNavigation() {
        self.navigationController?.popViewController(animated: true)
    }
}
