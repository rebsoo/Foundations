//
//  ViewController.swift
//  App_Foundations
//
//  Created by Maria Vitoria Soares Muniz on 22/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var tasks = [String]() //vetor que guarda todas as tarefas
    //var tasks = [MyTask]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tarefas" //nome da navigation bar da tela principal
       
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
            
        }
        updateTasks()
    }
    
    func updateTasks() {
        
        tasks.removeAll()
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String{
                tasks.append(task)
            }
            
        }
        
        tableView.reloadData()
        
    }
    
    //função responsável pela ação de adicionar uma tarefa
    @IBAction func didTapAdd(){
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title =  "Nova tarefa" //nome da navigation bar para adicionar uma tarefa
        vc.update = {
            DispatchQueue.main.async{
                self.updateTasks()
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}
//tela de edição da tarefa
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
    vc.title =  tasks[indexPath.row]
    vc.task = tasks[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }

}

/* Estrutura que guarda os campos das tarefas
struct MyTask {
    
    let title: String
    let date: Date
    let indentifier: String
}

 */
