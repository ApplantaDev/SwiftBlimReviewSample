//
//  UserCell.swift
//  BookReview
//
//  Created by Rahiem Klugh on 7/19/16.
//  Copyright © 2016 Televisa. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    
    var user: User? {
        didSet {
            
            updateUI()
        }
    }
    
    func updateUI() {
        name.text = user?.name
    }
}
