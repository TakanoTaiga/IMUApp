//
//  ContentView.swift
//  IMUApp
//
//  Created by 高野大河 on 2021/07/01.
//

import SwiftUI
import Network

struct ContentView: View {
    @ObservedObject var UDPC = UDPController()
    @ObservedObject var MSV2 = MotionSensorV2()
    @ObservedObject var POAV = powerOffAnimationValue()
    @State var s = 0
    var body: some View {
        ZStack {
            BackGroundColor()
            
            NetworkInfomationViews(UDPC: UDPC)
                .padding([.leading, .bottom, .trailing])
                .padding(.top, 60.0)
            
            if POAV.showZero{
                directionView(MSV2: MSV2 , UDPC: UDPC)
                    .opacity(POAV.showSecound ? 0 :1)
                    .scaleEffect(CGSize(width: POAV.showSecound ? 0 :1, height: POAV.showSecound ? 0 :1))
                    .animation(Animation.easeInOut(duration: 1) , value: POAV.showSecound)
            }else{
                directionView(MSV2: MSV2 , UDPC: UDPC)
            }
            
            
            powerOffAnimation(POAV: POAV)
            
            VStack{
                Spacer()
                HStack{
                    ResetButton(MSV2: MSV2)
                    Spacer()
                    ShareButton(UDPC: UDPC , MSV2: MSV2 , POAV: POAV)
                }
                .padding(.all , 45.0)
            }
            
            VStack {
                Spacer()
                HStack {
                    directionStatus(MSV2: MSV2)
                        .padding(.leading, 40.0)
                    Spacer()
                }
                
            }
            .padding(.bottom, 200.0)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct BackGroundColor: View {
    var body: some View {
        Color("White-D")
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                UIApplication.shared.closeKeyboard()
            }
    }
}
