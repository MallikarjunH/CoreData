//
//  TableViewCell.swift
//  CoreData_YogeshPatel
//
//  Created by mallikarjun on 01/10/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    var student: Student!{ // computed property // swift 4
        didSet{
          //  nameLabel.text = student.name
          //  emailLabel.text = student.email
           // mobileLabel.text = student.mobile
         //   stateLabel.text = student.state
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
