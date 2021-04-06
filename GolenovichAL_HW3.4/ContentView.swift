//
//  ContentView.swift
//  GolenovichAL_HW3.4
//
//  Created by Andrei Halianovich on 5.04.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue: Int = 50
    @State private var currentValue: Double = 50.0
    @State private var alertIsPresented = false
    @State private var score: Int = 100
    @State private var alpha: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .frame(width: 355, alignment: .leading)
            HStack(spacing: 10) {
                Text("0")
                GameUISlider(currentValue: $currentValue, alpha: $alpha)
                    .onChange(of: currentValue) { _ in
                        setValueForSlider()
                    }
                Text("100")
            }
            .padding()
            Button(action: {alertIsPresented.toggle()}) {
                Text("Проверь меня!")
                    .alert(isPresented: $alertIsPresented, content: {
                        Alert(title: Text("Your score"), message: Text("\(Int(score))"))
                    })
            }
            
            Button(action: randomTargetValue) {
                Text("Начать заново")
            }
        }
    }
    
    private func randomTargetValue() {
        targetValue = Int.random(in: 0...100)
        setValueForSlider()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func setValueForSlider() {
        score = computeScore()
        alpha = CGFloat(score) / 100
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
