//
//  ContentView.swift
//  MVVM_iOS
//
//  Created by Antonio Olvera Fernández on 14/12/21.
//

import SwiftUI

struct WeatherView: View {
    
    let controller: WeatherController = WeatherController()
    @StateObject var weatherViewModel = WeatherViewModel()
    @State var city = "Madrid"
    
    var body: some View {
        ZStack {
            bodyView()
        }.task {
            
            await weatherViewModel.getWeather(city: city)
        }
    }
    
    
    func bodyView() -> some View{
        return VStack{
            description()
            temperature()
            Divider().padding()
            humidity()
            Divider().padding()
            changeCity()
            Divider().padding()
            Spacer().padding(.top, 22)
        }
        .background( bgBodyView())
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
    
    func humidity() -> some View{
        return VStack{
            Label("\(weatherViewModel.weatherResponseDataModel?.temperature.humidity ?? 0) %", systemImage: "humidity.fill")
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.white)
        }
    }
    
    func changeCity() -> some View{
        return VStack{
            
            Button(action: {
                
                Task.init(){
                    let newCity = controller.getSwitchCity(currentCity: city)
                    city = newCity
                    await weatherViewModel.getWeather(city: newCity)
                    
                }
                
            } ) {
                Text(city == "Madrid" ? "Barcelona":"Madrid").padding(.all, 12)
                    .foregroundColor(.black)
                    .background(Color.white).cornerRadius(30)
            }
        }
    }
    
    func bgBodyView() -> LinearGradient{
        return  LinearGradient(
            gradient: Gradient(colors: [.purple, .orange]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
