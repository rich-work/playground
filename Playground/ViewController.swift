//
//  ViewController.swift
//  Playground
//
//  Created by IT Mac on 12/10/15.
//  Copyright © 2015 IT Mac. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    var authorId: Int!
    var strDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let url = NSURL(string: URL_BOOK)
//        Alamofire.request(.GET, url!).responseJSON { response in
//            if let resultJSON = response.result.value {
//                print("\(resultJSON)")
//            }
//        }
        
    }
    
    @IBAction func dobPickerAction(sender: AnyObject) {
        let dobFormatter = NSDateFormatter()
        dobFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dobFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        self.strDate = dobFormatter.stringFromDate(dobPicker.date)
    }
    

    @IBAction func addPressed(sender: UIButton) {
        let authorUrl = NSURL(string: URL_AUTHOR)
        Alamofire.request(.GET, authorUrl!).responseJSON { response in
            if let resultJSON = response.result.value as? [Dictionary<String, AnyObject>] {
                self.authorId = resultJSON.count + 1
                
                let authorData: [String : AnyObject] = [
                    "Id": self.authorId,
                    "First": self.firstNameField.text!,
                    "Last": self.lastNameField.text!,
                    "Gender": self.genderField.text!,
                    "DOB": self.strDate!
                ]
                //Alamofire.request(.POST, authorUrl!, parameters: authorData, encoding: .JSON)
                Alamofire.request(.POST, authorUrl!, parameters: authorData, encoding: .JSON).response { request, response, data, error in
                    if error == nil {
                        self.showErrorAlert("SUCCESS", msg: "Post Successfully")
                    } else {
                        self.showErrorAlert("ERROR", msg: "Post failed")
                    }
                    
                }
            }
        }
    }
    
    @IBAction func addressPressed(sender: UIButton) {
        performSegueWithIdentifier(SEGUE_ADDRESS, sender: nil)
    }
    
    func showErrorAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

