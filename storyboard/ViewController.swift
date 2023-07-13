//
//  ViewController.swift
//  storyboard
//
//  Created by 林秀謙 on 2023/7/13.
//

import UIKit

class ViewController: UIViewController {
    var labOperator = ""
    var cn = ""
    var pn = ""
    @IBAction func percentClick(_ sender: UIButton) {
        if let nNumber = labelNumber.text {
            let nFloat = (Float(nNumber) ?? 0) * 0.01
            labelNumber.text = String(format: "%g", nFloat)
            
        }
    }
    
    @IBAction func plusMinusClick(_ sender: UIButton) {
        if labelNumber.text == "" {
            return
        }
        let number = labelNumber.text ?? ""
        if number.prefix(1) != "-" {
            labelNumber.text = "-" + number
        } else {
            let worldIndex = number.index(number.startIndex, offsetBy: 1)
            labelNumber.text = String(number.suffix(from: worldIndex))
        }
    }
    
    @IBAction func ACClick(_ sender: UIButton) {
        labelNumber.text = ""
        labOperator = ""
        preNumber.text = ""
    }
    
    @IBAction func divisionClick(_ sender: UIButton) {
        if labOperator == "" {
            preNumber.text = labelNumber.text ?? ""
            labelNumber.text = ""
        } 
        labOperator = "/"
    }
    
    @IBAction func multipleClick(_ sender: UIButton) {
        if labOperator == ""{
            preNumber.text = labelNumber.text ?? ""
            labelNumber.text = ""
        }
        labOperator = "*"
    }
    
    @IBAction func minusClick(_ sender: UIButton) {
        if labOperator == "" {
            preNumber.text = labelNumber.text ?? ""
            labelNumber.text = ""
        }
        labOperator = "-"
    }
    
    @IBAction func plusClick(_ sender: UIButton) {
        if labOperator == "" {
            preNumber.text = labelNumber.text ?? ""
            labelNumber.text = ""
        }
        labOperator = "+"
    }
    
    @IBAction func equalsClick(_ sender: UIButton) {
        if labelNumber.text == "" {
            return
        }
        if labOperator == "+" {
            if let ntext = labelNumber.text {
                let cn = Int(ntext)
                if let ptext = preNumber.text {
                    let pn = Int(ptext)
                    let tn = (pn ?? 0) + (cn ?? 0)
                    labelNumber.text = String(tn)
                    preNumber.text = ""
                    labOperator = ""
                }
            }
        }
        
        if labOperator == "-" {
            if let ntext = labelNumber.text {
                let cn = Int(ntext)
                if let ptext = preNumber.text {
                    let pn = Int(ptext)
                    let tn = (pn ?? 0) - (cn ?? 0)
                    labelNumber.text = String(tn)
                    preNumber.text = ""
                    labOperator = ""
                }
            }
        }
        
        if labOperator == "*" {
            if let ntext = labelNumber.text {
                let cn = Int(ntext)
                if let ptext = preNumber.text {
                    let pn = Int(ptext)
                    let tn = (pn ?? 0) * (cn ?? 0)
                    labelNumber.text = String(tn)
                    preNumber.text = ""
                    labOperator = ""
                }
            }
        }
        if labOperator == "/" {
            if let ntext = labelNumber.text {
                let cn = Int(ntext)
                if let ptext = preNumber.text {
                    let pn = Int(ptext)
                    let tn = (pn ?? 0) / (cn ?? 0)
                    labelNumber.text = String(tn)
                    preNumber.text = ""
                    labOperator = ""
                }
            }
        }
    }
    
    @IBAction func digitClick(_ sender: UIButton) {
        let title = sender.titleLabel?.text ?? ""
        labelNumber.text = (labelNumber?.text ?? "") + title
    }
    
    @IBAction func dotClick(_ sender: UIButton) {
        if labelNumber.text == "" || labelNumber.text?.ranges(of: ".").count == 0 {
            labelNumber.text = (labelNumber?.text ?? "") + "."
        }
            
    }
    
    @IBOutlet weak var preNumber: UILabel!
    @IBOutlet weak var labelNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelNumber.text = ""
        preNumber.text = ""
        // Do any additional setup after loading the view.
    }


}

