//
//  DetailViewController.swift
//  blogapp
//
//  Created by Roger Kislig on 10.11.16.
//  Copyright © 2016 swiftalps. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var blogTitleField: UITextField!

    @IBOutlet weak var blogTextView: UITextView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func sendBlogPost(_ sender: Any) {
        // TODO
    }
    
    func postBlogData() {
//        var request = NSMutableURLRequest(URL: NSURL(string: "http://172.20.10.7:8090/post"))
//        var session = NSURLSession.sharedSession()
//        request.HTTPMethod = "POST"
//        
//        var params = ["title":"blah", "text":"boo"] as Dictionary<String, String>
//        
//        var err: NSError?
//        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            println("Response: \(response)")
//            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
//            println("Body: \(strData)")
//            var err: NSError?
//            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
//            
//            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
//            if(err != nil) {
//                println(err!.localizedDescription)
//                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
//                println("Error could not parse JSON: '\(jsonStr)'")
//            }
//            else {
//                // The JSONObjectWithData constructor didn't return an error. But, we should still
//                // check and make sure that json has a value using optional binding.
//                if let parseJSON = json {
//                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
//                    var success = parseJSON["success"] as? Int
//                    println("Succes: \(success)")
//                }
//                else {
//                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
//                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
//                    println("Error could not parse JSON: \(jsonStr)")
//                }
//            }
//        })
//        
//        task.resume()
//        return true
    }
    
    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = self.detailItem {
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

