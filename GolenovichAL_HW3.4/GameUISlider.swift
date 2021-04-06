//
//  GameUISlider.swift
//  GolenovichAL_HW3.4
//
//  Created by Andrei Halianovich on 5.04.21.
//

import SwiftUI

struct GameUISlider: UIViewRepresentable {
    @Binding var currentValue: Double
    @Binding var alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}
extension GameUISlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(value: Binding<Double>) {
            self._currentValue = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct GameUISlider_Previews: PreviewProvider {
    static var previews: some View {
        GameUISlider(currentValue: .constant(10), alpha: .constant(0.3))
    }
}
