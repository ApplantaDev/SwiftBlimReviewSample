//
//  PostCell.swift
//  BookReview
//
//  Created by Rahiem Klugh on 7/19/16.
//  Copyright © 2016 Televisa. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var postBody: UITextView!
    var dataFormatter = DataFormatter()
    
    var post: Post? {
        didSet {
            
            updateUI()
        }
    }
    
    func updateUI() {
          postBody.attributedText = dataFormatter.attributedText((post?.title)!, body: (post?.body)!, fontSize: 12.0, doubleSpace: false)
    }
}
