//
//  ContentView.swift
//  CheckMyAccuracy
//
//  Created by igor s on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value: Float = 20
    
    @State private var goal = Int.random(in: 0...100)
    
    private let min = 0
    private let max = 100
    
    var body: some View {
        
        VStack(spacing: 25) {
            Text("Подвиньте слайдер как можно ближе к: \(goal.formatted())")
            
            HStack {
                Text(min.formatted())
                
                SliderView(
                    value: $value,
                    minValue: Float(min),
                    maxValue: Float(max),
                    thumbColor: .systemPurple
                )
                
                Text(max.formatted())
            }
            
            Button("Проверь меня!") {}
            
            
            Button("Начать заново") {
                goal = Int.random(in: 0...100)
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
