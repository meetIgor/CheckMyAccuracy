//
//  ContentView.swift
//  CheckMyAccuracy
//
//  Created by igor s on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = 50.0
    @State private var target = Int.random(in: 0...100)
    @State private var showScore = false
    
    var score: Int {
        let difference = abs(target - lround(value))
        return 100 - difference
    }
    
    private let min = 0
    private let max = 100
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            Text("Move the slider closer to: \(target.formatted())")
                .font(.system(size: 22))
            
            HStack {
                Text(min.formatted())
                
                SliderView(
                    value: $value,
                    minValue: Double(min),
                    maxValue: Double(max),
                    thumbOpacity: score
                )
                
                Text(max.formatted())
            }
            
            Button("Check me!") { showScore.toggle() }
                .alert("Your Accuracy Score", isPresented: $showScore, actions: {}) {
                    Text(score.formatted())
                }
            
            Button("Try again") {
                target = Int.random(in: min...max)
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
