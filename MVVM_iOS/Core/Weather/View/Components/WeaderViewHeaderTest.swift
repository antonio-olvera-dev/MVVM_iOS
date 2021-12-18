//
//  WeaderViewHeaderTest.swift
//  MVVM_iOSTests
//
//  Created by Antonio Olvera Fernández on 18/12/21.
//

import XCTest
import ViewInspector
@testable import MVVM_iOS
import SwiftUI

extension WeatherViewHeader: Inspectable { }

class WeaderViewHeaderTest: XCTestCase {
    
    @State var city:String = "Madrid"
    @StateObject var weatherViewModel:WeatherViewModel = WeatherViewModel()
    
    func testView() async throws{
        
        let weatherView:WeatherView = WeatherView()
        let weatherViewHeader: WeatherViewHeader =   WeatherViewHeader(weatherViewModel: weatherView.weatherViewModel, city: weatherView.$city)
        
        let isHiddenDescriptionText0 = try weatherViewHeader.inspect().find(viewWithTag: "description").vStack().text(0).isHidden()
        let isHiddenDescriptionText1 = try weatherViewHeader.inspect().find(viewWithTag: "description").vStack().text(1).isHidden()
        XCTAssertFalse(isHiddenDescriptionText0 || isHiddenDescriptionText1)
        
        let isHiddenTemperature = try weatherViewHeader.inspect().find(viewWithTag: "temperature").isHidden()
        XCTAssertFalse(isHiddenTemperature)
        
    }
    
}
