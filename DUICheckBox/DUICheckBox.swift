//
//  DUICheckBox.swift
//  DUICheckBox
//
//  Created by Dhana S on 7/28/17.
//  Copyright © 2017 Dhana S. All rights reserved.
//

import Foundation
import UIKit


protocol CheckBoxDelegate {
    func checked(checked : Bool)
}

enum CheckBoxStyle : Int{
    case round = 0
    case square = 1
}

@IBDesignable
class DUICheckBox: UIControl {
    var type : CheckBoxStyle = .round
    var tickerLayer : CAShapeLayer!
    var path : CGPath!
    var checkedDelegate : CheckBoxDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tickerLayer = CAShapeLayer()
        let gr = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        addGestureRecognizer(gr)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tickerLayer = CAShapeLayer(coder: aDecoder)
        let gr = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        addGestureRecognizer(gr)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setUp()
    }
    
    func viewTapped(_ sender : Any){
        isSelected = !isSelected
    }
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                checked()
            }else{
                unChecked()
            }
        }
    }
    
    func setUp(){
        let bPath = UIBezierPath()
        print(self.frame)
        print(self.layer.frame)
//        bPath.move(to: CGPoint(x: 4.0, y: 10.0))
//        bPath.addLine(to: CGPoint(x: 8.0, y: 15.0))
//        bPath.addLine(to: CGPoint(x: 16.0, y: 5.0))
        bPath.move(to: CGPoint(x: self.layer.frame.size.width / 5.0, y: self.layer.frame.size.height/2.0))
        bPath.addLine(to: CGPoint(x: self.layer.frame.size.width * 2.0 / 5.0, y: (self.layer.frame.size.height * (3/4))))
        bPath.addLine(to: CGPoint(x: self.layer.frame.size.width * 4.0 / 5.0, y: (self.layer.frame.size.height * (1/4))))
        tickerLayer.path = bPath.cgPath
        tickerLayer.fillColor = UIColor.clear.cgColor
        tickerLayer.lineWidth = self.layer.frame.size.width < self.layer.frame.size.height ? self.layer.frame.size.width/10.0 : self.layer.frame.size.height/10.0
        tickerLayer.lineCap = "round"
        tickerLayer.lineJoin = "round"
        tickerLayer.strokeColor = UIColor.white.cgColor
        if type == .square{
            self.layer.cornerRadius = self.layer.frame.size.width < self.layer.frame.size.height ? self.layer.frame.size.width/10.0 : self.layer.frame.size.height/10.0
        }else{
            self.layer.cornerRadius = self.layer.frame.size.width < self.layer.frame.size.height ? self.layer.frame.size.width/2.0 : self.layer.frame.size.height/2.0
        }
        self.layer.borderWidth = 1.0
        if let _ = self.backgroundColor{
            
            var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
            UIColor.red.getRed(&r, green: &g, blue: &b, alpha: &a)
            
        self.layer.borderColor = UIColor(red: (1 - r), green: (1 - g), blue: (1 - b), alpha: a).withAlphaComponent(0.8).cgColor
            
        }
        
        isSelected = false
        self.layer.addSublayer(tickerLayer)
    }
    
    
    
    
    func isChecked() -> Bool{
        return isSelected
    }
    
    func unChecked(){
        tickerLayer.fillColor = UIColor.clear.cgColor
        tickerLayer.strokeColor = UIColor.clear.cgColor
        checkedDelegate?.checked(checked: isSelected)
    }
    
    func checked(){
        tickerLayer.fillColor = UIColor.clear.cgColor
        tickerLayer.strokeColor = UIColor.white.cgColor
        checkedDelegate?.checked(checked: isSelected)
    }
}
