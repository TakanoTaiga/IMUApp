//
//  directionStatus.swift
//  IMUApp
//
//  Created by Taiga Takano on 2021/08/14.
//

import SwiftUI

struct directionStatus: View {
    @ObservedObject var MSV2 : MotionSensorV2
    var body: some View {
        Text(degreeShaper(inputDegree: MSV2.degree) + "°")
            .font(.system(size: 60))
            .bold()
    }
    func degreeShaper(inputDegree : Double) -> String{
        var degree = inputDegree
        let FPOne : Int = Int(inputDegree * 100) - Int(inputDegree * 10) * 10
        
        if FPOne > 4 {
            degree += 0.1
        }
        
        degree = Double(Int(degree * 10)) / 10
        
        if Int(degree) == 360 {
            degree = 0
        }
        
        return String(degree)
    }
}
