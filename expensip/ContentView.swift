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
            TextField("ss", value: $score, formatter: AAA())
                .keyboardType(.decimalPad)
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
