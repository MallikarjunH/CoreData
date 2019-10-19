//
//  ViewSavedDataVC.swift
//  CoreData_YogeshPatel
//
//  Created by mallikarjun on 01/10/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit


class ViewSavedDataVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var mainTableView: UITableView!
    
    var student = [Student]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        student = DatabaseHelper.sharedInstance.getStudentData()
        // Do any additional setup after loading the view.
        
    }

    //MARK: TableView Datasource and Delegate method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! TableViewCell
        
      /*  cell.nameLabel.text = student[indexPath.row].name
        cell.addressLabel.text = student[indexPath.row].address
        cell.cityLabel.text = student[indexPath.row].city
        cell.mobileLabel.text = student[indexPath.row].mobile */
        
        //or with computed propertied
        cell.student = student[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
        if editingStyle == .delete {
            
            student = DatabaseHelper.sharedInstance.deleteData(index: indexPath.row)
            
            self.mainTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
