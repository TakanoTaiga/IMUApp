//
//  NetworkInfomationViews.swift
//  IMUApp
//
//  Created by 高野大河 on 2021/08/13.
//

import SwiftUI

struct NetworkInfomationViews: View {
    @ObservedObject var UDPC : UDPController
    var body: some View {
        VStack{
            StatusView(UDPC: UDPC)
            IPAddressTextField(UDPC: UDPC)
            PortTextField(UDPC: UDPC)
            Spacer()
        }
    }
}

//struct NetworkInfomationViews_Previews: PreviewProvider {
//    static var previews: some View {
//        NetworkInfomationViews()
//    }
//}

struct IPAddressTextField: View {
    @ObservedObject var UDPC : UDPController
    //@ObservedObject var UDPC = UDPController()
    var body: some View {
        TextField("0.0.0.0",text: $UDPC.IP )
            .font(.title.weight(.semibold))
            .keyboardType(.decimalPad)
    }
}

struct PortTextField: View {
    @ObservedObject var UDPC : UDPController
    //@ObservedObject var UDPC = UDPController()
    var body: some View {
        TextField("0000",text: $UDPC.PORT)
            .font(.title.weight(.semibold))
            .keyboardType(.decimalPad)
    }
}

struct StatusView : View {
    @ObservedObject var UDPC : UDPController
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    @State var SendingText : String = "SENDING"
    @State var SuspendedText : String = "SUSPENDED"
    var body: some View{
        Button(action:{
            if SendingText == "SENDING"{
                SendingText = "Version " + version + " (Build " + build + ")"
                SuspendedText = "Version " + version + " (Build " + build + ")"
            }else{
                SendingText = "SENDING"
                SuspendedText = "SUSPENDED"
            }
        }){
            HStack{
                if UDPC.IsSending{
                    Text(SendingText)
                        .font(.headline)
                        .foregroundColor(Color.gray)
                }else{
                    Text(SuspendedText)
                        .font(.headline)
                        .foregroundColor(Color.gray)
                }
                
                Spacer()
            }
        }
    }
}
