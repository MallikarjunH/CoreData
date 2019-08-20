//
//  ViewController.swift
//  CoreData_KiloLoco
//
//  Created by mallikarjun on 09/08/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let persistentManager: PersistenceManager
    
    init(persistentManager: PersistenceManager){
        self.persistentManager =  persistentManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  print("hello")
        
        persistentManager.saveContext()
        
    }


}

