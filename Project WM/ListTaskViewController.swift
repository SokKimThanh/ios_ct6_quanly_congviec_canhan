////
////  ListTaskViewController.swift
////  Project WM
////
////  Created by  User on 10.05.2024.
////
//
//import UIKit
//
//class ListTaskViewController: UIViewController {
//
//    @IBOutlet weak var tblView: UITableView!
//    //var tasks = [TaskModel]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        tasks = [
////            TaskModel(id: "1", content: "aa", date: "222"),
////            TaskModel(id: "2", content: "xzcxc", date: "adad222")
////             ]
//
//             // Reload the table view to display the data
//          //   tblView.reloadData()
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
////extension ListTaskViewController: UITableViewDelegate, UITableViewDataSource{
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return tasks.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCellTableViewCell", for: indexPath) as! TaskCellTableViewCell
////        let task = tasks[indexPath.row]
////
////            // Populate the cell with task data
////            cell.lblDate.text = task.date
////            cell.lblContent.text = task.content
////
////
////        return cell
////    }
////    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////        return 120
////    }
////
////
////}
