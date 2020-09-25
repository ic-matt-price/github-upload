//
//  CalcActionButton.swift
//  RealCalculator
//
//  Created by Matt Price on 9/4/20.
//  Copyright © 2020 Matt Price. All rights reserved.
//

import UIKit

@IBDesignable
class CalcActionButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    func customizeView() {
        layer.cornerRadius = 3.0
        clipsToBounds = true
        //layer.borderWidth = 10.0
        //layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

}
