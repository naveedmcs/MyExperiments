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
    private var cityObject: City?

    //instance dependency Injection
    static func getInstance(city: City?) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailVC") as! WeatherDetailVC
        vc.cityObject = city
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
        let lat = "\(cityObject?.coord?.lat ?? 0)"
        let long = "\(cityObject?.coord?.lon ?? 0)"
        let object = WeatherManager(_httpUtility: HttpHandler())
        object.getWeatherDetailBy(lat: lat, long: long)
    }
    
    
}

