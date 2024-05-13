//
//  NewTaskViewModel.swift
//  Project WM
//
//  Created by  User on 11.05.2024.
//

import UIKit
class NewTaskViewModel {
    private var taskValue: TaskModel?
    let id: Int?
    let content: String?
    let date: String?
    init(taskValue: TaskModel?) {
        self.taskValue = taskValue
      
        self.id = taskValue?.id
        self.content = taskValue?.content
        self.date = taskValue?.date
    }
}
