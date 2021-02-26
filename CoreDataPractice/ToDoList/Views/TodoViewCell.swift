//
//  TodoViewCell.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 23/02/2021.
//

import UIKit

class TodoViewCell: UITableViewCell {

    @IBOutlet private weak var taskLabel: UILabel!
    
    @IBOutlet private weak var taskdueDateLabel: UILabel!
    
    @IBOutlet private weak var taskcompletedDateLabel: UILabel!
    
    var todo: ToDo? {
        didSet{
            if let todo = todo{
                if todo.completed == false
                {
                    taskLabel.text = todo.name
                    taskdueDateLabel.text = String(format: "Due on %@", todo.dueDate!.toString(format: "MM dd yyyy"))
                    taskcompletedDateLabel.text = "To be completed"
                }
                else{
                    taskLabel.attributedText = todo.name?.strikeThrough()
                    taskdueDateLabel.attributedText = String(format: "Due on %@", todo.dueDate!.toString(format: "MM dd yyyy")).strikeThrough()
                    taskcompletedDateLabel.text = String(format: "Completed on %@", todo.completedDate!.toString(format: "MM dd yyyy"))
                }
              }
            }
        }
    //added to reuse the cell
    override func prepareForReuse() {
        
        taskLabel.attributedText = taskLabel.text?.removeAttributedText()
        taskdueDateLabel.attributedText = taskdueDateLabel.text!.removeAttributedText()
        
        taskLabel.text = ""
        taskdueDateLabel.text = ""
        taskcompletedDateLabel.text = ""
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


