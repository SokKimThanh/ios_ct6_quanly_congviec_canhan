////
////  homeViewController.swift
////  Project WM
////
////  Created by  vovanso on 09.05.2024.
////
//
//import UIKit
//class homeViewController: UIViewController,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let taskSet = data[indexPath.row]
//        let cell = table.dequeueReusableCell(withIdentifier: "TaskCell",for:indexPath) as! TaskCell
//        cell.titleNewTask.text = taskSet.title
//        cell.dateNewTask.text = taskSet.title
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
//        return data.count
//    }
//
//
//
//
//
//    @IBOutlet weak var table : UITableView!
//    @IBOutlet weak var btnAddTask: UIButton!
//    struct Task {
//        let title:String
//        let date:String
//    }
//    let data: [Task] = [Task(title: "An Com", date: "22/0/2002"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022"),Task(title: "Di Hoc", date: "22/2/2022")]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        btnAddTask.layer.cornerRadius = btnAddTask.frame.size.width / 2
//        btnAddTask.clipsToBounds = true
//        UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse , .repeat] , animations: {
//            self.btnAddTask.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//        },completion: nil)
//
//        table.dataSource = self
//
//
//    }
//
//
//}
