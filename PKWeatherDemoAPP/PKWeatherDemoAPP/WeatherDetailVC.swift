//
//  WeatherDetailVC.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class WeatherDetailVC: UIViewController {

    //MARK:-  outlets
    @IBOutlet weak var label: UILabel!
    
   //MARK:-  variables
    private var city: City?

    
    //instance dependency Injection
    static func getInstance(city: City) -> UIViewController {
        let storyBoard = AppStoryBoard.main.getInstance
        let vc = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailVC") as! WeatherDetailVC
        vc.city = city
        return vc
    
    }
    
}

//MARK:-  life cycle
extension WeatherDetailVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private  func setupView()  {
        let lat = "\(city?.coord?.lat ?? 0)"
        let long = "\(city?.coord?.lon ?? 0)"
        let object = WeatherManager()
        
        let loadingVC = LoadingViewController()
        add(loadingVC)
        object.getWeatherDetailBy(lat: lat, long: long, completion: { [weak self] result in
            loadingVC.remove()
            switch result {
            case .success(result: var object):
                self?.label.text = object.main?.formattedTemprature(type: .celcius)
            case .failure(errorMessage: let msg):
                debugPrint(msg)
            }
        })
    }
    
    
}




enum AppStoryBoard: String {
        case main = "Main"
        case profile = "Profile"
    
    var getInstance: UIStoryboard {
        switch self {
        default:
             return UIStoryboard(name: AppStoryBoard.main.rawValue, bundle: nil)
        }
    }
}
