//
//  WeatherViewModel.swift
//  MVVM_iOS
//
//  Created by Antonio Olvera Fernández on 14/12/21.
//

import Foundation

final class WeatherViewModel:ObservableObject {
    @Published var weatherResponseDataModel: WeatherResponseDataModel?
    
    func getWeather(city: String) async {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=71c3e78149e90edcb26b5c8bf57708fa&units=metric&lang=es")!
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
                        
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherResponseDataModel = dataModel
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
