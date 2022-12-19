//
//  ResetButton.swift
//  IMUApp
//
//  Created by 高野大河 on 2021/08/14.
//

import SwiftUI

struct ResetButton: View {
    @ObservedObject var MSV2 : MotionSensorV2
    var body: some View {
        Button(action: {
            MSV2.reset()
        } ){
            ZStack {
                Circle()
                    .frame(width: 70.0, height: 70.0)
                    .foregroundColor(.gray)
                    .opacity(0.7)
                Image(systemName: "gobackward")
                    .foregroundColor(Color("White-D"))
                    .font(Font.title.weight(.bold))
            }
        }
    }
}

//struct ResetButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetButton()
//    }
//}
