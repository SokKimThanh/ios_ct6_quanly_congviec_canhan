//
//  ListTaskTableViewController.swift
//  Project WM
//
//  Created by  User on 11.05.2024.
//

import UIKit

class ListTaskTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    private var viewModel = TaskScreenViewModel()
    
    @IBOutlet weak var tableTasksView: UITableView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "Your Task"
        // Connect to database
        viewModel.connectDatabase()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        tableTasksView.reloadData()
    }
    // MARK: - Table view data source

    private func loadData(){
        viewModel.loadDataFromSQLiteDatabase()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
               // Configure the cell...
               let object = viewModel.cellForRowAt(indexPath: indexPath)
               if let taskCell = cell as? TaskCellTableViewCell {
                   taskCell.setCellWithValuesOf(object)
               }
               return cell
        

    }
    // Delte row task
       func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
          if editingStyle == .delete {
              let task = viewModel.cellForRowAt(indexPath: indexPath)
              SQLiteCommands.deleteRow(taskId: task.id)
              // update giao dien sao khi xoa
              self.loadData()
              self.tableTasksView.reloadData()
          }
      }
     
      // MARK: - Navigation
  //
  //    // Passes selected contact from table cell to AddTaskViewCOntroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "editTask" {
              guard let newTaskViewController = segue.destination as? AddTaskViewController else {
                  return
              }
              guard let selectedTaskCell = sender as? TaskCellTableViewCell else {return}
              if let indexPath = tableTasksView.indexPath(for: selectedTaskCell) {
                 let selectedTask = viewModel.cellForRowAt(indexPath: indexPath)
                  newTaskViewController.viewModel = NewTaskViewModel(taskValue: selectedTask)
              }

          }
      }
    //        let reuse = "cell"
    //        if let cell = tableView.dequeueReusableCell(withIdentifier: reuse, for: indexPath) as? TaskCellTableViewCell {
    //            cell.lblContent.text = arrTask[indexPath.row].content
    //            cell.lblDate.text = arrTask[indexPath.row].date
    //            return cell
    //        }
    //        fatalError("khong return duoc")

    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numberOfRowsInSection(section: section)
//    }
//
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        // Configure the cell...
//        let object = viewModel.cellForRowAt(indexPath: indexPath)
//        if let taskCell = cell as? TaskCellTableViewCell {
//            taskCell.setCellWithValuesOf(object)
//        }
//        return cell
//    }
//
//
}
