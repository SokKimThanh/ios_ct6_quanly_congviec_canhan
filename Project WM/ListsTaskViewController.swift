//
//  ListsTaskViewController.swift
//  Project WM
//
//  Created by  User on 11.05.2024.
//

import UIKit

class ListsTaskViewController: UIViewController {
    private var viewModel = TaskScreenViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "TaskModels"
    }
    override func tableView(_ tableView: UITableView , numberOfRowsInSection section: Int)-> Int {
        viewModel.numberOfRowsInSection(section: section)
    }
    override func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "")
    }

   
}
