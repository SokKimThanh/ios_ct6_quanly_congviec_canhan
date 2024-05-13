//
//  TaskScreenViewModel.swift
//  Project WM
//
//  Created by  User on 11.05.2024.
//

import Foundation
class TaskScreenViewModel {
    private var taskArray = [TaskModel]()
    
    func connectDatabase () {
        _ = SQLiteDatabase.sharedInstance
    }
    func loadDataFromSQLiteDatabase () {
        taskArray = SQLiteCommands.preesentRows() ?? []
    }
    func numberOfRowsInSection(section: Int) -> Int {
        if taskArray.count != 0 {
            return taskArray.count
        }
        return 0
    }
    func cellForRowAt(indexPath: IndexPath) -> TaskModel{
        return taskArray[indexPath.row]
        
    }
}
