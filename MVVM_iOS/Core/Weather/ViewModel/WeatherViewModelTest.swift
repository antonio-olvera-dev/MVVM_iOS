//
//  WeatherViewModelTest.swift
//  MVVM_iOSTests
//
//  Created by Antonio Olvera Fernández on 17/12/21.
//

import XCTest

class WeatherViewModelTest: XCTestCase {
    
    
    func testInitWeatherViewModel() {
        
        let weatherViewModel:WeatherViewModel = WeatherViewModel()
        
        XCTAssertTrue(weatherViewModel.weatherResponseDataModel == nil)
        XCTAssertTrue(weatherViewModel.json == nil)
        
        weatherViewModel.json = "{city: \"Madrid\"}"
        XCTAssertTrue(weatherViewModel.json == "{city: \"Madrid\"}")
    }
    
    
    func testGetWeather() async{
        
        let weatherViewModel:WeatherViewModel = WeatherViewModel()
        await weatherViewModel.getWeather(city: "Madrid", isTest: true)
        
        XCTAssertTrue(weatherViewModel.json != nil)
        XCTAssertTrue(weatherViewModel.weatherResponseDataModel != nil)
        
        XCTAssertGreaterThan(weatherViewModel.json!.count , 10)
        XCTAssertEqual(weatherViewModel.weatherResponseDataModel?.city , "Madrid")
    }
    
    
    
    
    
    
}
