//
//  EntryViewController.swift
//  App_Foundations
//
//  Created by Maria Vitoria Soares Muniz on 22/11/21.
//


// aqui terá um campo onde o usuário pode inserir uma nova tarefa
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    //@IBOutlet var descriptionField: UITextField!
    
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar" , style: .done, target: self, action: #selector(saveTask))

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        
        return true
    }

    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else{
            return
            
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        navigationController?.popViewController(animated: true)
    }

}
