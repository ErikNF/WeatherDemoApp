//
//  WeatherView.swift
//  WeatherDemoApp
//
//  Created by Эрик Нагаев on 27.06.2022.
//
import SDWebImageSwiftUI
import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
   
    //Добавление пути получения с сайта иконки(необходимо установить дополнительный пакет SDWebImage)
    var weatherIconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png"
        return URL(string: urlString)! }
    
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Сегодня, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 0) {
                            
                            // Указания пути получения икони
                            WebImage(url: weatherIconURL)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75)
                                .font(.system(size: 50))
                            
                            Text(weather.weather[0].description)
                                .bold()
                               
                           
                        }
                        .frame(width: 150, alignment: .leading)
                       
                        Spacer()
                        
                        Text(weather.main.feelsLike .roundDouble() + "°")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
//                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string:"https://kartinkin.net/uploads/posts/2021-01/1611329235_3-p-risovannii-fon-goroda-3.png")) { image in image
                            .resizable()
                            .cornerRadius(20)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Погода сейчас")
                        .bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Мин.темп.", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                
                        WeatherRow(logo: "thermometer", name: "Макс.темп.", value: (weather.main.tempMax.roundDouble() + "°"))
                            .frame(height: 53)
                        
                    }
                    HStack {
                        WeatherRow(logo: "timer", name: "Давление", value: (weather.main.pressure.roundDouble() + "гПа"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Влажность", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    VStack {
                        WeatherRow(logo: "wind", name: "Ветер", value: (weather.wind.speed.roundDouble() + "м/с"))
                            .padding()
                            .frame(width: 350, height: 50)
                            
                    }
                }
                
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
            }
            
        }
      
            
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
