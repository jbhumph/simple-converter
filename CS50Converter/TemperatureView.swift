//
//  TemperatureView.swift
//  CS50Converter
//
//  Created by John Humphrey on 12/11/23.
//

import SwiftUI

struct TemperatureView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var toConvert = 0.0
    @State private var converted = 0.0
    @State private var tempa = "Fahrenheit"
    @State private var tempb = "Celsius"
    // create dict for conversion types
    let temps = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var startNumber: Double {
        let into = Double(toConvert)
        var number = 0.0
        if(tempa == "Fahrenheit") {
            number = (into - 32) * 5/9
        } else if(tempa == "Kelvin") {
            number = into - 273.15
        } else if(tempa == "Celsius") {
            number = into
        }
        return number
    }
    
    var endNumber: Double {
        let into = Double(startNumber)
        var number = 0.0
        if(tempb == "Fahrenheit") {
            number = (into * 9/5) + 32
        }
        else if(tempb == "Kelvin") {
            number = into + 273.15
        }
        else if(tempb == "Celsius") {
            number = into
        }
        return number
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Initial Temperature in \(tempa)") {
                    TextField("Amount", value: $toConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("From...") {
                    Picker("Convert from", selection: $tempa) {
                        ForEach(temps, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Convert to...") {
                    Picker("Convert to", selection: $tempb) {
                        ForEach(temps, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Converted Temperature in \(tempb)") {
                    Text(endNumber, format: .number)
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    TemperatureView()
}
