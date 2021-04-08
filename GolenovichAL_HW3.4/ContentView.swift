//
//  ContentView.swift
//  GolenovichAL_HW3.4
//
//  Created by Andrei Halianovich on 5.04.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Double = 50.0
    @State private var alertIsPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .frame(width: 355, alignment: .leading)
            
            GameSlider(
                currentValue: $currentValue,
                targetValue: targetValue,
                color: .red,
                alpha: computeScore())
    
            Button(action: {alertIsPresented = true }) {
                Text("Проверь меня!")
            }
            .alert(isPresented: $alertIsPresented, content: {
                Alert(title: Text("Your score"), message: Text("\(computeScore())"))
            })
            
            Button(action: randomTargetValue) {
                Text("Начать заново")
            }
        }
    }
    
    private func randomTargetValue() {
        targetValue = Int.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
