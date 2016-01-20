//
//  TodayViewController.swift
//  VisExtension
//
//  Created by Lee Brimelow on 12/30/15.
//  Copyright © 2015 Lee Brimelow. All rights reserved.
//

import UIKit
import NotificationCenter

extension NSAttributedString {
    
    static func attributedStringFromHtmlString(htmlString: String) -> NSAttributedString {
        do {
            let result = try NSAttributedString(data:htmlString.dataUsingEncoding(NSUTF8StringEncoding)!,
                options:[
                    NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                    NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding,
                ],
                documentAttributes:nil)
            return result
        } catch let error as NSError {
            print(error)
            return NSAttributedString();
        }
    }
}

class TodayViewController: UIViewController, NCWidgetProviding, NSXMLParserDelegate {
    
    let parser = NSXMLParser(contentsOfURL: NSURL(string: "http://www.crossfitvisperformance.com/wod/feed")!)!
    var shouldGrabCharacters = false
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {

        parser.parse()
        completionHandler(NCUpdateResult.NewData)
    }
    
    // NSXMLParser
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if elementName == "content:encoded" {
            shouldGrabCharacters = true
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if shouldGrabCharacters {
            let cleanStr = string.stringByReplacingOccurrencesOfString("WOD<br />&nbsp;<br />", withString: "")
            label.attributedText = NSAttributedString.attributedStringFromHtmlString(cleanStr)
            label.font = UIFont(name: "System", size: 14)
            label.textColor = UIColor.whiteColor()
            
            preferredContentSize = CGSize(width: 0, height: (label.attributedText?.size().height)!)
            
            parser.abortParsing()
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }
    
    func parserDidStartDocument(parser: NSXMLParser) {
        print("Started")
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        print("Ended")
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print(parseError)
    }
    
}
