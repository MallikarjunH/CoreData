//
//  ViewSavedDataVC.swift
//  CoreData_YogeshPatel
//
//  Created by mallikarjun on 01/10/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

protocol DataPass {
    
    func data(object: [String:String])
}

class ViewSavedDataVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    //creating delegate
    var delegate:DataPass!
    
    var student  = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        student = DatabaseHelper.shareInstance.getStudentData()
    }
    
     // MARK: - TableViee DatSource and Deleagte Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return student.count
        //return DatabaseHelper.shareInstance.getStudentData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! TableViewCell
        
     /*   cell.nameLabel.text = student[indexPath.row].name
        cell.emailLabel.text = student[indexPath.row].email
        cell.mobileLabel.text = student[indexPath.row].mobile
        cell.stateLabel.text = student[indexPath.row].state */
        
        //using computed property - code written in TableViewCell - So top code not need
        cell.student = student[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["name":student[indexPath.row].name, "email":student[indexPath.row].email,"mobile":student[indexPath.row].mobile,"state":student[indexPath.row].state]
        delegate.data(object: dict as! [String: String])
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            student = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.mainTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
