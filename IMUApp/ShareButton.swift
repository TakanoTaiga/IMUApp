//
//  ShareButton.swift
//  IMUApp
//
//  Created by 高野大河 on 2021/08/14.
//

import SwiftUI

struct ShareButton: View {
    @ObservedObject var UDPC : UDPController
    @ObservedObject var MSV2 : MotionSensorV2
    @ObservedObject var POAV : powerOffAnimationValue
    
    let haptics = UINotificationFeedbackGenerator()
    
    @State var SendingTimer : Timer!
    @State var tapNow = true
    var body: some View {
        if UDPC.IP != "" && UDPC.PORT != "" && Int(UDPC.PORT)! < 65535 && Int(UDPC.PORT)! > 49152 {
            ShareButtonUI(UDPC: UDPC)
                .onTapGesture {
                    if UDPC.IP != "" && UDPC.PORT != "" && Int(UDPC.PORT)! < 65535 && Int(UDPC.PORT)! > 49152 {
                        UDPC.IsSending.toggle()
                        if UDPC.IsSending{
                            UDPTimerStart()
                        }else{
                            UDPTimerStop()
                        }
                    }
                }
                .onLongPressGesture {
                    if UDPC.IP != "" && UDPC.PORT != "" && Int(UDPC.PORT)! < 65535 && Int(UDPC.PORT)! > 49152 {
                        if false == POAV.showFirst{
                            POAV.showZero = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ){
                                POAV.showSecound = true
                                POAV.showFirst = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7 ) {
                                    POAV.showSecound = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                                        POAV.showFirst = false
                                        POAV.showZero = false
                                    }
                                }
                                self.haptics.notificationOccurred(.success)
                                UDPC.send(("QUIT").data(using: .utf8)!)
                            }
                        }
                    }
                }
        }
        else{
            ShareButtonUI(UDPC: UDPC)
                .opacity(0.5)
        }
    }
    
    func UDPTimerStart(){
        SendingTimer?.invalidate()
        SendingTimer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true){
            _ in
            if UDPC.sendedValue != degreeShaper(inputDegree: MSV2.degree){
                UDPC.send(("IMUDEG" + degreeShaper(inputDegree: MSV2.degree) + "END" ).data(using: .utf8)!)
                UDPC.sendedValue = degreeShaper(inputDegree: MSV2.degree)
                NSLog("Sended")
            }
        }
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
    
    func UDPTimerStop(){
        SendingTimer?.invalidate()
        SendingTimer = nil
    }
}

//struct ShareButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ShareButton()
//    }
//}

struct ShareButtonUI: View {
    @ObservedObject var UDPC : UDPController
    var body: some View {
        ZStack {
            if UDPC.IsSending{
                Circle()
                    .frame(width: 70.0, height: 70.0)
                    .foregroundColor(.blue)
            }else{
                Circle()
                    .frame(width: 70.0, height: 70.0)
                    .foregroundColor(.gray)
                    .opacity(0.7)
            }
            
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(Color("White-D"))
                .font(Font.title.weight(.bold))
        }
    }
}
