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
        
        NavigationView{
            ZStack {
                bodyView()
            }.task {
                await weatherViewModel.getWeather(city: city)
            }
        }
        
    }
    
    
    func bodyView() -> some View{
        return VStack{
            
            WeatherViewHeader(weatherViewModel: weatherViewModel, city: $city)
            Divider().padding()
            humidity()
            Divider().padding()
            changeCity()
            Divider().padding()
            showJson()
            Divider().padding()
            Spacer().padding(.top, 22)
        }
        .background( bgBodyView())
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
    
    
    func showJson() -> some View{
        return VStack{
            NavigationLink(destination: WeatherJsonView(json: weatherViewModel.json ?? "ee")){
                Text("Show Json").padding(.all, 12)
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
