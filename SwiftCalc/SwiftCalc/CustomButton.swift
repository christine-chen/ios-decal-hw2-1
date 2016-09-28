//
//  CustomButton.swift
//  SwiftCalc
//
//  Created by Zach Zeleznick on 9/21/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    // MARK: Stores text content for later use
    var content: String = ""
    convenience init(content: String? = "") {
        self.init(frame: .zero)
        self.content = content!
//        self.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
    }
    override init(frame: CGRect) {
        self.content = ""
        super.init(frame: frame)
        // Do any additional setup here.
//        self.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
    }
    
    // TODO: Custom Button Behavior for Styling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Add any code for customization.
        super.touchesBegan(touches, with: event)
//        self.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
    }
    // TODO: Custom Button Behavior for Styling
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Add any code for customization.
        super.touchesEnded(touches, with: event)
//        self.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
    }
    // MARK: Required inits are required
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
