//
//  WeatherControlerTest.swift
//  MVVM_iOSTests
//
//  Created by Antonio Olvera Fernández on 17/12/21.
//

import XCTest
@testable import MVVM_iOS

class WeatherControlerTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testGetSwitchCity() throws{
        
        let weatherController: WeatherController = WeatherController()
        
        let result1 = weatherController.getSwitchCity(currentCity: "Madrid")
        XCTAssertEqual(result1, "Barcelona")
        
        let result2 = weatherController.getSwitchCity(currentCity: "madrid")
        XCTAssertEqual(result2, "Barcelona")
        
        let result3 = weatherController.getSwitchCity(currentCity: "Barcelona")
        XCTAssertEqual(result3, "Madrid")
        
        let result4 = weatherController.getSwitchCity(currentCity: "barCElonA")
        XCTAssertEqual(result4, "Madrid")
        
        let result5 = weatherController.getSwitchCity(currentCity: "default")
        XCTAssertEqual(result5, "Madrid")
    }
    
}
