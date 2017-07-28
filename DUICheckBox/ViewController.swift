//
//  ViewController.swift
//  DUICheckBox
//
//  Created by Dhana S on 7/28/17.
//  Copyright © 2017 Dhana S. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CheckBoxDelegate {

    @IBOutlet weak var checkedLabel: UILabel!
    @IBOutlet weak var checkBox: DUICheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkBox.checkedDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checked(checked: Bool) {
        if checked{
            checkedLabel.isHidden = false
        }else{
            checkedLabel.isHidden = true
        }
    }

}

