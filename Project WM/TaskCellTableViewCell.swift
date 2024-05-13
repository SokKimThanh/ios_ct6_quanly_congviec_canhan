//
//  TaskCellTableViewCell.swift
//  Project WM
//
//  Created by  User on 10.05.2024.
//

import UIKit

class TaskCellTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
   
   
    @IBOutlet weak var lblContent: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    // set up task values
    func setCellWithValuesOf(_ task: TaskModel){
        lblContent.text = task.content
        lblDate.text = task.date
        
    }

}
