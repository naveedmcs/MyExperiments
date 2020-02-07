//
//  ViewController.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
   
    var pakistanCitiesStorage: [City] = [] {
        didSet {
            self.navigationItem.title = "Pakistan Cities (\(pakistanCitiesStorage.count))"
        }

    }
    
    var filteredCities: [City] = [] {
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
          filteredCities = AppStorage.pakistanCities
          pakistanCitiesStorage = filteredCities
          tableView.registerCell("CityTableViewCell")
      }
    
}

 //MARK:-  controller actions
extension ViewController {

    @IBAction func searchTextDidChangeEditing(_ sender: UITextField) {
        if sender.text?.isEmpty ?? true {
            filteredCities = pakistanCitiesStorage
            self.tableView.reloadData()
        }else {
            filteredCities = pakistanCitiesStorage
            let filters = filteredCities.filter({ ($0.name?.lowercased().contains(sender.text!))!})
            self.filteredCities = filters
        }
        
    }
    
}

 //MARK:- tableview implementation
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell
        let city =  filteredCities[indexPath.row]
        cell.loadCell(object: city)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = filteredCities[indexPath.row]
        dump(city)
        let vc = WeatherDetailVC.getInstance(city: city)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
