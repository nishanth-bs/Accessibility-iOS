//
//  UILabelExtension.swift
//  custom-font-accessability
//
//  Created by Nishanth B S on 22/01/19.
//  Copyright © 2019 Nishanth B S. All rights reserved.
//

import UIKit

enum DynamicTypingState{
    case on
    case off
}

struct DynamicTypingAssociatedKeys {
    static var dynamicStateKey: UInt8 = 0
    
}

extension UILabel{
    
    private(set) var dynamicTypingState: DynamicTypingState {
        get {
            guard let value = objc_getAssociatedObject(self, &DynamicTypingAssociatedKeys.dynamicStateKey) as? DynamicTypingState else {
                return .off
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &DynamicTypingAssociatedKeys.dynamicStateKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    open override func awakeFromNib() {
        super.awakeFromNib()
        if self.isDynamic{
            self.font = getScaledFont(forFont: "ShadowsIntoLight", textStyle: .title1)
        }
    }
    
    @IBInspectable
    var isDynamic: Bool {
        get {
            if (self.dynamicTypingState == DynamicTypingState.on) {
                return true
            }
            else {
                return false
            }
        }
        set{
            if (newValue == true) {
                self.dynamicTypingState = DynamicTypingState.on
            }
            else {
                self.dynamicTypingState = DynamicTypingState.off
            }
        }
    }
}

