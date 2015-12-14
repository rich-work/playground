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
    @IBOutlet weak var dobField: UILabel!
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    var authorId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://test0036247.azurewebsites.net/api/BooksApi")
        Alamofire.request(.GET, url!).responseJSON { response in
            //print(response.data)
            //print(response.result)
            if let resultJSON = response.result.value {
                print("\(resultJSON)")
            }
        }
        dobPicker.addTarget(self, action: Selector("dobPickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func dobPickerChanged(dobPicker: UIDatePicker) {
        var dobFormatter = NSDateFormatter()
        dobFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dobFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        var strDate = dobFormatter.stringFromDate(dobPicker.date)
        dobField.text = strDate
    }

    @IBAction func addPressed(sender: UIButton) {
        let authorUrl = NSURL(string: "http://test0036247.azurewebsites.net/api/AuthorsApi")
        Alamofire.request(.GET, authorUrl!).responseJSON { response in
            if let resultJSON = response.result.value as? Dictionary<String, AnyObject> {
                if let idAuth = resultJSON["Id"] as? Int {
                    self.authorId = idAuth
                }
            }
        }
        
        
        let authorData: [String : AnyObject] = [
            "Id": self.authorId,
            "First": firstNameField.text!,
            "Last": lastNameField.text!,
            "Gender": genderField.text!,
            "DOB": dobField.text!
        ]
        Alamofire.request(.POST, authorUrl!, parameters: authorData, encoding: .JSON)
        //Alamofire.request(.POST, authorUrl, parameters: authorData)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

