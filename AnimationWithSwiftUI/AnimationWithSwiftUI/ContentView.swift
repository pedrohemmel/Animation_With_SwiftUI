//
//  ContentView.swift
//  AnimationWithSwiftUI
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 24/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    
    @State var color = Color(red: Double.random(in: 0...255) / 255, green: Double.random(in: 0...255) / 255, blue: Double.random(in: 0...255) / 255)
    
    @State var positionX = Int.random(in: 20...350)
    @State var positionY = Int.random(in: 20...750)
    
    var body: some View {
        
        Button(action: {
            
            //Modifying the colors of the rectangle
            color = Color(red: Double.random(in: 0...255) / 255, green: Double.random(in: 0...255) / 255, blue: Double.random(in: 0...255) / 255)
            
            //Changing the position of the button
            positionX = Int.random(in: 20...350)
            positionY = Int.random(in: 20...750)
        }, label: {
            Rectangle()
                .fill(self.color)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(self.rotation))
                .scaleEffect(CGFloat(self.scaleXY))
                .offset()
                .animation(Animation.easeInOut(duration: 5)
                .repeatForever(autoreverses: true)
                .speed(4))
                .position(x: CGFloat(positionX), y: CGFloat(positionY))
                .onAppear() {
                    self.rotation += 360
                    self.scaleXY += 1.1

                }
        })
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
