//
//  TestUI.swift
//  IMUApp
//
//  Created by 高野大河 on 2021/08/21.
//

import SwiftUI

struct TestUI: View {
    @State var showFirst = false
    @State var showSecound = false
    var body: some View {
        ZStack{
            
            privatedirectionView()
                .opacity(showSecound ? 0 :1)
                .scaleEffect(CGSize(width: showSecound ? 0 :1, height: showSecound ? 0 :1))
                .animation(Animation.easeInOut(duration: 1))
            

            
            Circle()
                .strokeBorder(lineWidth: 10, antialiased: false)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(showSecound ? .gray : .gray.opacity(0))
                .rotation3DEffect(.degrees(showFirst ? 0 : 360) , axis: (x: 1 , y: -1 , z : 1))
                .animation(Animation.easeInOut(duration: 1).delay(0.1))
            
            
            
            Circle()
                .strokeBorder(lineWidth: 10, antialiased: false)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(showSecound ? .gray : .gray.opacity(0))
                .rotation3DEffect(.degrees(showFirst ? 0 : 360) , axis: (x: 1 , y: 1 , z : 1))
                .animation(Animation.easeInOut(duration: 1).delay(0.1))
            
            Image(systemName: "power")
                .resizable()
                .rotation3DEffect(.degrees(showFirst ? 0 : 360) , axis: (x: 1 , y: 1 , z : 1))
                .foregroundColor(.gray)
                .opacity(showSecound ? 1 :0)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .animation(Animation.easeInOut(duration: 1))
            
            VStack {
                Spacer()
                Button(action:{
                    showSecound = true
                    showFirst = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7 ) {
                        showSecound = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                            showFirst = false
                        }
                    }
                }){
                    if false == showFirst{
                        Text("Tap")
                    }
                }
            }
        }
    }
}

struct TestUI_Previews: PreviewProvider {
    static var previews: some View {
        TestUI()
    }
}
