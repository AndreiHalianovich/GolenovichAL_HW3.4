//
//  GameSlider.swift
//  GolenovichAL_HW3.4
//
//  Created by Andrei Halianovich on 7.04.21.
//

import SwiftUI

struct GameSlider: View {
    
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        HStack{
            Text("0")
            CustomSlider(value: $currentValue, color: color, alpha: alpha)
            Text("100")
        }
        .padding()
       
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(currentValue: .constant(50.0), targetValue: 70, color: .red, alpha: 1)
    }
}
