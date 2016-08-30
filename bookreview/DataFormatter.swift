//
//  DataFormatter.swift
//  BookReview
//
//  Created by Rahiem Klugh on 7/19/16.
//  Copyright © 2016 Televisa. All rights reserved.
//

import UIKit

public class DataFormatter {
    static let sharedInstance = DataFormatter()
    
    var reviewsArray: [Post]?
    var usersArray: [User]?
    
    //Get reviews from the database
    func getReviews(byUser: Bool, userId: NSNumber) {

        HUD.show(.Loading, text: Constants.Strings.loading)
        var url: NSURL?
        
        if byUser {
            let userUrl = Constants.Urls.usersUrl!
            let string = String(format:"%@/posts", userId)
            url = userUrl.URLByAppendingPathComponent(string)
        }
        else{
            url = Constants.Urls.postsUrl!
        }
        
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)

                self.reviewsArray = [Post]()
                for dictionary in json as! [[String: AnyObject]] {
                    let post = Post()
                    post.title = dictionary[Constants.Strings.title] as? String
                    post.body = dictionary[Constants.Strings.body] as? String
                    
                    self.reviewsArray?.append(post)
                }
                dispatch_async(dispatch_get_main_queue()){
                    HUD.dismiss()
                    NSNotificationCenter.defaultCenter().postNotificationName(Constants.Notifications.loadReviews, object: nil)
                }
                
            }catch let jsonError {
                print(jsonError)
            }
            }.resume()
        
        
    }
    
    
    //Get all users from the database
    func getUsers() {
        
        NSURLSession.sharedSession().dataTaskWithURL(Constants.Urls.usersUrl!) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                 self.usersArray = [User]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    let user = User()
                    user.name = dictionary[Constants.Strings.name] as? String
                    user.id = dictionary[Constants.Strings.id] as? NSNumber
                    user.username = dictionary[Constants.Strings.username] as? String
                    
                    self.usersArray?.append(user)
                }
                dispatch_async(dispatch_get_main_queue()){
                    NSNotificationCenter.defaultCenter().postNotificationName(Constants.Notifications.loadUsers, object: nil)
                }
                
            }catch let jsonError {
                print(jsonError)
            }
            }.resume()
        
    }
    
    //Generate attibuted string for Reviews
    func attributedText(title: String, body: String, fontSize: CGFloat, doubleSpace: Bool)->NSAttributedString{
        
        var str: String?
        if doubleSpace {
            str = String(format:"%@\n\n%@", (title), (body))
        }
        else{
            str = String(format:"%@\n%@", (title), (body))
        }
        
        let string = str! as NSString
        
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(fontSize)])
        
        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFontOfSize(18.0)]
        
        //String to be bold
        attributedString.addAttributes(boldFontAttribute, range: string.rangeOfString((title)))
        
        return attributedString
    }
    
}