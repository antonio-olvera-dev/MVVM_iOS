//
//  WeaderViewHeader.swift
//  MVVM_iOS
//
//  Created by Antonio Olvera Fernández on 17/12/21.
//

import SwiftUI

struct WeatherViewHeader:View{
    
    @StateObject var weatherViewModel:WeatherViewModel
    @Binding var city:String
    
    
    var body: some View {
        VStack{
            description().tag("description")
            temperature().tag("temperature")
        }
    }
    
    
    func description() -> some View {
        return VStack{
            Text(weatherViewModel.weatherResponseDataModel?.city ?? city)
                .foregroundColor(.white)
                .font(.system(size: 70))
            Text(weatherViewModel.weatherResponseDataModel?.weather.first?.description ?? "No temperature")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.bottom, 8)
        }
    }
    
    
    
    func temperature() -> some View {
        return VStack{
            HStack {
                if let iconURL = weatherViewModel.weatherResponseDataModel?.weather.first?.iconURLString,
                   let url = URL(string: "http://openweathermap.org/img/wn/\(iconURL)@2x.png") {
                    AsyncImage(url: url) { image in
                        image
                    } placeholder: {
                        ProgressView()
                    }
                }
                Text("\(weatherViewModel.weatherResponseDataModel?.temperature.currentTemperature ?? 0.0)º")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            .padding(.top, -20)
            HStack(spacing: 14) {
                Label("\(weatherViewModel.weatherResponseDataModel?.temperature.maxTemperature ?? 0.0)º máx.", systemImage: "thermometer.sun.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                Label("\(weatherViewModel.weatherResponseDataModel?.temperature.minTemperature ?? 0.0)º min.", systemImage: "thermometer.snowflake")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
            }
        }
    }
}
