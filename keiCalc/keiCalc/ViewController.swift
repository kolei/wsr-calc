//
//  ViewController.swift
//  keiCalc
//
//  Created by WSR on 6/19/19.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var outletCollection: [UIButton]!
    @IBOutlet weak var labelRES: UILabel!
    
    private func setBorder(btn: UIButton){
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // форматирую кнопки
        for outlet in outletCollection {
            outlet.layer.borderWidth = 1
            outlet.layer.borderColor = UIColor.darkGray.cgColor
        }
    }

    var mem: Float? = nil
    var lastOperation: String = ""
    var startTyping: Bool = false
    
	private func calc(dbl: Float){
		mem = dbl
        labelRES.text = String(format: "%g", dbl)
	}
    
    @IBAction func btnAction(_ sender: UIButton) {
        let tag = sender.tag
        
        var text = Float(labelRES.text ?? "") ?? 0
        
        switch tag {
        
        case 100:   //AC
            labelRES.text = "0"
            mem = nil
            lastOperation = ""
            startTyping = false
        case 101:   // смена знака
            if text>0.0 || text<0.0 {
                text = -text
                labelRES.text = String(format: "%g", text)
            }
        case 102:   //%
            if mem == nil {
                mem = text
                labelRES.text = "0"
                lastOperation = "%"
            }
        case 103:   // div
            if mem == nil {
                mem = text
                labelRES.text = "0"
                lastOperation = "/"
                
            }
        case 104:   // mul
            if mem == nil {
                mem = text
                labelRES.text = "0"
                lastOperation = "*"
            }
        case 105:   // sub
            if mem == nil {
                mem = text
                labelRES.text = "0"
                lastOperation = "-"
            }
        case 106:   // sum
            if mem == nil {
                mem = text
                labelRES.text = "0"
                lastOperation = "+"
            }
        case 107:   // =
            if mem != nil {
                switch lastOperation {
                    case "+":
                        calc(dbl: (mem ?? 0) + text)
                    case "-":
                        calc(dbl: (mem ?? 0) - text)
                    case "*":
                        calc(dbl: (mem ?? 0)  * text)
                    case "/":
                        if text != 0 {
                            calc(dbl: (mem ?? 0) / text)
                        }
                    case "%":
                        calc(dbl: (mem ?? 0) * text / 100)
                    default:
                        break
                }
            }
            lastOperation = ""
            startTyping = false
            mem = nil
		case 108:   // .
            if !(labelRES.text ?? "0").contains(".") {
               labelRES.text = (labelRES.text ?? "0") + "."
            }
        case 0:
            if !startTyping {
                labelRES.text = "0"
            } else if labelRES.text != "0" {
                labelRES.text = (labelRES.text ?? "") + "0"
            }
        default:
            if tag<100 {
                if labelRES.text == "0" || !startTyping {
                    labelRES.text = String(tag)
                } else {
                    labelRES.text = (labelRES.text ?? "") + String(tag)
                }
            }
            break
        }
        
        if tag != 107 {
            startTyping = true
        }
    }
    
}

