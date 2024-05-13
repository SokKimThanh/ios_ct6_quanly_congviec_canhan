////
////  WorkManagementDaTabase.swift
////  Project WM
////
////  Created by  vovanso on 07.05.2024.
////
//
//import Foundation
//import UIKit
////import os.log
////import SQLite3
//var shareInstance = DatabaseLayer()
//class DatabaseLayer {
//    var database : FMDatabase? = nil
//    static func getInstance()-> DatabaseLayer {
//        if shareInstance.database == nil {
//            shareInstance.database = FMDatabase(path: SQLiteDatase.sharedInstance.getPath(dbName: "SQLiteMW.db"))
//        }
//        return shareInstance
//    }
//    //MARK: SAving task Data
//    func SaveTask(task: TaskModel)-> Bool{
//        shareInstance.database?.open()
//        let isSave = shareInstance.database?.executeUpdate("INSERT INTO task (content,date) VALUES(?,?))", withArgumentsIn: [task.content,task.date])
//        shareInstance.database?.close()
//        return isSave!
//    }
//
//}
