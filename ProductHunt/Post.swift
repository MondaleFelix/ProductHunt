//
//  Post.swift
//  ProductHunt
//
//  Created by Mondale on 4/17/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import Foundation

struct Post {
    let id: Int
    let name: String
    let tagline: String
    let votesCount: Int
    let commentsCount: Int
    let previewImageURL: URL
    
}

struct PostList: Decodable {
   var posts: [Post]
}


extension Post: Decodable {
    
    init(from decoder: Decoder) throws {
        let postsContainer = try decoder.container(keyedBy: PostKeys.self)

        id = try postsContainer.decode(Int.self, forKey: .id)
        name = try postsContainer.decode(String.self, forKey: .name)
        tagline = try postsContainer.decode(String.self, forKey: .tagline)
        votesCount = try postsContainer.decode(Int.self, forKey: .votesCount)
        commentsCount = try postsContainer.decode(Int.self, forKey: .commentsCount)
        
        let screenshotURLContainer = try postsContainer.nestedContainer(keyedBy: PreviewImageURLKeys.self, forKey: .previewImageURL)
        // Decode the image and assign it to the variable
        previewImageURL = try screenshotURLContainer.decode(URL.self, forKey: .imageURL)
    }

    
    // properties within a Post returned from the Product Hunt API that we want to extract the info from.
    enum PostKeys: String, CodingKey {
        // first three match our variable names for our Post struct
        case id
        case name
        case tagline
        // these three need to be mapped since they're named differently on the API compared to our struct
        case votesCount = "votes_count"
        case commentsCount = "comments_count"
        case previewImageURL = "screenshot_url"
    }
    
    enum PreviewImageURLKeys: String, CodingKey {
       // for all posts, we only want the 850px image
       // Check out the screenshot_url property in our Postman call to see where this livesx
       case imageURL = "850px"
    }
}
