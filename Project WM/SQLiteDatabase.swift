//
//  SQLiteDatabase.swift
//  Project WM
//
//  Created by  User on 09.05.2024.
//

import Foundation
import SQLite

class SQLiteDatabase {
    static let sharedInstance = SQLiteDatabase()
    var database: Connection?
    
    private init() {
        // Connection to database
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("projectWM").appendingPathExtension("sqlite3")
                database = try Connection(fileUrl.path)
        }
        catch {
            print("Creating connection to database error \(error)")
        }
    }
    
    // MARK: - Creating table
    func createTable() {
        SQLiteCommands.createTable()
    }
}

    // GEt URl of database
  //  func getPath(dbName:String)->String {
      //  let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    //    let fileUrl = documentDirectory.appendingPathComponent(dbName)
      //  return fileUrl.path
  //  }
    // MARK: If database is not exists the creating database path
  //  func copyDatabase(dbName:String) {
    //    let dbPath = getPath(dbName: "SQLiteMW.db")
    //    let fileManager = FileManager.default
    //    if !fileManager.fileExists(atPath: dbPath){
      //      let bundle = Bundle.main.resourceURL
      //      let file = bundle?.appendingPathComponent(dbName)
       //     do {
          //      try fileManager.copyItem(atPath: file!.path, toPath: dbPath)
      //      }
       //     catch let err {
          //      print(err.localizedDescription)
      //      }
 //       }
        
    

