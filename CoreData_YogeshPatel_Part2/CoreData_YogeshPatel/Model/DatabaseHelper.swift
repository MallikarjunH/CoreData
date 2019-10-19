//
//  DatabaseHelper.swift
//  CoreData_YogeshPatel
//
//  Created by mallikarjun on 27/09/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class DatabaseHelper{
    
    //Creating a instance - in order to access following fuctions to other classes
    static var sharedInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //MARK: Save Data
    func save(object:[String:String]){
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
         student.name = object["name1"]
         student.address = object["address1"]
         student.city = object["city1"]
         student.mobile = object["mobile1"]
        
        do{
            try context?.save()
        }catch{
            
            print("Data is not saved")
        }
    }
    
    //MARK: Get Data
    func getStudentData() -> [Student]{
        
      var student = [Student]()
       
      let featchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
     
        do{
            student = try context?.fetch(featchRequest) as! [Student]
        }catch{
            
            print("Can not get data")
        }
        
        return student
    }
    
    
    //MARK: Delete data
    
    func deleteData(index: Int) -> [Student]{
        
        var student = getStudentData()
        
        context?.delete(student[index])
        
        student.remove(at: index)
        
        do{
            try context?.save()
        }catch{
            print("not able to delete")
        }
        
        return student
    }
}
