//
//  MainController.swift
//  Playground
//
//  Created by IT Mac on 1/8/16.
//  Copyright © 2016 IT Mac. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    
    @IBAction func peoplePressed(sender: UIButton) {
        self.performSegueWithIdentifier(SEGUE_PERSON, sender: nil)
    }
    
    @IBAction func userPressed(sender: UIButton) {
        self.performSegueWithIdentifier(SEGUE_USER, sender: nil)
    }
    
}
