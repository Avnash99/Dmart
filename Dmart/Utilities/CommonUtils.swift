//
//  CommonUtils.swift
//  Dmart
//
//  Created by Avinash Shirsath on 05/12/21.
//

import UIKit
import IHProgressHUD

let screenSize: CGRect = UIScreen.main.bounds

class CommonUtilitis {
    
    static func showProgressIndicatorHud(message : String,show : Bool) {
        
        if show {
            
            IHProgressHUD.set(cornerRadius: 8)
            IHProgressHUD.set(defaultAnimationType: .flat)
            IHProgressHUD.set(backgroundLayerColor: .black)
            IHProgressHUD.set(defaultMaskType: .black)
            IHProgressHUD.set(defaultStyle: .light)
            
            if message.isEmpty {
                IHProgressHUD.show()
            }else {
                IHProgressHUD.show(withStatus: message)
            }
            
        } else {
            IHProgressHUD.dismiss()
        }
    }
}
