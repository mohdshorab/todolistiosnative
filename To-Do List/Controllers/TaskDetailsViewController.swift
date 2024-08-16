//
//  TaskDetailsViewController.swift
//  To-Do List
//
//  Created by Mohd Shorab on 16/08/24.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task == nil {
            taskTitle.placeholder = "Enter the title"
            taskDesc.text = "Enter here"
        }
        else {
            taskTitle.text = task?.title
            taskDesc.text = task?.taskDesc
        }

        // Do any additional setup after loading the view.
    }
    
    
    var task : TaskEntity?
    
    @IBOutlet weak var taskTitle: UITextField!
    
    @IBOutlet weak var taskDesc: UITextView!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveData(_ sender: Any) {
        
        if (taskTitle.text == "" && taskDesc.text == "" || taskDesc.text == "Enter here"){
            let alertController = UIAlertController(title: "Empty Details", message: "Task details cant be empty.", preferredStyle: .alert)
            let alertForOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertForOk)
            present(alertController, animated: true, completion: nil)
        }
        
        else {
            
//    checking if we are getting data from previous screen, like if user click on task we using this same
            
            if task == nil {
                
                if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                    let task = TaskEntity( context: context)
                    task.title = taskTitle.text
                    task.taskDesc = taskDesc.text
                    task.isCompleted = false
                    
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    navigationController?.popViewController(animated: true)
                    print("Task Saved")
                }
            }
            
//            no changes so do nothing
            else {
                
                if taskTitle.text == task?.title && taskDesc.text == task?.taskDesc {
                    return
                } else {
                    
//Changes done => updating the same task => nav to previous screen
                    if ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) != nil {
                        // Update the existing entry instead of creating a new one
                        task?.title = taskTitle.text
                        task?.taskDesc = taskDesc.text
                        task?.isCompleted = false
                        
                        // Save the changes
                        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                        navigationController?.popViewController(animated: true)
                        print("Task Updated")
                    }
                    
                }
                
            }
        }
    }
    
    @IBAction func deleteData(_ sender: Any) {
        
        let buttonText = self.deleteButton.titleLabel?.text ?? ""
        var isDelete: Bool
        if buttonText == "Delete" {
            isDelete = true
        } else {
            isDelete = false
        }
        
        let title = isDelete ? "Confirm Deletion" : "Confirm Cancellation"
        let message = isDelete ? "Are you sure you want to delete?" : "Are you sure you want to cancel?"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let actionForYes = UIAlertAction(title: "Yes", style: .destructive) { _ in
            if isDelete {
                if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                    if let taskToBeDeleted = self.task {
                        context.delete(taskToBeDeleted)
                    }
                    try? context.save()
                }
            }
            self.navigationController?.popViewController(animated: true)
        }
        
        let actionForNo = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(actionForYes)
        alertController.addAction(actionForNo)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if task == nil {
            self.deleteButton.setTitle("Cancel", for: .normal)
        } else {
            self.deleteButton.setTitle("Delete", for: .normal)
        }
    }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
