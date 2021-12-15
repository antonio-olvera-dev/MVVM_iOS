//
//  WeatherControler.swift
//  MVVM_iOS
//
//  Created by Antonio Olvera Fernández on 15/12/21.
//

import Foundation

class WeatherController{
    
    func getSwitchCity(currentCity:String)->String{
        
        switch currentCity.lowercased() {
        case "madrid":
            return "Barcelona"
            
        case "barcelona":
            return "Madrid"
            
        default:
            return "Madrid"
        }
        
    }
}
