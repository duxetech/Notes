//
//  Helper.swift
//  Notes
//
//  Created by Karthik on 21/08/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import UIKit


class Helper {
    
  static  func showAlert(for ui : UIViewController, with text : String) {
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        ui.present(alert, animated: true)
    }
}
