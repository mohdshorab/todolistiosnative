//
//  TaskListTableTableViewController.swift
//  To-Do List
//
//  Created by Mohd Shorab on 16/08/24.
//

import UIKit

class TaskListTableTableViewController: UITableViewController {
    
    var tasks : [TaskEntity] = [];

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let entriesFromCoreEntity = try? context.fetch(TaskEntity.fetchRequest())
                as? [TaskEntity]{
                print("Fetching tasks from core data")
                tasks = entriesFromCoreEntity
                tableView.reloadData()
                
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Pending" : "Completed"
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filteredTasks = tasks.filter { $0.isCompleted == (section == 1) }
        return filteredTasks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskListCell", for: indexPath)
        let filteredTasks = tasks.filter { $0.isCompleted == (indexPath.section == 1) }
                let task = filteredTasks[indexPath.row]
                
                // Configure the cell
                cell.textLabel?.text = task.title ?? "Unable to fetch"
                return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: task)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let taskDetailViewController = segue.destination as? TaskDetailsViewController {
            if let taskGoingToBeSent = sender as? TaskEntity{
                taskDetailViewController.task = taskGoingToBeSent
            }
        }
    }

}
