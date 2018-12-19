//
//  XMLParser.swift
//  Responder
//
//  Created by Jeff Chimney on 2018-12-19.
//  Copyright © 2018 Jeff Chimney. All rights reserved.
//

import Foundation

class RegisterResult {
    var result = ""
    var errorMessage = ""
    var hallLatitude = ""
    var hallLongitude = ""
}

class XMLParserHelper: NSObject, XMLParserDelegate {

    var registerResult: RegisterResult!
    var foundCharacters = ""
    var xmlData: Data!
    var currentElementName = ""
    
    init(xmlData: Data) {
        super.init()
        registerResult = RegisterResult()
        foundCharacters = ""
        self.xmlData = xmlData
    }
    
    func runParser() {
        let parser = XMLParser(data: xmlData)
        parser.delegate = self
        parser.parse()
    }

    private func parser(parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElementName = elementName
    }
    
    private func parser(parser: XMLParser, foundCharacters string: String) {
        self.foundCharacters += string;
    }
    
    private func parser(parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "Result" {
            registerResult.result = self.foundCharacters;
        }

        if elementName == "ErrorMessage" {
            registerResult.errorMessage = self.foundCharacters;
        }

        if elementName == "HallLatitude" {
            registerResult.hallLatitude = self.foundCharacters;
        }
        
        if elementName == "HallLongitude" {
            registerResult.hallLongitude = self.foundCharacters;
        }
        self.foundCharacters = ""
    }
    
    private func parserDidEndDocument(parser: XMLParser) {
        print(registerResult.result)
        print(registerResult.errorMessage)
        print(registerResult.hallLongitude)
        print(registerResult.hallLatitude)
    }
    
}
