//
//  AddNewTaskViewModel.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 24/02/2021.
//

import Foundation
import CoreData

class AddNewTaskViewModel{
    
    var name: String
    var date: Date
    
    init(name: String, date: Date)
    {
        self.name = name
        self.date = date
    }
    func saveTask(completion: @escaping (Bool)->Void){
        
        CoreDataManager.shared.saveTodo(name: self.name, dueOn: self.date,completion: completion)
        
        
    }
}
