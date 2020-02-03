//
//  ViewController.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     //MARK:-  outlets
    @IBOutlet weak var tableView: UITableView!
    
    
     //MARK:-  property observers
    var pakistanCitiesStorage: [City] = [] {
        didSet {
            self.navigationItem.title = "Pakistan Cities (\(pakistanCitiesStorage.count))"
        }
    }
    
    var pakistanCities: [City] = [] {
        didSet {
            tableView.reloadData()
        }
    }
   
}

  //MARK:-  life cycle
extension ViewController {
    
      override func viewDidLoad() {
          super.viewDidLoad()
        
          self.setupView()
      
      }
    
      private func setupView() {
          self.navigationItem.title = "Pakistan Cities"
          pakistanCities = AppStorage.pakistanCities
          pakistanCitiesStorage = pakistanCities
          tableView.registerCell("CityTableViewCell")
      }
    
}

 //MARK:-  controller actions
extension ViewController {

    @IBAction func searchTextDidChangeEditing(_ sender: UITextField) {
        if sender.text?.isEmpty ?? true {
            pakistanCities = pakistanCitiesStorage
            self.tableView.reloadData()
        }else {
            let filters = pakistanCities.filter({ ($0.name?.lowercased().contains(sender.text!))!})
            self.pakistanCities = filters
        }
        
    }
    
}

 //MARK:- tableview implementation
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pakistanCities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell
        let city =  pakistanCities[indexPath.row]
        cell.loadCell(object: city)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = pakistanCities[indexPath.row]
        dump(city)
        let vc = WeatherDetailVC.getInstance(city: city)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
