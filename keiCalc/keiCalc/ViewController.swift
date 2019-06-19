//
//  ViewController.swift
//  keiCalc
//
//  Created by WSR on 6/19/19.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mem: String = ""
    var lastOperation: Int = 0	

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outletPM.layer.borderWidth=1
        outletPM.layer.borderColor = UIColor.darkGray.cgColor
        
        outletAC.layer.borderWidth=1
        outletAC.layer.borderColor = UIColor.darkGray.cgColor
        
        outletPC.layer.borderWidth=1
        outletPC.layer.borderColor = UIColor.darkGray.cgColor
        
        outletDIV.layer.borderWidth=1
        outletDIV.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet7.layer.borderWidth=1
        outlet7.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet8.layer.borderWidth=1
        outlet8.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet9.layer.borderWidth=1
        outlet9.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet4.layer.borderWidth=1
        outlet4.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet5.layer.borderWidth=1
        outlet5.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet6.layer.borderWidth=1
        outlet6.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet1.layer.borderWidth=1
        outlet1.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet2.layer.borderWidth=1
        outlet2.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet3.layer.borderWidth=1
        outlet3.layer.borderColor = UIColor.darkGray.cgColor
        
        outlet0.layer.borderWidth=1
        outlet0.layer.borderColor = UIColor.darkGray.cgColor
        
        outletP.layer.borderWidth=1
        outletP.layer.borderColor = UIColor.darkGray.cgColor
        
        outletRES.layer.borderWidth=1
        outletRES.layer.borderColor = UIColor.darkGray.cgColor
        
        outletMUL.layer.borderWidth=1
        outletMUL.layer.borderColor = UIColor.darkGray.cgColor
        
        outletSUB.layer.borderWidth=1
        outletSUB.layer.borderColor = UIColor.darkGray.cgColor
        
        outletRES.layer.borderWidth=1
        outletRES.layer.borderColor = UIColor.darkGray.cgColor
        
   }

	private func calc(dbl: Double){
		mem = dbl
                labelRES.text = String(format: "%g", mem)
	}
    
    @IBAction func btnAction(_ sender: UIButton) {
        let tag = sender.tag
        
        switch tag {
        case 0:
            if labelRES.text != "0" {
                labelRES.text = (labelRES.text ?? "") + "0"
            }
        case 100:   //AC
            labelRES.text = "0"
        case 101:   // смена знака
            if labelRES.text[0] == "-" {
            	labelRES.text = labelRES.text.suffix(labelRES.text.count-1)
            } else {
		labelRES.text = "-"+labelRES.text
	    }
        case 102:   //%
            break
        case 103:   // div
		// если не ноль
		if labelRES.text!="0" {
			if mem != "" {
				//в памяти есть предыдущее число - вычисляем результат
				calc(mem.doubleValue / labelRES.text.doubleValue)
			} else {
				mem = labelRES.text
				labelRES.text = "0"
			}
		}
        case 104:   // mul
		if mem == "" {
			mem = labelRES.text
			labelRES.text = "0"
			lastOperation = 104
		} else {
	            calc(mem.doubleValue * labelRES.text.doubleValue)
		}
        case 105:   // sub
		if mem == "" {
			mem = labelRES.text
			labelRES.text = "0"
			lastOperation = 105
		} else {
	            calc(mem.doubleValue - labelRES.text.doubleValue)
		}
        case 106:   // sum
		if mem == "" {
			mem = labelRES.text
			labelRES.text = "0"
			lastOperation = 106
		} else {
	            calc(mem.doubleValue + labelRES.text.doubleValue)
		}
        case 107:   // =
		if mem != "" {
		        switch tag {
			case 106: calc(mem.doubleValue + labelRES.text.doubleValue)
			default: break
			}
		}
        case 108:   // .
            break
        default:
            if tag<100 {
                if labelRES.text == "0" {
                    labelRES.text = String(tag)
                } else {
                    labelRES.text = (labelRES.text ?? "") + String(tag)
                }
            }
            break
        }
        
        
    }
    
}

