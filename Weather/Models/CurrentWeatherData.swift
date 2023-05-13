//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Katsiaryna Kulik  on 14.05.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Codable {
  let name: String
  let main: Main
  let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable {
  let id: Int
}
