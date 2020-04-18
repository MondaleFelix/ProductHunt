//
//  FeedViewController.swift
//  ProductHunt
//
//  Created by Mondale on 4/17/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    var posts: [Post] = [] {
       didSet {
           feedTableView.reloadData()
       }
    }

    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.dataSource = self
        feedTableView.delegate = self
        updateFeed()
    }
    
    func updateFeed() {
       networkManager.getPosts() { result in
           switch result {
           case let .success(posts):
             self.posts = posts
           case let .failure(error):
             print(error)
           }
       }
    }

}

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
   /// Determines how many cells will be shown on the table view.
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // return the actual number of posts we receive
    return posts.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell

    // retrieve from the actual posts, and not mock data
    let post = posts[indexPath.row]
    cell.post = post
    return cell
   }

}


extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    // provide a fixed size
    return 250
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = posts[indexPath.row]
       // Get the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
       // Get the commentsView from the storyboard
           guard let commentsView = storyboard.instantiateViewController(withIdentifier: "commentsView") as? CommentsViewController else {
             return
           }
           // set the post id for the comments
           commentsView.postID = post.id
           navigationController?.pushViewController(commentsView, animated: true)
        }
    
}
