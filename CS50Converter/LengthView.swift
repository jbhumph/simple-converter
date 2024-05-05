//
//  LengthView.swift
//  CS50Converter
//
//  Created by John Humphrey on 12/11/23.
//

import SwiftUI

struct LengthView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var toConvert = 0.0
    @State private var converted = 0.0
    @State private var lengtha = "Feet"
    @State private var lengthb = "Kilometers"
    // create dict for conversion types
    let lengths = ["Kilometers", "Meters", "Centimeters", "Millimeters", "Micrometers", "Nanometers", "Miles", "Yards", "Feet", "Inches", "Nautical Miles"]
    
    // Convert to Kilometers
    var startNumber: Double {
        let into = Double(toConvert)
        var number = 0.0
        if(lengtha == "Kilometers") {
            number = into
        } else if(lengtha == "Meters") {
            number = into / 1000
        } else if(lengtha == "Centimeters") {
            number = into / 100000
        } else if(lengtha == "Millimeters") {
            number = into / 1000000
        } else if(lengtha == "Micrometers") {
            number = into / 1000000000
        } else if(lengtha == "Nanometers") {
            number = into / 1000000000000
        } else if(lengtha == "Miles") {
            number = into * 1.609344
        } else if(lengtha == "Yards") {
            number = into / 1093.6133
        } else if(lengtha == "Feet") {
            number = into / 3280.8399
        } else if(lengtha == "Inches") {
            number = into / 39370.0787
        } else if(lengtha == "Nautical Miles") {
            number = into * 1.852
        }
        
        return number
    }
    
    // Convert from Kilometers
    var endNumber: Double {
        let into = Double(startNumber)
        var number = 0.0
        if(lengthb == "Kilometers") {
            number = into
        } else if(lengthb == "Meters") {
            number = into * 1000
        } else if(lengthb == "Centimeters") {
            number = into * 100000
        } else if(lengthb == "Millimeters") {
            number = into * 1000000
        } else if(lengthb == "Micrometers") {
            number = into * 1000000000
        } else if(lengthb == "Nanometers") {
            number = into * 1000000000000
        } else if(lengthb == "Miles") {
            number = into / 1.609344
        } else if(lengthb == "Yards") {
            number = into * 1093.6133
        } else if(lengthb == "Feet") {
            number = into * 3280.8399
        } else if(lengthb == "Inches") {
            number = into * 39370.0787
        } else if(lengthb == "Nautical Miles") {
            number = into / 1.852
        }
        
        return number
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Initial Length in \(lengtha)") {
                    TextField("Amount", value: $toConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("From...") {
                    Picker("Convert from", selection: $lengtha) {
                        ForEach(lengths, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Convert to...") {
                    Picker("Convert to", selection: $lengthb) {
                        ForEach(lengths, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Converted Length in \(lengthb)") {
                    Text(endNumber, format: .number)
                }
            }
            .navigationTitle("Length Converter")
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
    LengthView()
}
