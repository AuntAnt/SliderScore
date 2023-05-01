//
//  ContentView.swift
//  SliderScore
//
//  Created by Anton Kuzmin on 01.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 1...99)
    @State private var sliderValue = Float.random(in: 1...99)
    @State private var isAlertPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
            
            HStack {
                Text("0")
                UISliderViewRepresentation(
                    guessedValue: $sliderValue,
                    targetValue: targetValue,
                    alpha: computeScore()
                )
                Text("100")
            }
            
            Button("Проверь меня!", action: {isAlertPresented.toggle()})
                .alert("Your score", isPresented: $isAlertPresented, actions: {}) {
                    Text(computeScore().formatted())
                }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 1...99)
                sliderValue = Float.random(in: 1...99)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(sliderValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
