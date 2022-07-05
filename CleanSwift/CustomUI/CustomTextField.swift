//
//  CustomTextField.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

class CustomTextField : UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        leftViewMode = .always
        let label = UILabel()
        label.text = "+7 ("
        label.textColor = .white
        label.textAlignment = .right
        leftView = label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: 40, height: bounds.height)
    }
}
