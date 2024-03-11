//
//  WeatherManager.swift
//  Weather
//
//  Created by Thammasat Thonggamgaew on 23/2/2567 BE.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitud: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://pro.openweathermap.org/data/2.5/weather?lat=\(latitud)&lon=\(longitude)&APPID=60d0497850f137efb0fdbf05ebd9afd6&units=metric")
        else {
            fatalError("Missing URL") // guard, else
        }
        
        let urlRequest = URLRequest(url: url) // create URL Request
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching data")
        } // as? => cast
        let decodeData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodeData
    }
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}
