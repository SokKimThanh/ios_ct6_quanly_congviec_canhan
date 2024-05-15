//
//  SQLiteCommands.swift
//  Project WM
//
//  Created by  User on 11.05.2024.
//

import Foundation
import SQLite
class SQLiteCommands {
    static var table = Table("task")
    static var tableUsers = Table("users")
    //Expressions task
    static let id = Expression<Int>("id")
    static let content = Expression<String>("content")
    static let date = Expression<String>("date")
    //Expressions users
    static let userId = Expression<Int>("id")
    static let username = Expression<String>("username")
    static let password = Expression<String>("password")
    // Creating table
    static func createTable (){
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Database connect error")
            return
        }
        do {
            // Create table Taks
            try database.run(table.create(ifNotExists: true)  {  table in
                table.column(id, primaryKey: true)
                table.column(content)
                table.column(date)
            })
           
        }
        catch{
            print("Table already exists \(error)")
        }
    }
    // Creating user table
       static func createUserTable() {
           guard let database = SQLiteDatabase.sharedInstance.database else {
               print("Database connect error")
               return
           }
           do {
               try database.run(tableUsers.create(ifNotExists: true) { table in
                   table.column(userId, primaryKey: true)
                   table.column(username, unique: true)
                   table.column(password)
               })
           } catch {
               print("Table already exists \(error)")
           }
       }
    static func insertUser(username: String, password: String) -> Bool {
           guard let database = SQLiteDatabase.sharedInstance.database else {
               print("Datastore connection error")
               return false
           }
           do {
               try database.run(tableUsers.insert(self.username <- username, self.password <- password))
               return true
           } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
               print("Insert user failed: \(message), in \(String(describing: statement))")
               return false
           } catch let error {
               print("Insert user failed: \(error)")
               return false
           }
       }
    static func verifyUser(username: String, password: String) -> Bool {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return false
        }
        do {
            let query = tableUsers.filter(self.username == username && self.password == password)
            let user = try database.pluck(query)
            return user != nil
        } catch {
            print("User verification failed: \(error)")
            return false
        }
    }

  
   
    static func insertRow(_ taskValues:TaskModel)->Bool? {
        guard let databae = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error ")
            return nil
        }
        do {
            try databae.run(table.insert(content <- taskValues.content, date <- taskValues.date))
            return true
        }
        catch let Result.error(message , code , statement) where code == SQLITE_CONSTRAINT{
            print("Insert row failed : \(message) , in \(String(describing: statement))")
            return false
            
        }
        catch let error {
            print("Insert faield : \(error)")
            return false
        }
    }
    // Update Row
    static func updateRow (_ taskValues: TaskModel) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        //Extracts
        let task = table.filter(id == taskValues.id).limit(1)
        do {
            if try database.run(task.update(content <- taskValues.content,date <- taskValues.date)) > 0 {
                print("Update Task Suceess")
                return true
            }
            else {
                print("Could not update Task")
                return false
            }
        }
        catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT{
            print("Update row faild \(message) ,in \(String(describing: statement))")
            return false
            
        }
        catch let error {
            print("update Faild \(error)")
            return false
        }
    }
    // Present Rows
    static func preesentRows() -> [TaskModel]? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        var taskArray = [TaskModel]()
        
        table = table.order(id.desc)
        do {
            for task in try database.prepare(table){
                let idValue = task[id]
                let contentValue = task[content]
                let dateValue = task[date]
                
                // Creating objectc
                let taskObject = TaskModel(id: idValue, content: contentValue, date: dateValue)
                // Add object to an array
                taskArray.append(taskObject)
                print("id \(task[id]) , content : \(task[content]) , date : \(task[date])")
            }
        } catch {
            print("Present row error \(error)")
        }
        return taskArray
    }
    // Delete Row
    static func deleteRow(taskId: Int) {
        guard let database = SQLiteDatabase.sharedInstance.database else{
            print("Datastore connection error")
            return
        }
        do {
            let task = table.filter(id == taskId).limit(1)
            try database.run(task.delete())
        }
        catch {
            print("Delete Row fail \(error)")
        }
    }
}
