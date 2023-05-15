//
//  NetworkWeatherManager.swift
//  Weather
//
//  Created by Katsiaryna Kulik  on 13.05.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import Foundation

struct NetworkWeatherManager {

  var onCompletion: ((CurrentWeather) -> Void)?

  func featchCurrentWeather(forCity city: String) {
    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
    guard let url = URL(string: urlString) else { return }
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
      if let data = data {
        if let currentWeather = self.parseJSON(withData: data) {
          self.onCompletion?(currentWeather)
        }
      }
    }
    task.resume()
  }

  func parseJSON(withData data: Data) -> CurrentWeather? {
      let decoder = JSONDecoder()
      do {
          let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
        guard let currentWeather = CurrentWeather(currentWetherData: currentWeatherData) else {
              return nil
          }
          return currentWeather
      } catch let error as NSError {
          print(error.localizedDescription)
      }
      return nil
  }
}







