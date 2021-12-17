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

    func testView()  throws{

        let weatherView:WeatherView =  WeatherView()
        let result = try weatherView.inspect().find(viewWithTag: "humidity").vStack().label(0).foregroundColor()
        
        XCTAssertEqual("\(result!)", "white")
    }

}
