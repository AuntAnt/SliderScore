//
//  UISliderViewRepresentation.swift.swift
//  SliderScore
//
//  Created by Anton Kuzmin on 01.05.2023.
//

import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    @Binding var guessedValue: Float
    
    let targetValue: Int
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didSliderChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = guessedValue
        
        print(alpha)
        
        uiView.thumbTintColor = uiView.thumbTintColor?.withAlphaComponent(CGFloat(Double(alpha) / 100))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(guessedNumber: $guessedValue)
    }
}

// MARK: - Coordinator
extension UISliderViewRepresentation {
    final class Coordinator: NSObject {
        @Binding var guessedNumber: Float

        init(guessedNumber: Binding<Float>) {
            self._guessedNumber = guessedNumber
        }
        
        @objc func didSliderChanged(_ sender: UISlider) {
            guessedNumber = sender.value
        }
    }
}

struct UISliderViewRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderViewRepresentation(guessedValue: .constant(20), targetValue: 99, alpha: 30)
    }
}
