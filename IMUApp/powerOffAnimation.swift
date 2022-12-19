//
//  powerOffAnimation.swift
//  IMUApp
//
//  Created by Taiga Takano on 2021/08/22.
//

import SwiftUI

class powerOffAnimationValue : ObservableObject{
    @Published var showZero = false
    @Published var showFirst = false
    @Published var showSecound = false
}

struct powerOffAnimation: View {
    @ObservedObject var POAV : powerOffAnimationValue
    var body: some View {
        ZStack{
            Circle()
                .strokeBorder(lineWidth: 10, antialiased: false)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(POAV.showSecound ? .gray : .gray.opacity(0))
                .rotation3DEffect(.degrees(POAV.showFirst ? 0 : 360) , axis: (x: 1 , y: -1 , z : 1))
                .animation(Animation.easeInOut(duration: 1).delay(0.1))
            
            Circle()
                .strokeBorder(lineWidth: 10, antialiased: false)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(POAV.showSecound ? .gray : .gray.opacity(0))
                .rotation3DEffect(.degrees(POAV.showFirst ? 0 : 360) , axis: (x: 1 , y: 1 , z : 1))
                .animation(Animation.easeInOut(duration: 1).delay(0.1))
            
            Image(systemName: "power")
                .resizable()
                .rotation3DEffect(.degrees(POAV.showFirst ? 0 : 360) , axis: (x: 1 , y: 1 , z : 1))
                .foregroundColor(.gray)
                .opacity(POAV.showSecound ? 1 :0)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .animation(Animation.easeInOut(duration: 1))
        }
    }
}
