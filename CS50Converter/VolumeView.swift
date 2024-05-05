//
//  VolumeView.swift
//  CS50Converter
//
//  Created by John Humphrey on 12/11/23.
//

import SwiftUI

struct VolumeView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var toConvert = 0.0
    @State private var converted = 0.0
    @State private var vola = "US Liquid Gallons"
    @State private var volb = "Imperial Pints"
    // create dict for conversion types
    let vols = ["US Liquid Gallons", "US Liquid Quarts", "US Liquid Pints", "US Legal Cups", "US Fluid Ounces", "US Tablespoons", "US Teaspoons", "Cubic Meters", "Liters", "Milliliters", "Imperial Gallons", "Imperial Quarts", "Imperial Pints", "Imperial Cups", "Imperial Fluid Ounces", "Imperial Tablespoons", "Imperial Teaspoons", "Cubic Feet", "Cubic Inches"]
    
    // Convert to Milliliters
    var startNumber: Double {
        let into = Double(toConvert)
        var number = 0.0
        if(vola == "US Liquid Gallons") {
            number = into * 3785.41
        } else if(vola == "US Liquid Quarts") {
            number = into * 946.353
        } else if(vola == "US Liquid Pints") {
            number = into * 473.176
        } else if(vola == "US Legal Cups") {
            number = into * 240
        } else if(vola == "US Fluid Ounces") {
            number = into * 29.5735
        } else if(vola == "US Tablespoons") {
            number = into * 14.7868
        } else if(vola == "US US Teaspoons") {
            number = into * 4.929
        } else if(vola == "US Cubic Meters") {
            number = into * 1000000
        } else if(vola == "Liters") {
            number = into * 1000
        } else if(vola == "Milliliters") {
            number = into
        } else if(vola == "Imperial Gallons") {
            number = into * 4546.09
        } else if(vola == "Imperial Quarts") {
            number = into * 1136.52
        } else if(vola == "Imperial Pints") {
            number = into * 568.261
        } else if(vola == "Imperial Cups") {
            number = into * 284.131
        } else if(vola == "Imperial Fluid Ounces") {
            number = into * 28.4131
        } else if(vola == "Imperial Tablespoons") {
            number = into * 17.7582
        } else if(vola == "Imperial Teaspoons") {
            number = into * 5.919
        } else if(vola == "Cubic Feet") {
            number = into * 28316.8
        } else if(vola == "Cubic Inches") {
            number = into * 16.3871
        }
        
        return number
    }
    
    // Convert from Milliliters
    var endNumber: Double {
        let into = Double(startNumber)
        var number = 0.0
        if(volb == "US Liquid Gallons") {
            number = into / 3785.41
        } else if(volb == "US Liquid Quarts") {
            number = into / 946.353
        } else if(volb == "US Liquid Pints") {
            number = into / 473.176
        } else if(volb == "US Legal Cups") {
            number = into / 240
        } else if(volb == "US Fluid Ounces") {
            number = into / 29.5735
        } else if(volb == "US Tablespoons") {
            number = into / 14.7868
        } else if(volb == "US US Teaspoons") {
            number = into / 4.929
        } else if(volb == "US Cubic Meters") {
            number = into / 1000000
        } else if(volb == "Liters") {
            number = into / 1000
        } else if(volb == "Milliliters") {
            number = into
        } else if(volb == "Imperial Gallons") {
            number = into / 4546.09
        } else if(volb == "Imperial Quarts") {
            number = into / 1136.52
        } else if(volb == "Imperial Pints") {
            number = into / 568.261
        } else if(volb == "Imperial Cups") {
            number = into / 284.131
        } else if(volb == "Imperial Fluid Ounces") {
            number = into / 28.4131
        } else if(volb == "Imperial Tablespoons") {
            number = into / 17.7582
        } else if(volb == "Imperial Teaspoons") {
            number = into / 5.919
        } else if(volb == "Cubic Feet") {
            number = into / 28316.8
        } else if(volb == "Cubic Inches") {
            number = into / 16.3871
        }
        
        return number
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Initial Volume in \(vola)") {
                    TextField("Amount", value: $toConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("From...") {
                    Picker("Convert from", selection: $vola) {
                        ForEach(vols, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Convert to...") {
                    Picker("Convert to", selection: $volb) {
                        ForEach(vols, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Converted Volume in \(volb)") {
                    Text(endNumber, format: .number)
                }
            }
            .navigationTitle("Volume Converter")
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
    VolumeView()
}
