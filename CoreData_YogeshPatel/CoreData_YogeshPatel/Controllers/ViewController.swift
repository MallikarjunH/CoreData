//
//  ViewController.swift
//  CoreData_YogeshPatel
//
//  Created by Nikits on 27/09/19.
//  Copyright © 2019 Nikita H. All rights reserved.
//

//Video 1: https://www.youtube.com/watch?v=JTtYSJtVKMc
//Video 2: https://www.youtube.com/watch?v=WCCafo-OPn8


import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate, DataPass {
    

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
        
        //print("Document Directory :",FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found")
        
      /*  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        request.returnsObjectsAsFaults = false
       
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
               print(data.value(forKey: "name") as! String)
          }
            
        } catch {
            
            print("Failed")
        } */
        
    }
    
    //Mark: Confirm The Protocol
    func data(object: [String : String]) {
         nameTextField.text = object["name"]
         emailTextField.text = object["email"]
         mobileTextField.text = object["mobile"]
         stateTextField.text = object["state"]
    }
    
    
   // ViewSavedDataVC //
    @IBAction func showDataButtonClicked(_ sender: Any) {
        
        let detailsVC = self.storyboard?.instantiateViewController(identifier: "ViewSavedDataVCId") as! ViewSavedDataVC
        detailsVC.delegate = self
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    //MARK: TextField Delagate mthods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}
