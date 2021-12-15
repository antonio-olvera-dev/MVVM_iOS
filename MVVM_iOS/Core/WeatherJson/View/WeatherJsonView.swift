//
//  WeatherJsonView.swift
//  MVVM_iOS
//
//  Created by Antonio Olvera Fernández on 15/12/21.
//

import SwiftUI

struct WeatherJsonView: View {
    
    var controller:WeatherJsonViewController = WeatherJsonViewController()
    var json:String = ""
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text(json).padding()
                Spacer().padding(.top, 22)
            }
        }
    }
}

struct WeatherJsonView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherJsonView()
    }
}
