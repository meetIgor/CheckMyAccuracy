//
//  SliderUIKitView.swift
//  CheckMyAccuracy
//
//  Created by igor s on 19.09.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Float
    let minValue: Float
    let maxValue: Float
    let thumbColor: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        //slider.value = 50
        slider.thumbTintColor = thumbColor
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }

}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50), minValue: 0, maxValue: 100, thumbColor: .systemPurple)
            .padding()
    }
}
