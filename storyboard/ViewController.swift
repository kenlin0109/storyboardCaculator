//
//  ViewController.swift
//  storyboard
//
//  Created by 林秀謙 on 2023/7/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelCurrentNumber: UILabel!
    
    var strOperator = ""
    var strPreNumber = ""
    
    func afterOperatorClick() {
        if strOperator == "" {
            strPreNumber = labelCurrentNumber.text ?? ""
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
        strPreNumber = ""
    }
    
    
    @IBAction func ArthmeticClick(_ sender: UIButton) {
        afterOperatorClick()
        strOperator = sender.titleLabel?.text ?? ""
    }
    
    func Operate(_ strOperate: String, _ pn: Float, _ cn: Float) -> Float {
        var tn: Float = 0
        
        if strOperate == "+" {
            tn = pn + cn
        } else if strOperate == "-" {
            tn = pn - cn
        } else if (strOperate == "*") || (strOperate == "X") {
            tn = pn * cn
        } else if strOperate == "/" {
            tn = pn / cn
        }
        
        return tn
    }
    
    fileprivate func CaculatorOperate() {
        let ntext = labelCurrentNumber?.text ?? ""
        let cn = Float(ntext) ?? 0
        let ptext = strPreNumber
        let pn = Float(ptext) ?? 0
                
        let tn = Operate(strOperator, pn, cn)
                
        labelCurrentNumber.text = String(format:"%g", tn)
        strPreNumber = ""
        strOperator = ""
         
    }
    
    @IBAction func equalsClick(_ sender: UIButton) {
        if labelCurrentNumber.text == "" {
            return
        }
        CaculatorOperate()
    }
    
    @IBAction func digitClick(_ sender: UIButton) {
        let currentNumber = labelCurrentNumber?.text ?? ""
        let digit = sender.titleLabel?.text ?? ""
        
        if currentNumber == "0" {
            labelCurrentNumber.text = digit
        } else {
            labelCurrentNumber.text = currentNumber + digit
        }
        
    }
    
    @IBAction func dotClick(_ sender: UIButton) {
        if labelCurrentNumber.text == "" || labelCurrentNumber.text?.ranges(of: ".").count == 0 {
            labelCurrentNumber.text = (labelCurrentNumber?.text ?? "") + "."
        }
            
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        labelCurrentNumber.text = ""
        strPreNumber = ""
        // Do any additional setup after loading the view.
    }


}

