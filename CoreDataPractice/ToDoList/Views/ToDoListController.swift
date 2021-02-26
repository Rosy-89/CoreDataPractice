//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 23/02/2021.
//

import UIKit
import CoreData

class ToDoListController: UIViewController{
    

    @IBOutlet weak var tableView: UITableView!
    
    //var mockToDo = [ToDo]()
    var vm = TodoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 44
       // mockData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.refreshData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    /*func mockData(){
        
        let todo = ToDo(context: CoreDataManager.shared.persistentContainer.viewContext)
        todo.name = "Some name"
        todo.dueDate = Date()
        todo.id = UUID()
        todo.completed = false
        for _ in 0...9{
            mockToDo.append(todo)
        }
    }*/

}
extension ToDoListController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vm.count //mockToDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TodoViewCell
        //cell.todo = mockToDo[indexPath.row]
        cell.todo = vm.todoAtIndex(indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let todo = vm.todoAtIndex(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        
        if todo.completed == false{
            
        let alertController = UIAlertController(title: "Completed", message: "Mark this task as completed?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
                self.vm.completeTaskAtIndex(indexPath.row) { (_) in
                    self.tableView.reloadData()
                }
            }))
            alertController.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
            present(alertController, animated: true)
        }
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
            
            if editingStyle == .delete {
                       vm.deleteTask(indexPath.row) { (_) in
                        tableView.deleteRows(at: [indexPath], with: .fade)
                       }
            }
        
    }
    
}

