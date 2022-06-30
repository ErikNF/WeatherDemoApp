//
//  WelcomView.swift
//  WeatherDemoApp
//
//  Created by Эрик Нагаев on 27.06.2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomView: View {
    @EnvironmentObject var locationManager:
    LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Добро пожаловать в приложение Погода")
                    .font(.system(size: 38))
                    .bold()
                Text("Нажмите на кнопку для определения Вашего местоположения")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()

            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
    }
}
