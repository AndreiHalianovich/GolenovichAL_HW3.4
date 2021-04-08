//
//  GameUISlider.swift
//  GolenovichAL_HW3.4
//
//  Created by Andrei Halianovich on 5.04.21.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    @Binding var value: Double
    
    let color: UIColor
    let alpha: Int
    
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
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}
extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct GameUISlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(10), color: .red, alpha: 30)
    }
}
