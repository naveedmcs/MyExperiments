//
//  ViewController.swift
//  RadioButtonResuableView
//
//  Created by apple on 1/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let male = RadioButtonView.instanceFromNib() as! RadioButtonView
        let female = RadioButtonView.instanceFromNib() as! RadioButtonView
        view.addSubview(male)
        view.addSubview(female)
        male.loadView(label: "Male", othersRadioButtonView: [female])
        female.loadView(label: "Female", othersRadioButtonView: [male])
    }


}

