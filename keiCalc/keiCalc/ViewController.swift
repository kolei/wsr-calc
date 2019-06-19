//
//  ViewController.swift
//  keiCalc
//
//  Created by WSR on 6/19/19.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    func setBorder(outlet: UIButton){
        outlet.layer.borderWidth=1
        outlet.layer.borderColor = UIColor.darkGray.cgColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBorder( outletPM )
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
        
        outletPM.layer.borderWidth=1
        outletPM.layer.borderColor = UIColor.darkGray.cgColor
        
        outletPM.layer.borderWidth=1
        outletPM.layer.borderColor = UIColor.darkGray.cgColor
        
        outletPM.layer.borderWidth=1
        outletPM.layer.borderColor = UIColor.darkGray.cgColor
        
        outletPM.layer.borderWidth=1
        outletPM.layer.borderColor = UIColor.darkGray.cgColor
        
        outletPM.layer.borderWidth=1
        outletPM.layer.borderColor = UIColor.darkGray.cgColor
        
        outletPM.layer.borderWidth=1
        outletPM.layer.borderColor = UIColor.darkGray.cgColor
        
    }


    @IBAction func btnPM(_ sender: Any) {
    }
    @IBAction func btnResult(_ sender: Any) {
    }
    @IBAction func btnPoint(_ sender: Any) {
    }
    @IBAction func btn0(_ sender: Any) {
    }
    
}

