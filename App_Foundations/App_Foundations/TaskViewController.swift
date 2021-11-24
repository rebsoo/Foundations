//
//  TaskViewController.swift
//  App_Foundations
//
//  Created by Maria Vitoria Soares Muniz on 22/11/21.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Deletar", style: .done, target: self, action: #selector(deleteTask))
    }
    

    @objc func deleteTask() {
        /*let newCount = count - 1
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
    */
    }

}
