//
//  HomeViewController.swift
//  InstagramApp
//
//  Created by Ryan Linehan on 3/5/16.
//  Copyright © 2016 Ryan Linehan. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var Posts: [PFObject]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                self.Posts = posts
                self.tableView.reloadData()// do something with the data fetched
            } else {
                print(error?.localizedDescription)// handle error
            }
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! PostsTableViewCell
        let post = Posts[indexPath.row]
        cell.captionLabel.text = post["caption"] as? String
        cell.postedImageView.file = post["media"] as? PFFile
        cell.usernameLabel.text = post["_p_author"] as? String
        cell.postedImageView.loadInBackground()
        
        return cell

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let Posts = Posts {
            return Posts.count
        } else {
            return 0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
