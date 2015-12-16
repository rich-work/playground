//
//  AddressValidation.swift
//  Playground
//
//  Created by IT Mac on 12/15/15.
//  Copyright © 2015 IT Mac. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

class AddressValidation: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var address1: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zip5: UITextField!
    @IBOutlet weak var zip4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func validateAction(sender: UIButton) {
        
        var urlStr = URL_ADDRESS
        urlStr += "<Address1>" + address1.text! + "</Address1>"
        urlStr += "<Address2>" + address2.text! + "</Address2>"
        urlStr += "<City>" + cityField.text! + "</City>"
        urlStr += "<State>" + stateField.text! + "</State>"
        urlStr += "<Zip5>" + zip5.text! + "</Zip5>"
        urlStr += "<Zip4>" + zip4.text! + "</Zip4>"
        urlStr += "</Address></AddressValidateRequest>"
        //print(urlStr)
        let urlAddr = NSURL(string: urlStr.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!
        Alamofire.request(.GET, urlAddr).response { request, response, data, error in
            if error == nil {
                var xml = SWXMLHash.parse(data!)
                if self.address1.text != "" {
                    self.address1.text = xml["AddressValidateResponse"]["Address"]["Address1"].element!.text!
                } else {
                    self.address1.text = ""
                }
                self.address2.text = xml["AddressValidateResponse"]["Address"]["Address2"].element!.text!
                self.cityField.text = xml["AddressValidateResponse"]["Address"]["City"].element!.text!
                self.stateField.text = xml["AddressValidateResponse"]["Address"]["State"].element!.text!
                self.zip5.text = xml["AddressValidateResponse"]["Address"]["Zip5"].element!.text!
                self.zip4.text = xml["AddressValidateResponse"]["Address"]["Zip4"].element!.text!
            } else {
                self.showErrorAlert("ERROR", msg: "\(error)")
            }
            
        }
        
    }
    
    func showErrorAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    

}
