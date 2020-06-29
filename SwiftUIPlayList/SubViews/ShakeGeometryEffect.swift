//
//  ShakeGeometryEffect.swift
//  SwiftUIPlayList
//
//  Created by ramil on 29.06.2020.
//

import SwiftUI

struct ShakeGeometryEffect: View {
    @State var selection = 0
    @State var shaking = false
    private var tipAmount = ["10%", "15%", "20%", "25%"]
    
    var body: some View {
        let value = Binding<Int> (
            get: { self.selection },
            set: { newValue in
                withAnimation(Animation.easeInOut(duration: 0.3)) {
                    self.shaking.toggle()
                }
                self.selection = newValue
            })
        return VStack(spacing: 20) {
            Picker("Amount", selection: value) {
                ForEach(tipAmount.indices, id: \.self) { i in
                    Text(self.tipAmount[i]).tag(i)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Text("Tip Amount: \(tipAmount[self.selection])")
                .font(.title)
                .fixedSize()
                .modifier(ShakeEffect(animatableData: CGFloat(self.shaking ? 1 : 0)))
            
            Spacer()
        }.padding()
    }
}

struct ShakeGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        ShakeGeometryEffect()
    }
}

struct ShakeEffect: GeometryEffect {
    
    var animatableData: CGFloat
    
    func modifier(_ x: CGFloat) -> CGFloat {
        10 * sin(x * .pi * 2)
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let transform = ProjectionTransform(CGAffineTransform(translationX: 10 + modifier(animatableData), y: 0))
        
        return transform
    }
    
}
