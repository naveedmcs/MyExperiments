//
//  ViewController.swift
//  DealloactionExample
//
//  Created by apple on 2/6/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let greeting:(String, String) -> String = { (time:String, name:String) -> String in
               return "Good \(time), \(name)!"
           }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        let text = greeting("morning", "Arthur")
        print(text)
    }

    deinit {
        print("Controller is deAlloacted")
    }

}

