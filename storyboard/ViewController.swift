//
//  ViewController.swift
//  storyboard
//
//  Created by 林秀謙 on 2023/7/13.
//

import UIKit

class ViewController: UIViewController {
    var strOperator = ""
    
    func afterOperatorClick() {
        if strOperator == "" {
            labelPreNumber.text = labelCurrentNumber.text ?? ""
            labelCurrentNumber.text = ""
        }
    }
    
    @IBAction func percentClick(_ sender: UIButton) {
        if let nNumber = labelCurrentNumber.text {
            let nFloat = (Float(nNumber) ?? 0) * 0.01
            labelCurrentNumber.text = String(format: "%g", nFloat)
            
        }
    }
    
    @IBAction func plusMinusClick(_ sender: UIButton) {
        if labelCurrentNumber.text == "" {
            return
        }
        let number = labelCurrentNumber.text ?? ""
        if number.prefix(1) != "-" {
            labelCurrentNumber.text = "-" + number
        } else {
            let worldIndex = number.index(number.startIndex, offsetBy: 1)
            labelCurrentNumber.text = String(number.suffix(from: worldIndex))
        }
    }
    
    @IBAction func ACClick(_ sender: UIButton) {
        labelCurrentNumber.text = ""
        strOperator = ""
        labelPreNumber.text = ""
    }
    
    
    @IBAction func ArthmeticClick(_ sender: UIButton) {
        afterOperatorClick()
        strOperator = sender.titleLabel?.text ?? ""
    }
    
    fileprivate func CaculatorOperate() {
        if let ntext = labelCurrentNumber.text {
            let cn = Float(ntext) ?? 0
            if let ptext = labelPreNumber.text {
                let pn = Float(ptext) ?? 0
                
                var tn: Float = 0
                if strOperator == "+" {
                    tn = pn + cn
                } else if strOperator == "-" {
                    tn = pn - cn
                } else if (strOperator == "*") || (strOperator == "X") {
                    tn = pn * cn
                } else if strOperator == "/" {
                    tn = pn / cn
                }
                
                labelCurrentNumber.text = String(format:"%g", tn)
                labelPreNumber.text = ""
                strOperator = ""
            }
        }
        
    }
    
    @IBAction func equalsClick(_ sender: UIButton) {
        if labelCurrentNumber.text == "" {
            return
        }
        CaculatorOperate()
    }
    
    @IBAction func digitClick(_ sender: UIButton) {
        let title = sender.titleLabel?.text ?? ""
        labelCurrentNumber.text = (labelCurrentNumber?.text ?? "") + title
    }
    
    @IBAction func dotClick(_ sender: UIButton) {
        if labelCurrentNumber.text == "" || labelCurrentNumber.text?.ranges(of: ".").count == 0 {
            labelCurrentNumber.text = (labelCurrentNumber?.text ?? "") + "."
        }
            
    }
    
    @IBOutlet weak var labelPreNumber: UILabel!
    @IBOutlet weak var labelCurrentNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCurrentNumber.text = ""
        labelPreNumber.text = ""
        // Do any additional setup after loading the view.
    }


}

