//
//  steuerliBrain.swift
//  Steuerli
//
//  Created by Christopher Chandler on 10.02.22.
//

import Foundation


struct steuerliBrain {
    /**
     
     Hello world 
     
     */
    
    
    // global functional vars
    var grossNet: Int?
    var userAmount: String!
    var userPercent: String?
    var fieldsPopulate: Bool?

    
    func grossNetChoice () -> String {
        
        // Returns the user's tax choice
        
        if grossNet == 0 {
            return "Gross"
        }
        else if grossNet == 1 {
            return "Net"
        }
        
         return ""
    }
    
    
    func grossNetCalculation () -> Dictionary<String, Any> {
        
        let taxAmount = Float(userAmount ?? "0") ?? 0
        
        
        let taxPercent = Float(userPercent ?? "0") ?? 0
 
        let taxResult = taxAmount * (taxPercent / 100)
        let totalResult = taxResult + taxAmount
        
        
        let cacluatedResults = [
            "VAT": String (taxResult),
            "Total":String(totalResult)
            ]
        
        return cacluatedResults
    
    }
    
    
    func netGrossCalculation () -> Dictionary <String, Any> {
        /**
        This takes in users input and returns the taxable amount
         according to the percent specified by the user.
        */
        
        // user input
        let taxAmount = Float(userAmount ?? "0") ?? 0
        let taxPercent = Float(userPercent ?? "0") ?? 0
        
        // results
        let taxResult = taxAmount / (taxPercent + 100) * 100
        let totalResult = taxAmount - taxResult
         
        // results
        let cacluatedResults = [
            "VAT": String (totalResult),
            "Total":String(taxResult)
            ]
        
        return cacluatedResults
    
    }
    
}
