//
//  Comment.swift
//  ProductHunt
//
//  Created by Mondale on 4/17/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    let id: Int
    let body: String
}

struct CommentApiResponse: Decodable {
   let comments: [Comment]
}


