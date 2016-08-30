//
//  ReviewsTVC.swift
//  BookReview
//
//  Created by Rahiem Klugh on 7/19/16.
//  Copyright © 2016 Televisa. All rights reserved.
//

import UIKit

class ReviewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = DataFormatter()
    var posting: Post?
    var user_id: NSNumber?
    var user_name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set title based on tab selected
        let selectedIndex = tabBarController!.selectedIndex

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ReviewsVC.refreshTableView), name:Constants.Notifications.loadReviews, object: nil)
        
        if selectedIndex == 0 {
            self.title = Constants.Titles.reviews
            data.getReviews(false, userId: 0)
        }
        else{
            let baseString = Constants.Titles.reviewsBy
            self.title = "\(baseString) \(user_name!)"
            
            data.getReviews(true, userId: user_id!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.reviewsArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Cells.postCell , forIndexPath: indexPath) as! PostCell
        cell.post = data.reviewsArray?[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        posting = data.reviewsArray?[indexPath.row]
        performSegueWithIdentifier(Constants.Segues.showContent, sender: nil)
        
    }
    
    func refreshTableView(){
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if (segue.identifier == Constants.Segues.showContent) {
            let contentVC = segue!.destinationViewController as! ReviewContentVC;
            contentVC.contentPosting = posting
        }
    }
    
}
