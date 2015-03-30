//
//  Date.swift
//  TaskIt
//
//  Created by PHILIPPE PESCATORE 2 on 27/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import Foundation

class Date {
    class func de (#annee:Int, mois:Int, jour:Int) -> NSDate {
        
        var composants = NSDateComponents()
        composants.month = mois
        composants.year = annee
        composants.day = jour
        
        var calendrierGregorien = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        
        var date = calendrierGregorien?.dateFromComponents(composants)
                
    return date!
    }
    
    class func versChaine (#date:NSDate) -> String {
        let transformateurDeDateEnChaine = NSDateFormatter()
        transformateurDeDateEnChaine.dateFormat = "yyyy-MM-dd"
        let chaineDate = transformateurDeDateEnChaine.stringFromDate(date)
        
        return chaineDate
    }
}