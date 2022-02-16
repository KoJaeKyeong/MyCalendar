//
//  Extension+UIColor.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/16.
//

import UIKit

extension UIColor {
    class var randomColor: UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
    }
}
