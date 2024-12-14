//
//  ResultsViewController.swift
//  Steuerli
//
//  Created by Christopher Chandler on 10.02.22.
//

import UIKit


class ResultsViewController: UIViewController {
    
    //
    @IBOutlet weak var userTaxTypeChoice: UILabel!
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var calculatedVatTax: UITextField!

    // UI Labels fields
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var vatLabel: UILabel!
    
    // Variables to be passed from main controller
    var taxChoice: String?
    var calculatedVat: String?
    var calculatedTotalAmount: String?
    
    // UI Buttons
    @IBOutlet weak var recalculateButton: UIButton!
    
    override func viewDidLoad() {

        super.viewDidLoad()

        userTaxTypeChoice.text = taxChoice?.localized()
        
        // Results
        calculatedVatTax.text = calculatedVat
        totalAmount.text = calculatedTotalAmount
        
        // Result label
        vatLabel.text = "VAT".localized()
        totalLabel.text = "Total amount".localized()
        resultsLabel.text = "Results".localized()
        
        // Recalculate
        recalculateButton.setTitle("RECALCULATE".localized(), for: .normal)
    }
    
 
    @IBAction func recalculate(_ sender: UIButton) {
        sender.setTitle("RECALCULATE".localized(), for: .selected)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
