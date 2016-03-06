//
//  CaptureViewController.swift
//  InstagramApp
//
//  Created by Ryan Linehan on 3/5/16.
//  Copyright © 2016 Ryan Linehan. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    let imagePicker = UIImagePickerController()

    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
            
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSubmit(sender: AnyObject) {
        
        let postImage = imageView.image!
        
        Post.postUserImage(postImage, withCaption: captionField.text, withCompletion: nil)
        
        imageView.image = nil
        captionField.text = nil
    
    }
    
    /*func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }*/
    
    @IBAction func onUploadImage(sender: AnyObject) {
       
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func onTakePhoto(sender: AnyObject) {
        
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .Camera
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        imageView.contentMode = .ScaleAspectFit
        imageView.image = pickedImage
        
        }
        dismissViewControllerAnimated(true, completion: nil)
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
