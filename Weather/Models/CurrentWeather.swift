//
//  CurrentWeather.swift
//  Weather
//
//  Created by Katsiaryna Kulik  on 14.05.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import Foundation

struct CurrentWeather {
  let cityName: String

  let temperature: Double
  var temperatureString: String {
      return String(format: "%.0f", temperature)
  }

  let feelsLikeTemperature: Double
  var feelsLikeTemperatureString: String {
      return String(format: "%.0f", feelsLikeTemperature)
  }

  let conditionCode: Int
  var systemIconNameString: String {
      switch conditionCode {
      case 200...232: return "cloud.bolt.rain"
      case 300...321: return "cloud.drizzle"
      case 500...531: return "cloud.rain"
      case 600...622: return "cloud.snow"
      case 701...781: return "smoke"
      case 800: return "sun.min"
      case 801...804: return "cloud"
      default: return "nosign"
      }
  }

  init?(currentWetherData: CurrentWeatherData) {
    cityName = currentWetherData.name
    temperature = currentWetherData.main.temp
    feelsLikeTemperature = currentWetherData.main.feelsLike
    conditionCode = currentWetherData.weather.first!.id
  }
}
