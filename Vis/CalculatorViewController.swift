//
//  CalculatorViewController.swift
//  Vis
//
//  Created by Lee Brimelow on 1/19/16.
//  Copyright © 2016 Lee Brimelow. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet weak var textInput: TextField!
    @IBOutlet weak var repNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Enter the Value You Know"
        textInput.inputAccessoryView = toolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneClicked(sender: AnyObject) {
        textInput.resignFirstResponder()
    }

    @IBAction func stepperClicked(sender: UIStepper) {
        print(String(format: "%f", arguments: [sender.value]))
        repNumber.text = String(Int(sender.value))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
