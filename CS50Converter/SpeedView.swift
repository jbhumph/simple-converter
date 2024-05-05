//
//  SpeedView.swift
//  CS50Converter
//
//  Created by John Humphrey on 12/11/23.
//

import SwiftUI

struct SpeedView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var toConvert = 0.0
    @State private var converted = 0.0
    @State private var speeda = "Miles / Hour"
    @State private var speedb = "Kilometers / Hour"
    // create dict for conversion types
    let speeds = ["Miles / Hour", "Feet / Second", "Meters / Second", "Kilometers / Hour", "Knots"]
    
    // Convert to Feet / Second
    var startNumber: Double {
        let into = Double(toConvert)
        var number = 0.0
        if(speeda == "Miles / Hour") {
            number = into * 1.467
        } else if(speeda == "Meters / Second") {
            number = into * 3.281
        } else if(speeda == "Kilometers / Hour") {
            number = into / 1.097
        } else if(speeda == "Knots") {
            number = into * 1.688
        } else if(speeda == "Feet / Second") {
            number = into
        }
        return number
    }
    
    var endNumber: Double {
        let into = Double(startNumber)
        var number = 0.0
        if(speedb == "Miles / Hour") {
            number = into / 1.467
        } else if(speedb == "Feet / Second") {
            number = into
        } else if(speedb == "Meters / Second") {
            number = into / 3.281
        } else if(speedb == "Kilometers / Hour") {
            number = into * 1.097
        } else if(speedb == "Knots") {
            number = into / 1.688
        }
        return number
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Initial Speed in \(speeda)") {
                    TextField("Amount", value: $toConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("From...") {
                    Picker("Convert from", selection: $speeda) {
                        ForEach(speeds, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Convert to...") {
                    Picker("Convert to", selection: $speedb) {
                        ForEach(speeds, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Converted Speed in \(speedb)") {
                    Text(endNumber, format: .number)
                }
            }
            .navigationTitle("Speed Converter")
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
    SpeedView()
}
