//
//  ViewController.swift
//  CoreData_YogeshPatel
//
//  Created by mallikarjun on 27/09/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

//Video 1: https://www.youtube.com/watch?v=JTtYSJtVKMc


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let dict = ["name":nameTextField.text,"email":emailTextField.text,"mobile":mobileTextField.text,"state":stateTextField.text]
        
        DatabaseHelper.shareInstance.save(object: dict as! [String : String])
    }
    
    //MARK: TextField Delagate mthods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}
