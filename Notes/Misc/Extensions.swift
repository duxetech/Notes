//
//  Extensions.swift
//  Notes
//
//  Created by Karthik on 21/08/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import UIKit

let htmlReplaceString : String  =   "<[^>]+>" //"<[/:&+%;\"|\\.\\w{2,4}]+>"

extension String {
    
    func stripHTML() -> String {
        return self.replacingOccurrences(of: htmlReplaceString, with: "", options: CompareOptions.regularExpression, range: nil)
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parser.inputs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = parser.inputs[indexPath.row].input
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            parser.deleteRow(selected: indexPath.row)
            parser.readData()
            tv.reloadData()
        }
    }
    
    
}
