//
//  WeatherViewTest.swift
//  MVVM_iOSUITests
//
//  Created by Antonio Olvera Fernández on 17/12/21.
//

import XCTest
import ViewInspector
@testable import MVVM_iOS

extension WeatherView: Inspectable { }

class WeatherViewTest: XCTestCase {

    func testView() async throws{

        let weatherView:WeatherView =  await WeatherView()
        
        let city = await weatherView.city
        XCTAssertEqual(city, "Madrid")

        let isHiddenWeatherViewHeader = try weatherView.inspect().find(viewWithTag: "WeatherViewHeader").isHidden()
        XCTAssertFalse(isHiddenWeatherViewHeader)
        
        let humidityForegroundColor = try weatherView.inspect().find(viewWithTag: "humidity").vStack().label(0).foregroundColor()
        let isHiddenHumidity = try weatherView.inspect().find(viewWithTag: "humidity").isHidden()
        XCTAssertEqual("\(humidityForegroundColor!)", "white")
        XCTAssertFalse(isHiddenHumidity)
        
        let isHiddenChangeCity = try weatherView.inspect().find(viewWithTag: "changeCity").isHidden()
        let isHiddenChangeCityButton = try weatherView.inspect().find(viewWithTag: "changeCity").vStack().button(0).isHidden()
        XCTAssertFalse(isHiddenChangeCityButton || isHiddenChangeCity)

        let isHiddenShowJson = try weatherView.inspect().find(viewWithTag: "showJson").isHidden()
        let isHiddenShowJsonNavigationLink = try weatherView.inspect().find(viewWithTag: "showJson").vStack().navigationLink(0).isHidden()
        XCTAssertFalse(isHiddenShowJson || isHiddenShowJsonNavigationLink)

    }

}
