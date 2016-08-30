//
//  ReviewContentTVC.swift
//  BookReview
//
//  Created by Rahiem Klugh on 7/19/16.
//  Copyright © 2016 Televisa. All rights reserved.
//

import UIKit

class ReviewContentVC: UIViewController {
    
    @IBOutlet var reviewTextView: UITextView!
    var dataFormatter = DataFormatter()
    var contentPosting: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.Titles.review
        reviewTextView.attributedText = dataFormatter.attributedText((contentPosting?.title)!, body: (contentPosting?.body)!, fontSize: 15.0, doubleSpace: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
