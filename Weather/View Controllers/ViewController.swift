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

  var networkWeatherManager = NetworkWeatherManager()

    @IBAction func searchPressed(_ sender: UIButton) {
      self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self]
        city in self.networkWeatherManager.featchCurrentWeather(forCity: city)
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      networkWeatherManager.onCompletion = { [weak self]
        currentWeather in
        guard let self = self else { return }
        self.updateInterfaceWith(weather: currentWeather)
      }
      networkWeatherManager.featchCurrentWeather(forCity: "London")
    }

  func updateInterfaceWith(weather: CurrentWeather) {
    DispatchQueue.main.async {
      self.cityLabel.text = weather.cityName
      self.temperatureLabel.text = weather.temperatureString
      self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
      self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
    }
  }
}


