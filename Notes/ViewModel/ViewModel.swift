//
//  ViewModel.swift
//  Notes
//
//  Created by Karthik on 21/08/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import UIKit
import CoreData

class Parser {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var inputs = [Note]() 
    
    func insertData(for input : String){
       
        let ent = Notes(context: context)
        ent.input = input
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func readData(){
        let req : NSFetchRequest = Notes.fetchRequest()
        inputs.removeAll()
        do {
            let ent = try context.fetch(req)
            for i in ent {
                inputs.append(Note(input: i.value(forKey: "input") as? String))
            }
        } catch {
            
        }
    }
    
    func deleteRow(selected : Int){
        let req : NSFetchRequest = Notes.fetchRequest()
        do {
            let en = try context.fetch(req)
            context.delete(en[selected])
            try context.save()
            
        }
        catch {
            
        }
    }

}
