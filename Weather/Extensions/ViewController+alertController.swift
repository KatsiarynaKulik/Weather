//
//  ViewController+alertController.swift
//  Weather
//
//
//  Created by Katsiaryna Kulik  on 12.05.23.
//  Copyright © 2023 Katsiaryna Kulik. All rights reserved.
//

import UIKit

extension ViewController {
  func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, complitionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
              let city = cityName.split(separator: " ").joined(separator: "%20")
                complitionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}
