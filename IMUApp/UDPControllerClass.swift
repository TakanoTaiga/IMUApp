//
//  UDPControllerClass.swift
//  IMUApp
//
//  Created by 高野大河 on 2021/08/14.
//

import Foundation
import Network

class UDPController : ObservableObject {
    private var CONNECTION : NWConnection?
    @Published var IP : String{
        didSet{
            UserDefaults.standard.set(IP , forKey: "UserIP")
        }
    }
    @Published var PORT : String {
        didSet{
            UserDefaults.standard.set(PORT , forKey: "UserPort")
        }
    }
    @Published var IsSending : Bool = false
    @Published var sendedValue : String = ""
    let queue = DispatchQueue(label: "timer", qos: .userInteractive)
    func send(_ payload: Data){
        if(self.IP != "" && self.PORT != "" ){
            self.CONNECTION = NWConnection(host: .init(self.IP), port: .init(integerLiteral: UInt16(self.PORT)! ), using: .udp)
            self.CONNECTION!.start(queue: queue)
            
            self.CONNECTION!.send(content: payload, completion: .contentProcessed({ sendError in
                
            }))
            Thread.sleep(forTimeInterval: 0.005)
            self.CONNECTION?.cancel()
        }
        else{
            self.IsSending = false
        }
    }
    
    init(){
        IP = UserDefaults.standard.string(forKey: "UserIP") ?? ""
        PORT = UserDefaults.standard.string(forKey: "UserPort") ?? ""
    }
}
