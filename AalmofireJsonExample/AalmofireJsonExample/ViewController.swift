//
//  ViewController.swift
//  AalmofireJsonExample
//
//  Created by apple on 12/16/19.
//  Copyright © 2019 mytechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        UserAPIManager.shared.fetchUsers{ result in
            switch result {
            case .success( let objects):
                print( objects.count)
            case .failure( let error):
                print(error.localizedDescription)
            }
        }
    }


}

