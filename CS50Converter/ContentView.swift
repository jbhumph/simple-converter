//
//  ContentView.swift
//  CS50Converter
//
//  Created by John Humphrey on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
                VStack {
                    Text("Simple Converter")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    Spacer()
                    NavigationStack {
                        VStack {
                            Spacer()
                            NavigationLink(destination: TemperatureView()) {
                                Label("Temperature", systemImage: "thermometer.sun")
                                    .font(.largeTitle)
                            }
                            .buttonStyle(.bordered)
                            .clipShape(Capsule())
                            
                            Spacer()
                            
                            NavigationLink(destination: SpeedView()) {
                                Label("    Speed", systemImage: "gauge.with.dots.needle.67percent")
                                    .font(.largeTitle)
                            }
                            .buttonStyle(.bordered)
                            .clipShape(Capsule())
                            
                            Spacer()
                            
                            NavigationLink(destination: WeightView()) {
                                Label("   Weight", systemImage: "scalemass")
                                    .font(.largeTitle)
                            }
                            .buttonStyle(.bordered)
                            .clipShape(Capsule())
                            
                            Spacer()
                            
                            NavigationLink (destination: LengthView()) {
                                Label("   Length", systemImage: "lines.measurement.horizontal")
                                    .font(.largeTitle)
                            }
                            
                            .buttonStyle(.bordered)
                            .clipShape(Capsule())
                            
                            Spacer()
                            
                            NavigationLink(destination: VolumeView()) {
                                Label("    Volume", systemImage: "arrow.up.trash")
                                    .font(.largeTitle)
                            }
                            .buttonStyle(.bordered)
                                .clipShape(Capsule())
                                

                            Spacer()
                        }
                    }
                    .padding()
                }
        }
    }
}

#Preview {
    ContentView()
}
