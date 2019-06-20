//
//  ViewController.swift
//  keiCalc
//
//  Created by WSR on 6/19/19.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var labelRES: UILabel!
    
    @IBOutlet weak var outletPM: UIButton!
    @IBOutlet weak var outletAC: UIButton!
    @IBOutlet weak var outletPC: UIButton!
    @IBOutlet weak var outletDIV: UIButton!
    @IBOutlet weak var outlet7: UIButton!
    @IBOutlet weak var outlet8: UIButton!
    @IBOutlet weak var outlet9: UIButton!
    @IBOutlet weak var outlet4: UIButton!
    @IBOutlet weak var outlet5: UIButton!
    @IBOutlet weak var outlet6: UIButton!
    @IBOutlet weak var outlet1: UIButton!
    @IBOutlet weak var outlet2: UIButton!
    @IBOutlet weak var outlet3: UIButton!
    @IBOutlet weak var outletMUL: UIButton!
    @IBOutlet weak var outletSUB: UIButton!
    @IBOutlet weak var outletSUM: UIButton!
    @IBOutlet weak var outletRES: UIButton!
    @IBOutlet weak var outlet0: UIButton!
    @IBOutlet weak var outletP: UIButton!
    
    private func setBorder(btn: UIButton){
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBorder(btn: outletPM)
        setBorder(btn: outletAC)
        setBorder(btn: outletPC)
        setBorder(btn: outletDIV)
        setBorder(btn: outlet7)
        setBorder(btn: outlet8)
        setBorder(btn: outlet9)
        setBorder(btn: outlet4)
        setBorder(btn: outlet5)
        setBorder(btn: outlet6)
        setBorder(btn: outlet1)
        setBorder(btn: outlet2)
        setBorder(btn: outlet3)
        setBorder(btn: outlet0)
        setBorder(btn: outletP)
        setBorder(btn: outletRES)
        setBorder(btn: outletMUL)
        setBorder(btn: outletSUB)
        setBorder(btn: outletRES)
        
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
//            } else {
//                calc(dbl: (mem ?? 0) * text / 100)
            }
        case 103:   // div
            // если не ноль
//            if text != 0 {
//                if mem != nil {
//                    //в памяти есть предыдущее число - вычисляем результат
//                    let res = (mem ?? 0) / text
//                    calc(dbl: res)
//                } else {
//                    mem = text
//                    labelRES.text = "0"
//                }
//                lastOperation = "/"
//            }
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
//            } else {
//                calc(dbl: (mem ?? 0) * text)
            }
        case 105:   // sub
            if mem == nil {
                mem = text
                labelRES.text = "0"
                lastOperation = "-"
//            } else {
//                calc(dbl: (mem ?? 0) - text)
            }
        case 106:   // sum
            if mem == nil {
                mem = text
                labelRES.text = "0"
                lastOperation = "+"
//            } else {
//                calc(dbl: (mem ?? 0) + text)
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
                    default: break
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

