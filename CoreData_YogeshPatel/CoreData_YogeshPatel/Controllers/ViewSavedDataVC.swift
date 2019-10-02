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
        
        cell.nameLabel.text = student[indexPath.row].name
        cell.emailLabel.text = student[indexPath.row].email
        cell.mobileLabel.text = student[indexPath.row].mobile
        cell.stateLabel.text = student[indexPath.row].state
        
        return cell
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
