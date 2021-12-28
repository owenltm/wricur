//
//  ProfileViewController.swift
//  wricur
//
//  Created by Hendry Gunawan on 07/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

@IBDesignable extension UITextField {
    @IBInspectable var borderWidth: CGFloat{
        set{
            layer.borderWidth = newValue
        }
        get{
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set{
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set{
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get{
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var account: AccountEntity?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome" {
            let dest = segue.destination as! HomeViewController
            
            dest.account = account
        } else if segue.identifier == "goToOwned" {
            let dest = segue.destination as! OwnViewController
            
            dest.account = account
        } else if segue.identifier == "goToCreate" {
            let dest = segue.destination as! CreateViewController
            
            dest.account = account
        }
    }

}
