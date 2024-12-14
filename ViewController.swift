//
//  ViewController.swift
//  Steuerli
//
//  Created by Christopher Chandler on 10.02.22.
//

import UIKit
import WidgetKit

class ViewController: UIViewController, UITextFieldDelegate {

    // UI Textfields
    @IBOutlet weak var userAmount: UITextField!
    @IBOutlet weak var userPercent: UITextField!
    
    //UI Switch
    @IBOutlet weak var grossNet: UISegmentedControl!
    
    // UI Labels
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    // Tax controler
    var steurliBrain = steuerliBrain()
    
    // UIbuttons
    @IBOutlet weak var caclulateButton: UIButton!
    
    override func viewDidLoad() {
        
        //Initial view properties
        WidgetCenter.shared.reloadAllTimelines()
        
        super.viewDidLoad()
 
        // Initial strings
        userAmount.placeholder = "Enter an amount".localized()
        userPercent.placeholder = "Enter the percent".localized()
        
        grossNet.setTitle("Gross".localized(), forSegmentAt: 0)
        grossNet.setTitle("Net".localized(), forSegmentAt: 1)
        
        amountLabel.text = "Amount".localized()
        percentLabel.text = "%".localized()
        
        
        // delegates for the UITextFields via the UITextfield protocols
        userAmount.delegate = self
        userPercent.delegate = self
        
        caclulateButton.setTitle("CALCULATE".localized(), for: .normal)
        
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userAmount.endEditing(true)
        userPercent.endEditing(true)
        
        steurliBrain.userAmount = userAmount.text!
        steurliBrain.userPercent = userPercent.text!
                
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        // Dismiss the keyboard only once the user has entered a value.
        
        if textField.text != "" {
            return true
        }
        else {
            return false
        }
        
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        
        // user gross net choice
        steurliBrain.grossNet = grossNet.selectedSegmentIndex
        
        // Opening text results screen
        self.performSegue(withIdentifier: "gotoResults", sender: self)
    
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.taxChoice = steurliBrain.grossNetChoice()
        
           let taxTypeResults = [
                "Gross":steurliBrain.grossNetCalculation(),
                "Net":steurliBrain.netGrossCalculation()
            ]
            
            let results = taxTypeResults[steurliBrain.grossNetChoice()]!
            
            destinationVC.calculatedVat = results["VAT"] as? String
            destinationVC.calculatedTotalAmount = results["Total"] as? String
            
            
        }
    
    }
    
}

extension String {
    /**
     This extends the String class so that it can be automatically attached
     to the desired string and retrieve its respective localized version from the respective strings file.
     */
    func localized() -> String {
        return NSLocalizedString(
        self,
        tableName: "Localizable",
        bundle: .  main,
        value: self,
        comment: self
            
        )
        
    }
}
