//
//  ContentView.swift
//  Weather
//
//  Created by 蕭張媛 on 2024/1/16.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                Spacer()
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      tempurature: 27)
                
                HStack(spacing: 25){
                    WeatherDayView(DayOfWeek: "TUE",
                                   ImageName: "sun.max.fill",
                                   temperature: 27)
                    WeatherDayView(DayOfWeek: "WED",
                                   ImageName: "cloud.sun.fill",
                                   temperature: 27)
                    WeatherDayView(DayOfWeek: "THU",
                                   ImageName: "wind",
                                   temperature: 27)
                    WeatherDayView(DayOfWeek: "FRI",
                                   ImageName: "sunset.fill",
                                   temperature: 27)
                    WeatherDayView(DayOfWeek: "SAT",
                                   ImageName: "snow",
                                   temperature: 27)
                }
                
                Spacer()
                
                Button{
                    isNight = !isNight
                }label: {
                    WeatherButton(title: "Change Day Time", bgColor: .white, textColor: .blue)
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var DayOfWeek: String
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(DayOfWeek)
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(_: .white)
            Image(systemName: ImageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.pink,.orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundStyle(_: .white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
                        colors: [isNight ? .black : .blue,
                                 isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(_: .white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var tempurature: Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("\(tempurature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(_: .white)
        }
        .padding(.bottom, 50)
    }
}

struct WeatherButton: View {
    var title: String
    var bgColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width:300, height: 60)
            .background(bgColor)
            .foregroundStyle(_: textColor)
            .font(.system(size: 25, weight: .medium))
            .cornerRadius(12)
        //.clipShape(Capsule())
    }
}
