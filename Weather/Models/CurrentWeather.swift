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
    return "\(temperature.rounded())"
  }

  let feelsLikeTemperature: Double
  var feelsLikeTemperatureString: String {
    return "\(feelsLikeTemperature.rounded())"
  }

  let conditionCode: Int

  init?(currentWetherData: CurrentWeatherData) {
    cityName = currentWetherData.name
    temperature = currentWetherData.main.temp
    feelsLikeTemperature = currentWetherData.main.feelsLike
    conditionCode = currentWetherData.weather.first!.id
  }
}
