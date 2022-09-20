//
//  SliderUIKitView.swift
//  CheckMyAccuracy
//
//  Created by igor s on 19.09.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Double
    let minValue: Double
    let maxValue: Double
    let thumbOpacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = Float(minValue)
        slider.maximumValue = Float(maxValue)
        slider.thumbTintColor = .systemRed.withAlphaComponent(CGFloat(thumbOpacity)/100)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .systemRed.withAlphaComponent(CGFloat(thumbOpacity)/100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
}

extension SliderView {
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

struct SliderView_Previews: PreviewProvider {
    
    static var previews: some View {
        SliderView(value: .constant(50), minValue: 0, maxValue: 100, thumbOpacity: 100)
            .padding()
    }
    
}
