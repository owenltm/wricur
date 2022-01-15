//
//  Helper.swift
//  wricur
//
//  Created by user on 15/01/22.
//  Copyright © 2022 ltm. All rights reserved.
//

import Foundation

class Helper {
    static func haveAlpha(str: String)->Bool{
        for c in str {
            if (c >= "a" && c <= "z") || (c >= "A" && c <= "Z") {
                return true
            }
        }
        
        return false
    }
    
    static func haveDigit(str:String)->Bool{
        for c in str {
            if c >= "0" && c <= "9" {
                return true
            }
        }
        
        return false
    }
    
    static func getDateDay(date: Date)->Int{
        var format = DateFormatter()
        format.dateFormat = "dd"
        
        return Int(format.string(from: date)) ?? 0
    }
    
    static func getDateMonth(date: Date)->Int{
        var format = DateFormatter()
        format.dateFormat = "MM"
        
        return Int(format.string(from: date)) ?? 0
    }
    
    static func getDateYear(date: Date)->Int{
        var format = DateFormatter()
        format.dateFormat = "yyyy"
        
        return Int(format.string(from: date)) ?? 0
    }
    
    static func getYearDiff(date1: Date, date2: Date)->Int {
        //date1 older than date2
        
        let day1 = getDateDay(date: date1)
        let month1 = getDateMonth(date: date1)
        let year1 = getDateYear(date: date1)
        
        let day2 = getDateYear(date: date2)
        let month2 = getDateMonth(date: date2)
        let year2 = getDateYear(date: date2)
        
        var diff = year2 - year1
        
        if month2 < month1 {
            diff -= 1
        } else if month2 == month1 && day2 <= day1 {
            diff -= 1
        }
        
        return diff
    }
}
