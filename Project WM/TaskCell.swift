//
//  NewTask.swift
//  Project WM
//
//  Created by  User on 09.05.2024.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var titleNewTask: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var dateNewTask: UILabel!
    
    
    @IBOutlet weak var btnChecked: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
