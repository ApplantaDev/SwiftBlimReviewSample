//
//  UsersTVC.swift
//  BookReview
//
//  Created by Rahiem Klugh on 7/19/16.
//  Copyright © 2016 Televisa. All rights reserved.
//

import UIKit

class UsersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userData = DataFormatter()
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = Constants.Titles.users
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UsersVC.refreshTableView), name:Constants.Notifications.loadUsers, object: nil)
        
        userData.getUsers()
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
        return userData.usersArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.Cells.userCell , forIndexPath: indexPath) as! UserCell
        cell.user = userData.usersArray?[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
         user = userData.usersArray?[indexPath.row]
         performSegueWithIdentifier(Constants.Segues.showReviews, sender: nil)
        
    }
    
    func refreshTableView(){
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if (segue.identifier == Constants.Segues.showReviews) {
            let reviews = segue!.destinationViewController as! ReviewsVC;
            reviews.user_id = user?.id
            reviews.user_name = user?.name
        }
    }

}
