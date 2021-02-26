//
//  String+extension.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 25/02/2021.
//

import Foundation


extension String{
    
    func strikeThrough()->NSAttributedString{
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: self)
       
        attrString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attrString.length))
        return attrString
    }
    func removeAttributedText()-> NSAttributedString{
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: self)
       
        attrString.setAttributes([:], range: NSRange(location: 0, length: attrString.length))
        return attrString
    }
    
}
