//
//  CustomTextField.swift
//  CleanSwift
//
//  Created by Natali Malich on 04.07.2022.
//

import UIKit

    // MARK: - UIView
extension UIView {
    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }

    public func activateAnchors() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

    // MARK: - String
extension String {
    func replace(_ dictionary: [String: String]) -> String{
        var result = String()
        var i = -1
        for (of , with): (String, String) in dictionary{
            i += 1
            if i<1{
                result = self.replacingOccurrences(of: of, with: with)
            }else{
                result = result.replacingOccurrences(of: of, with: with)
            }
        }
        return result
    }
}
