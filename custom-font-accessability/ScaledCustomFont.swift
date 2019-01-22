//
//  ScaledCustomFont.swift
//  POC Localization
//
//  Created by Nishanth B S on 21/01/19.
//  Copyright © 2019 Nuclei. All rights reserved.
//

import UIKit


/// Get the Scaled version of your UIFont.
///
/// - Parameters:
///   - name: Name of the UIFont whose scaled version you wish to obtain.
///   - textStyle: The text style for your font, i.e Body, Title etc...
/// - Returns: The scaled UIFont version with the given textStyle
func getScaledFont(forFont name: String, textStyle: UIFont.TextStyle) -> UIFont {
    
    let userFont =  UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
    let pointSize = userFont.pointSize
    guard let customFont = UIFont(name: name, size: pointSize) else {
        fatalError("""
            Failed to load the "\(name)" font.
            Make sure the font file is included in the project and the font name is spelled correctly.
            """
        )
    }
    
    /// A scale value based on the current device text size setting. With the device using the
    /// default Large setting, `scaler` will be `1.0`. Only used when `UIFontMetrics` is not
    /// available.
    ///
    var scaler: CGFloat {
        return UIFont.preferredFont(forTextStyle: .body).pointSize / 17.0
    }
    
    //UIFontMetrics available only >ios11.0
    if #available(iOS 11.0, *) {
        return UIFontMetrics.default.scaledFont(for: customFont)
    } else {
        // Fallback on earlier versions
        return customFont.withSize(scaler * customFont.pointSize)
    }
}
