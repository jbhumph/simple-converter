//
//  WeightView.swift
//  CS50Converter
//
//  Created by John Humphrey on 12/11/23.
//

import SwiftUI

struct WeightView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var toConvert = 0.0
    @State private var converted = 0.0
    @State private var weighta = "Pounds"
    @State private var weightb = "Kilograms"
    // create dict for conversion types
    let weights = ["Kilograms", "Grams", "Milligrams", "Micrograms", "Metric Tons", "Imperial Tons", "US Tons", "Stones", "Pounds", "Ounces"]
    
    // Convert to Grams
    var startNumber: Double {
        let into = Double(toConvert)
        var number = 0.0
        if(weighta == "Kilograms") {
            number = into * 1000
        } else if(weighta == "Grams") {
            number = into
        } else if(weighta == "Milligrams") {
            number = into / 1000
        } else if(weighta == "Micrograms") {
            number = into / 1000000
        } else if(weighta == "Metric Tons") {
            number = into * 1000000
        } else if(weighta == "Imperial Tons") {
            number = into * 1016000
        } else if(weighta == "US Tons") {
            number = into * 907200
        } else if(weighta == "Stones") {
            number = into * 6350.29
        } else if(weighta == "Pounds") {
            number = into * 453.592
        } else if(weighta == "Ounces") {
            number = into * 28.3495
        }
        return number
    }
    
    var endNumber: Double {
        let into = Double(startNumber)
        var number = 0.0
        if(weightb == "Kilograms") {
            number = into / 1000
        } else if(weightb == "Grams") {
            number = into
        } else if(weightb == "Milligrams") {
            number = into * 1000
        } else if(weightb == "Micrograms") {
            number = into * 1000000
        } else if(weightb == "Metric Tons") {
            number = into / 1000000
        } else if(weightb == "Imperial Tons") {
            number = into / 1016000
        } else if(weightb == "US Tons") {
            number = into / 907200
        } else if(weightb == "Stones") {
            number = into / 6350.29
        } else if(weightb == "Pounds") {
            number = into / 453.592
        } else if(weightb == "Ounces") {
            number = into / 28.3495
        }
        return number
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Initial Weight in \(weighta)") {
                    TextField("Amount", value: $toConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("From...") {
                    Picker("Convert from", selection: $weighta) {
                        ForEach(weights, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Convert to...") {
                    Picker("Convert to", selection: $weightb) {
                        ForEach(weights, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Converted Weight in \(weightb)") {
                    Text(endNumber, format: .number)
                }
            }
            .navigationTitle("Weight Converter")
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
    WeightView()
}
