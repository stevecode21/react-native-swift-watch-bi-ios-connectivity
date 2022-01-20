//
//  Watcher.swift
//  CityRowPocConnection
//
//  Created by Stiven Suarez on 19/01/22.
//  Copyright © 2022 Facebook. All rights reserved.
//

import Foundation
import WatchConnectivity
@objc(WatchToIos)

class RNWatcher : NSObject, WCSessionDelegate {
    //var bridge: RCTBridge!
    
    override init() {
        super.init()
        createWCSession()
    }
    

    
    @objc func sendMessageData(_ data: NSData) -> Void {
          self._sendMessageData(data: data)
    }
    
    @objc func sendMessage(_ data: NSDictionary) -> Void {
          self._sendMessage(data: data)
    }
    
    // Swift Functions


    /** ------------ EVENTS - START ------------- **/
    func _sendMessageData(data: NSData) {
        print("Data _sendMessageData \(data)")
        WCSession.default.sendMessageData(data as Data, replyHandler: nil, errorHandler: nil)
        print("sent!")
        
    }

    
    func _sendMessage(data: NSDictionary) {
        print("Data _sendMessage \(data)")
        WCSession.default.sendMessage(data as! [String: Any], replyHandler: nil)
    }
    
    /** ------------ EVENTS - END ------------- **/
    
    
    // Session
    
    func createWCSession() {
        if WCSession.isSupported() {
            print("iPhone supports WCSession")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("iPhone WC Session Activated")
        case .notActivated:
            print("iPhone WC Session not activated")
        case .inactive:
            print("iPhine WC Session inactive")
        default:
            print("Unrecognized event")
        }
    }
    
    /**
            
     */
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("Message \(message)")
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        print("Message data arrived \(messageData)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Section went inactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("Section deactivated")
    }
    
}

