//
//  Constants.swift
//  BookReview
//
//  Created by Rahiem Klugh on 7/19/16.
//  Copyright © 2016 Televisa. All rights reserved.
//

import Foundation

struct Constants {
    struct Urls {
        static  let postsUrl = NSURL(string: "http://jsonplaceholder.typicode.com/posts")
        static  let usersUrl = NSURL(string: "http://jsonplaceholder.typicode.com/users")
    }
    
    struct Strings {
        static  let title = "title"
        static  let body = "body"
        static  let name = "name"
        static  let username = "username"
        static  let id = "id"
        static  let loading = "Loading"
    }
    
    struct Notifications {
        static  let loadReviews = "loadReviews"
        static  let loadUsers = "loadUsers"
    }
    
    struct Segues {
        static  let showReviews = "showReviews"
        static  let showContent = "showContent"
    }
    
    struct Titles {
        static  let users = "Users"
        static  let review = "Review"
        static  let reviews = "Reviews"
        static  let reviewsBy = "Reviews by"
    }
    
    struct Cells {
        static  let postCell = "PostCell"
        static  let userCell = "UserCell"
    }
}


