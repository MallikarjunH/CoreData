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
    
    static var shareInstance = DatabaseHelper() //it is required if you want to access following method outside any class
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
        student.name = object["name"]
        student.email = object["email"]
        student.mobile = object["mobile"]
        student.state = object["state"]
        
        do{
            
            try context?.save()
        }catch{
          print("daata is not save")
        }
    
    }
    
    func getStudentData() -> [Student]{
        
        var student =  [Student]()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
         request.returnsObjectsAsFaults = false
        
         do {
            
            student = try context?.fetch(request) as! [Student]
    
         }catch {
             
             print("Failed")
         }
         return student
    }
    
    func deleteData(index:Int) -> [Student]{
      
        var student1 =  getStudentData()
        
        context?.delete(student1[index])
        student1.remove(at: index)
        
        do{
            try context?.save()
        }catch{
            print("Cant delete Data")
        }
        
        return student1
    }
    
    
    func editData(object:[String:String], i:Int){
        
        let student =  getStudentData()
        
        student[i].name = object["name"]
        student[i].email = object["email"]
        student[i].mobile = object["mobile"]
        student[i].state = object["state"]
        
        do{
            try context?.save()
        }catch{
            print("Data is not edit")
        }
    }
    
}
