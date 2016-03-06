//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by Ryan Linehan on 3/5/16.
//  Copyright © 2016 Ryan Linehan. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class ProfileViewController: UIViewController {
    
    var selection: Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
    
        PFUser.logOut()
        self.performSegueWithIdentifier("onLogout", sender: nil)
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
