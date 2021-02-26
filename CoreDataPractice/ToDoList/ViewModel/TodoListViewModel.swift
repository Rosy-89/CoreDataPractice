//
//  TodoListViewModel.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 24/02/2021.
//

import Foundation

class TodoListViewModel{
    
    var todos = [ToDo]()
    
    var count: Int{
        return todos.count
    }
    init(){
        self.refreshData()
    }
    func todoAtIndex(_ index: Int)->ToDo{
        return todos[index]
    }
    func refreshData(){
        self.todos = CoreDataManager.shared.getAlltodos()
    }
    func completeTaskAtIndex(_ index: Int, completion: @escaping (Bool)->Void){
        self.refreshData()
        print(todos[index])
        CoreDataManager.shared.completeTask(todo: todos[index], completion: completion)
    }
    func deleteTask(_ index: Int, completion: @escaping(Bool)-> Void){
        
        CoreDataManager.shared.deleteTask(todo: todos[index]){(_) in
            self.refreshData()
            completion(true)
            
        }
    }
}
