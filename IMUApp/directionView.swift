//
//  directionView.swift
//  IMUApp
//
//  Created by Taiga Takano on 2021/08/13.
//

import SwiftUI

struct directionView: View {
    @ObservedObject var MSV2 : MotionSensorV2
    @ObservedObject var UDPC : UDPController
    var body: some View {
        if UDPC.IsSending{
            Image(systemName: "location.north")
                .font(.system(size: 150))
                .rotationEffect(Angle(degrees: MSV2.degree ))
                .foregroundColor(.blue)
        }else{
            Image(systemName: "location.north")
                .font(.system(size: 150))
                .rotationEffect(Angle(degrees: MSV2.degree ))
                .foregroundColor(.gray)
        }
        
    }
}

struct privatedirectionView: View {
    var body: some View {
            Image(systemName: "location.north")
                .font(.system(size: 150))
                .foregroundColor(.blue)
    }
}
