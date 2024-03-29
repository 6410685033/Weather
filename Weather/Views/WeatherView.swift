//
//  WeatherView.swift
//  Weather
//
//  Created by Thammasat Thonggamgaew on 23/2/2567 BE.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        VStack {
            Text(weather.name)
                .bold()
                .font(.title)
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png"))
                .frame(width: 350, height: 350)
            
        }
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
