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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://test0036247.azurewebsites.net/api/BooksApi")
        Alamofire.request(.GET, url!).responseJSON { response in
            print(response.data)
            print(response.result)
            if let resultJSON = response.result.value {
                print("\(resultJSON)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

