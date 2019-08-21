//
//  ViewController.swift
//  Notes
//
//  Created by Karthik on 21/08/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        tv.dataSource = self
        parser.readData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let parser = Parser()

    @IBOutlet var tv: UITableView!
    
    @IBOutlet var tfEnter: UITextField!
    
    
    @IBAction func SaveButtonTapped(_ sender: Any) {
       
        var text = tfEnter.text
        if text == "" {
            Helper.showAlert(for: self, with: "enter valid input")
            return
        }
        if text!.count >= 140 {
            Helper.showAlert(for: self, with: "more than 140 chars not allowed!")
            return
        }
       text = text!.stripHTML()
       text = text!.trimmingCharacters(in: CharacterSet(charactersIn: "[<>/:&+%;\"]|\\.\\w{2,4}"))
        
      
        
        parser.insertData(for: text!)
        parser.readData()
        tv.reloadData()
        tfEnter.text = nil
    }
}





