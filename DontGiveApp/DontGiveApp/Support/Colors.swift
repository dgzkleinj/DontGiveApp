//
//  Colors.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 25/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import Foundation
import UIKit

enum Colors {
    static var blurple: UIColor {
        let hexColor = "4834d4"
        guard let color =  UIColor(fromHexCode: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    static var exodusFruit: UIColor {
        let hexColor = "686de0"
        guard let color =  UIColor(fromHexCode: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    
    static var greenlandGreen: UIColor {
        let hexColor = "22a6b3"
        guard let color =  UIColor(fromHexCode: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    static var middleBlue: UIColor {
        let hexColor = "#7ed6df"
        guard let color =  UIColor(fromHexCode: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    
    static var turbo: UIColor {
        let hexColor = "f9ca24"
        guard let color =  UIColor(fromHexCode: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    static var beekeper: UIColor {
        let hexColor = "f6e58d"
        guard let color =  UIColor(fromHexCode: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    
    static var black: UIColor {
        let hexColor = "000000"
        guard let color =  UIColor(fromHexCode: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    
}

extension UIColor {
    //credits: Ethan Strider and Renan Trevia.
    convenience init?(fromHexCode hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count != 6 {
            return nil
        } else {
            var rgbValue: UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: 1)
        }
    }
}
