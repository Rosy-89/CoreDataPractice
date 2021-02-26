//
//  Date+Extensions.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 23/02/2021.
//

import Foundation

extension Date{
    
    func toString(format: String)->String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
