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

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: Save data
    @IBAction func saveDataButtonClicked(_ sender: Any) {
    
        let dict = ["name1":nameTextField.text,"address1":addressTextField.text,"city1":cityTextField.text,"mobile1":mobileTextField.text]
        
        DatabaseHelper.sharedInstance.save(object: dict as! [String : String])
        
        //print("Document Directory :",FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found")
          
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
          
          let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
          request.returnsObjectsAsFaults = false
         
          do {
              let result = try context.fetch(request)
              for data in result as! [NSManagedObject] {
                 print(data.value(forKey: "name") as! String)
            }
              
          } catch {
              
              print("Failed")
          } 
        
    }
    
    //MARK: Show Data
    @IBAction func showDataButtonClicked(_ sender: Any) {
        
        
  
    }
    
}
