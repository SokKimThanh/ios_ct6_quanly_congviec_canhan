//
//  AddTaskViewController.swift
//  Project WM
//
//  Created by  User on 10.05.2024.
//

import UIKit


class AddTaskViewController: UIViewController,UITextFieldDelegate {

  @IBOutlet weak var txtContent: UITextField!
    
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var textFieldDate: UITextField!
    
    
    var viewModel: NewTaskViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        setUpViews()
        txtContent.delegate = self
    
       
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtContent.resignFirstResponder()
        return true
    }
    // MARK: Connect to datase and create table
    private func createTable(){
//         SQLiteDatase.sharedInstance.database.createTable()
        SQLiteCommands.createTable()
       
    }
    private func setUpViews() {
        if let viewModel = viewModel {
            txtContent.text = viewModel.content
            textFieldDate.text = viewModel.date
            
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let id: Int = viewModel == nil ? 0 : viewModel.id!
        let content = txtContent.text ?? ""
        let date = textFieldDate.text ?? ""
        let taskValues = TaskModel(id: id, content: content, date: date)
        if viewModel == nil {
            createNewTask(taskValues)
        }else {
                updateTask(taskValues)
        }
    }
  
    @IBAction func btnAddTask(_ sender: UIButton) {
        
        let id: Int = viewModel == nil ? 0 : viewModel.id!
        let content = txtContent.text ?? ""
        let date = textFieldDate.text ?? ""
        let taskValues = TaskModel(id: id, content: content, date: date)
        if viewModel == nil {
            createNewTask(taskValues)
            
        }else {
                updateTask(taskValues)
        }
        
      
        
    }
    private func createNewTask(_ taskValues: TaskModel){
        let taskAddedToTable = SQLiteCommands.insertRow(taskValues)
        if taskAddedToTable == true {
            dismiss(animated: true,completion: nil)
        }
        else {
            showError("Error", message: "Nhap Lai Du Lieu ")
        }
    }
    
    @IBAction func cacelButton(_ sender: Any) {
//        let addButtonClicked = presentingViewController is UINavigationController
//        if addButtonClicked {
          dismiss(animated: true,completion: nil)
//        }
//        else if let cellClicked = navigationController {
//            cellClicked.popViewController(animated: true)
//
//        }
//        else {
//            print("The TaskScreenTableViewController is not inside a navigation controller")
//        }
    }
    // MARK: Update Task
    private func updateTask(_ taskValues: TaskModel) {
        let taskUpdatedInTable = SQLiteCommands.updateRow(taskValues)
        // Phone number number is unique to each task so we check if it alreadly exists
        if taskUpdatedInTable == true {
            if let cellClicked = navigationController {
                cellClicked.popViewController(animated: true)
            }
            else {
                showError("Error", message: "This task cannot be updated")
            }
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
