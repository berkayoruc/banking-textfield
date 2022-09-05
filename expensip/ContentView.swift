//
//  ContentView.swift
//  expensip
//
//  Created by berkay on 4.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var score: String = ""
    
    var body: some View {
        VStack {
            DecimalView()
//            TextField("ss", value: $score, formatter: AAA())
//                .padding()
//                .background(Color.black.opacity(0.1))
//                .padding()
//                .keyboardType(.decimalPad)
        }
    }
}

struct DecimalView: View {
    @State private var amount = ""
    var body: some View {
        Form {
            Section(header: Text("Amount")) {
                HStack {
                    Text("£")
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.decimalPad)
                        .onChange(of: amount) { _ in
                            let filtered = amount.filter {"0123456789.".contains($0)}
                            
                            if filtered == "." {
                                amount = "0."
                            } else if filtered == "00" {
                                amount = "0"
                            }
                            
                            else if filtered.contains(".") {
                                let splitted = filtered.split(separator: ".", omittingEmptySubsequences: false)
                                if splitted.count >= 2 {
                                    let preDecimal = String(splitted[0])
                                    let afterDecimal = String(splitted[1])
                                    amount = "\(preDecimal).\(afterDecimal.prefix(2))"
                                }
                            }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class AAA: Formatter {
    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return formatted(value: string)
        }
        return nil
    }
    
    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = string as AnyObject?
        return true
    }
    
    func formatted(value: String?) -> String? {
        guard let aa = value else { return nil }
        
        return aa
    }
}
