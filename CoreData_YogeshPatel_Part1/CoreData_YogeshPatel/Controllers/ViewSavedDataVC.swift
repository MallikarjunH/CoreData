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
        
        cell.nameLabel.text = student[indexPath.row].name
        cell.addressLabel.text = student[indexPath.row].address
        cell.cityLabel.text = student[indexPath.row].city
        cell.mobileLabel.text = student[indexPath.row].mobile
        
        return cell
        
    }
    

}
