//
//  AddressValidation.swift
//  Playground
//
//  Created by IT Mac on 12/15/15.
//  Copyright © 2015 IT Mac. All rights reserved.
//

import UIKit
import Alamofire

class AddressValidation: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var address1: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zip5: UITextField!
    @IBOutlet weak var zip4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func validateAction(sender: UIButton) {
        
        //var urlStr: String!
        let urlStr = "http://production.shippingapis.com/ShippingAPITest.dll?API=Verify&XML=<AddressValidateRequest USERID=\"497PRIME2626\"><Address ID=\"0\"><Address1>\(address1.text)</Address1><Address2>\(address2.text)</Address2><City>\(cityField.text)</City><State>\(stateField.text)</State><Zip5>\(zip5.text)</Zip5><Zip4>\(zip4.text)</Zip4></Address></AddressValidateRequest>"
        let urlAddr = NSURL(string: urlStr)
        Alamofire.request(.GET, urlAddr!)
        
    }
    

}
