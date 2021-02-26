//
//  AddNewtaskViewController.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 24/02/2021.
//

import UIKit

class AddNewtaskViewController: UITableViewController {

    @IBOutlet weak var taskdueDate: UIDatePicker!
    @IBOutlet weak var taskName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskdueDate.minimumDate = Date()
        tableView.tableFooterView = UIView()
        
    }

    @IBAction func saveNewTask(_ sender: UIBarButtonItem) {
        
        let vm = AddNewTaskViewModel(name: taskName.text ?? "No name", date: taskdueDate.date)
        
        vm.saveTask { _ in
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
