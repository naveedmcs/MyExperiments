//
//  RadioButtonView.swift
//  RadioButtonResuableView
//
//  Created by apple on 1/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class RadioButtonView: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var radio: UIButton!
    @IBOutlet weak var radioSelection: UIButton!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "RadioButtonView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
    }
    
    
    func loadView(label: String, othersRadioButtonView: [RadioButtonView]?) {
        self.title.text = label
        for object in othersRadioButtonView ?? [] {
            object.radioSelection.isSelected = false
            object.radio.isSelected = false
        }
    }
    

    @IBAction func radioButtonTapped(sender: UIButton) {
        radioSelection.isSelected.toggle()
        updateRadioButtonOnTap()
    }
    
    private func updateRadioButtonOnTap() {
        if radioSelection.isSelected == true {
            self.radio.isSelected = true
        }
        else {
            self.radio.isSelected = false
        }
    }

}
