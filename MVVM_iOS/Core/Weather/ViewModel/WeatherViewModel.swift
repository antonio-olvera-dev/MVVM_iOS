//
//  WeatherViewModel.swift
//  MVVM_iOS
//
//  Created by Antonio Olvera Fernández on 14/12/21.
//

import Foundation

final class WeatherViewModel:ObservableObject {
    @Published var weatherResponseDataModel: WeatherResponseDataModel?
    @Published var json: String?
    
    func getWeather(city: String) async {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=71c3e78149e90edcb26b5c8bf57708fa&units=metric&lang=es")!
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            
            let dataString =  try! await  String(bytes: data, encoding: String.Encoding.utf8)
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            
            DispatchQueue.main.async {
                self.json = "\(String(describing: dataString))"
                self.weatherResponseDataModel = dataModel
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
