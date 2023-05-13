//
//  ViewController.swift
//  Weather
//
//
//  Created by Katsiaryna Kulik  on 12.05.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!

  let networkWeatherManager = NetworkWeatherManager()

    @IBAction func searchPressed(_ sender: UIButton) {
      self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {
        city in self.networkWeatherManager.featchCurrentWeather(forCity: city)
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      networkWeatherManager.featchCurrentWeather(forCity: "London")
    }
}


