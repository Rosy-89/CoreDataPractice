//
//  CoreDataManager.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 24/02/2021.
//

import Foundation
import CoreData

class CoreDataManager{
    
    static let shared = CoreDataManager()
    
    private init(){}
    
    func deleteTask(todo t: ToDo, completion: @escaping (Bool)->Void){
        
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        do{
            let result = try
                persistentContainer.viewContext.fetch(request)
            if result.count > 0
            {
                let todo = result.first!
                persistentContainer.viewContext.delete(todo)
                completion(true)
            }
        }
            catch let err {
                print(err.localizedDescription)
            }
        }
    
    
    func completeTask(todo t: ToDo, completion: @escaping (Bool)->Void){
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        print(t.id as Any)
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        do{
            let result = try persistentContainer.viewContext.fetch(request)
            if result.count > 0{
                let todo = result.first!
                todo.completed = true
                todo.completedDate = Date()
                saveContext()
                completion(true)
            }
        }
        catch let err{
            print(err.localizedDescription)
        }
    }
    
    func getAlltodos()->[ToDo]{
        
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        var todos = [ToDo]()
        do{
            todos = try persistentContainer.viewContext.fetch(request)
        }
        catch let err{
            print(err.localizedDescription)
        }
        return todos
    }
    
    func saveTodo(name: String, dueOn: Date,completion: @escaping(Bool)->Void){
        
        let todo = ToDo(context: persistentContainer.viewContext)
        todo.name = name
        todo.dueDate = dueOn
        todo.id = UUID()
        saveContext()
        completion(true)
    }
    lazy var persistentContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: "CoreDataPractice")
        
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

// MARK: - Core Data Saving support

func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
}
