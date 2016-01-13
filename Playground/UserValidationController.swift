//
//  UserValidationController.swift
//  Playground
//
//  Created by IT Mac on 1/8/16.
//  Copyright © 2016 IT Mac. All rights reserved.
//

import UIKit
import Alamofire

class UserValidationController: UIViewController {

    
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    @IBOutlet weak var barcodeField: UITextField!
    
    var ticket: Ticket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func verifyPressed(sender: UIButton) {
//        self.ticket.resetTicket()
        self.ticket = Ticket(fn: self.firstField.text!, ln: self.lastField.text!)
        let urlStr = URL_USER + "\(ticket.firstName)" + "/" + "\(ticket.lastName)"
        let urlUser = NSURL(string: urlStr)!
        
        Alamofire.request(.GET, urlUser).responseJSON { response in
//            print("response: ", response.response)
//            print("data: ", response.data)
//            print("result: ", response.result)
            if let resultJSON = response.result.value as? [Dictionary<String,AnyObject>] {
                if resultJSON.count > 1 {
                    for var i = 0; i < resultJSON.count; ++i {
                        if let userName = resultJSON[i]["username"] as? String {
                            self.ticket.addAvailUserName(userName)
                        }
                    }
                    print(self.ticket.availUser)
                    self.showOptions()
//                    print("redirected")
//                    self.performSegueWithIdentifier(SEGUE_USER_OPT, sender: nil)
                    
                } else if resultJSON.count == 1 {
                    if let userName = resultJSON[0]["username"] as? String {
//                        self.ticket.addAvailUserName(userName)
                        self.ticket.assignUserName(userName)
                    }
                    print("submit ticket: " + self.ticket.userName)
//                    print(self.ticket.availUser)
                } else {
                    print("No user found")
                }
            }
        }
        
    }
    
    func submitTicketFake(name: String) {
        print("submit ticket: " + name)
        print(self.ticket)
    }
    
    func showOptions() {
        let actionSheet = UIAlertController(title: "Action", message: "choose one", preferredStyle: .ActionSheet)
        let dismissChoice = {
            (action: UIAlertAction!) -> Void in
            let uName = action.title
            self.submitTicketFake(uName!)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        for var j = 0; j < self.ticket.availUser.count; j++ {
            actionSheet.addAction(UIAlertAction(title: self.ticket.availUser[j], style: .Default, handler: dismissChoice))
            
//                {(UIAlertAction) in
//                let something = self.ticket.availUser[j]
//                self.submitTicketFake(something)
//                self.dismissViewControllerAnimated(true, completion: nil)
//            }))
        }
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func backPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func barcodeVerifyAction(sender: AnyObject) {
        let urlEquipStr = URL_EQUIPMENT + "\(self.barcodeField.text!)"
        let urlEquip = NSURL(string: urlEquipStr)!
        
        Alamofire.request(.GET, urlEquip).responseJSON { response in
            print("\(response.result.value)")
            print(response.data)
            print(response.response)
        }
        
    }
    
    
}
