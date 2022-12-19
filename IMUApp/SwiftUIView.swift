//
//  SwiftUIView.swift
//  IMUApp
//
//  Created by 高野大河 on 2021/11/15.
//

import SwiftUI

struct SwiftUIView: View {
    @State var isPush = true
    var body: some View {
        Button(action: {
            isPush.toggle()
        }, label: {
            Text("Hello")
        })
            .foregroundColor(isPush ? .black : .blue)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
