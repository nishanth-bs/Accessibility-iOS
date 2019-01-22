//
//  ViewController.swift
//  custom-font-accessability
//
//  Created by Nishanth B S on 21/01/19.
//  Copyright © 2019 Nishanth B S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(userChangedTextSize(notification:)), name:UIContentSizeCategory.didChangeNotification, object: nil)
        
    }
    
    @objc func userChangedTextSize(notification: Notification){
        //get all UILabels
        let labels = self.view.subviews.compactMap { $0 as? UILabel }
        for label in labels {
            if label.isDynamic{
                print(label.isDynamic)
                label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
                label.font = getScaledFont(forFont: "ShadowsIntoLight", textStyle: .title1)
            }
        }
    }
}





/*
class UIScalableTextField: UITextField {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.font = getScaledFont(forFont: "ShadowsIntoLight", textStyle: .title1)
    }
}
/*
 extension UIButton{
 func setup() {
 self.titleLabel?.font = getScaledFont(forFont: "ShadowsIntoLight", textStyle: .title1)
 //setObserver()
 }
 func setObserver(){
 NotificationCenter.default.addObserver(self, selector: #selector(userChangedTextSize(notification:)), name:UIContentSizeCategory.didChangeNotification, object: nil)
 }
 
 @objc func userChangedTextSize(notification: Notification){
 self.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
 self.titleLabel?.font = getScaledFont(forFont: "ShadowsIntoLight", textStyle: .title1)
 }
 }
 */


/*
@objc func userChangedTextSize(notification: Notification){
    textLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    textLabel.font = getScaledFont(forFont: "ShadowsIntoLight", textStyle: .title1)
    
    //        let preferredDescriptor = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    //        UILabel.appearance().customFont = UIFont(name: "ShadowsIntoLight", size: preferredDescriptor.pointSize)!
    //
    //        textLabel.font = UILabel.appearance().customFont
    //getScaledFont(forFont: "ShadowsIntoLight", textStyle: preferredDescriptor.pointSize)
    
}
*/


//        //UILabel.appearance().customFont = getScaledFont(forFont: "ShadowsIntoLight", textStyle: .title1)
//
//        //UILabel.appearance().font = UIFont(name: "Sansation", size: .body)
//        if #available(iOS 12.0, *) {
//            textLabel.adjustsFontForContentSizeCategory = true
//            //textLabel.font = textLabel.customFont
//        } else {
//            // Fallback on earlier versions
//            textLabel.setup()
//        }
*/
