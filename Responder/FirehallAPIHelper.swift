//
//  FirehallAPIHelper.swift
//  Responder
//
//  Created by Jeff Chimney on 2018-12-19.
//  Copyright © 2018 Jeff Chimney. All rights reserved.
//

import Foundation
import UIKit

let firehallEndpoint = "https://firehall.net/api/Respond.asmx?wsdl"
let VERSION = 1
let SUB_VERSION = 0

class FirehallAPIHelper {
    
    static func register() {
        let firehallId = UserDefaultsHelper.get(string: "firehallId")
        let userId = UserDefaultsHelper.get(string: "userId")
        
        let soapMessage = """
        <?xml version="1.0" encoding="utf-8"?>
        <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
            <Register xmlns="http://tempuri.org/">
            <iVersion>\(VERSION)</iVersion>
            <iSubVersion>\(SUB_VERSION)</iSubVersion>
            <sFireHallRespondID>\(firehallId)</sFireHallRespondID>
            <sStaffRespondID>\(userId)</sStaffRespondID>
            <sDeviceIdentifier>\(UIDevice.current.identifierForVendor!.uuidString)</sDeviceIdentifier>
        </Register>
        </soap:Body>
        </soap:Envelope>
        """
        
        let url = URL(string: firehallEndpoint)
        
        let msgLength = soapMessage.characters.count
        
        var request = URLRequest(url: url!)
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue(String(msgLength), forHTTPHeaderField: "Content-Length")
        request.httpMethod = "POST"
        request.httpBody = soapMessage.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(dataString!)
            let parser = XMLParserHelper(xmlData: data!)
            parser.runParser()
        })
        task.resume()
    }
    
}
