//
//  PlanetOrbitGeometryEffect.swift
//  SwiftUIPlayList
//
//  Created by ramil on 29.06.2020.
//

import SwiftUI

struct PlanetOrbitGeometryEffect: View {

    @State private var offsetA: CGFloat = 0
    @State private var offsetB: CGFloat = 0
    @State private var rotationDegree: Double = 90
    
    @State private var animationFlag = false
    private var animation = Animation.linear.repeatForever(autoreverses: true)
    
    var body: some View {
        ZStack {
            ForEach([5, 10, 15, 20, 25], id: \.self) { idx in
                self.makeCircle(dim: CGFloat(idx * 10))
            }
            
            Circle()
                .fill()
                .foregroundColor(Color.orange)
                .frame(width: 15, height: 15, alignment: .center)
        }.onAppear {
            self.animationFlag.toggle()
        }
    }
    
    func getRandomColor() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
    
    func makeOrbitEffect(diametr: CGFloat) -> some GeometryEffect {
        return OrbitEffect(percent: self.animationFlag ? 1.0 : 0.0, radius: diametr / 2.0)
    }
    
    func makeCircle(dim: CGFloat) -> some View {
        let diameter = dim + 5
        return ZStack {
            Circle()
                .stroke(Color.gray)
                .frame(width: diameter, height: diameter)
            
            Circle()
                .fill()
                .foregroundColor(getRandomColor())
                .frame(width: 10, height: 10, alignment: .center)
                .offset(x: offsetB, y: 0)
                .modifier(self.makeOrbitEffect(diametr: diameter))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
        }
    }
}

struct PlanetOrbitGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        PlanetOrbitGeometryEffect()
    }
}

struct OrbitEffect: GeometryEffect {
    let initialAngle = CGFloat.random(in: 0..<2 * .pi)
    
    var percent: CGFloat = 0
    let radius: CGFloat
    
    var animatableData: CGFloat {
        get { return percent }
        set { percent = newValue }
    }
        
    func effectValue(size: CGSize) -> ProjectionTransform {
        let angle = 2 * .pi * percent + initialAngle
        let point = CGPoint(x: cos(angle) * radius, y: sin(angle) * radius)
        return ProjectionTransform(CGAffineTransform(translationX: point.x, y: point.y))
    }
        
}
