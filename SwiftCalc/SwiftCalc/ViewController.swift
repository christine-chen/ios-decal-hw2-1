//
//  ViewController.swift
//  SwiftCalc
//
//  Created by Zach Zeleznick on 9/20/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Width and Height of Screen for Layout
    var w: CGFloat!
    var h: CGFloat!
    var str: String!
    var calculationString: String!
    var intResult: Int!
    var a: Int!
    var b: Int!
    var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    var dividers: [Int] = []
    var marker: Int!

    // IMPORTANT: Do NOT modify the name or class of resultLabel.
    //            We will be using the result label to run autograded tests.
    // MARK: The label to display our calculations
    var resultLabel = UILabel()
    
    // TODO: This looks like a good place to add some data structures.
    //       One data structure is initialized below for reference.
    var someDataStructure: [String] = [""]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        w = view.bounds.size.width
        h = view.bounds.size.height
        navigationItem.title = "Calculator"
        // IMPORTANT: Do NOT modify the accessibilityValue of resultLabel.
        //            We will be using the result label to run autograded tests.
        resultLabel.accessibilityValue = "resultLabel"
        makeButtons()
        // Do any additional setup here.
        str = ""
        calculationString = ""
        intResult = 0
        a = 0
        b = 0
        marker = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: A method to update your data structure(s) would be nice.
    //       Modify this one or create your own.
    func updateSomeDataStructure(_ content: String) {
        print("Update me like one of those PCs")
    }
    
    // TODO: Ensure that resultLabel gets updated.
    //       Modify this one or create your own.
    func updateResultLabel(_ content: String) {
        print("Update result label")
        resultLabel.text = content
    }
    
    
    // TODO: A calculate method with no parameters, scary!
    //       Modify this one or create your own.
    func calculate() -> String {
        return "0"
    }
    
    // TODO: A simple calculate method for integers.
    //       Modify this one or create your own.
    func intCalculate(a: Int, b:Int, operation: String) -> Int {
        print("Calculation requested for \(a) \(operation) \(b)")
        if operation == "+" {
            intResult = a + b
        } else if operation == "-" {
            intResult = a - b
        } else if operation == "*" {
            intResult = a * b
        } else if operation == "*" {
            intResult = a / b
        }
        return intResult
    }
    
    // TODO: A general calculate method for doubles
    //       Modify this one or create your own.
    func calculate(a: String, b:String, operation: String) -> Double {
        print("Calculation requested for \(a) \(operation) \(b)")
        return Double(1)
    }
    
    // REQUIRED: The responder to a number button being pressed.
    func numberPressed(_ sender: CustomButton) {
        guard Int(sender.content) != nil else { return }
//        print("The number \(sender.content) was pressed in number pressed")
        // Fill me in!
        str = ""
        someDataStructure += [sender.currentTitle!]
        for i in someDataStructure {
            str = str + i
            updateResultLabel(str)
        }
//        print("after update func in numberPressed")
    }
    
    // REQUIRED: The responder to an operator button being pressed.
    func operatorPressed(_ sender: CustomButton) {
        // Fill me in!
//        print("The operator \(sender.content) was pressed in operator pressed")
        str = ""
        if (sender.titleLabel?.text != "C" && sender.titleLabel?.text != "=") {
            someDataStructure += [sender.currentTitle!]
            for i in someDataStructure {
                str = str + i
                updateResultLabel(str)
//                print("after update func in operatorPressed")
            }
        } else if sender.titleLabel?.text == "C"{
            someDataStructure = []
            updateResultLabel("0")
        } else if sender.titleLabel?.text == "="{ //equals case
//            for i in someDataStructure {
//                let num = Int(i)
////                if numbers.contains(num!) {
////                    //num
////                    str += i
////                } else {
////                    //operator
////                    
////                    
////                }
//                if !numbers.contains(num!) {
//                    dividers.append(num!)
//                }
//            }
//            
//            for d in dividers {
//                while marker < d {
//                    str = str + someDataStructure[marker]
//                    marker = marker + 1
//                }
//                
//            }
            
        }
        marker = marker + 1
    }
    
    // REQUIRED: The responder to a number or operator button being pressed.
    func buttonPressed(_ sender: CustomButton) {
       // Fill me in!
        print("The thing \(sender.content) was pressed in buttonPressed")
        str = ""
        someDataStructure += [sender.currentTitle!]
        for i in someDataStructure {
            str = str + i
            updateResultLabel(str)
        }
        print("after update func in buttonPressed")
    }
    
    // IMPORTANT: Do NOT change any of the code below.
    //            We will be using these buttons to run autograded tests.
    
    func makeButtons() {
        // MARK: Adds buttons
        let digits = (1..<10).map({
            return String($0)
        })
        let operators = ["/", "*", "-", "+", "="]
        let others = ["C", "+/-", "%"]
        let special = ["0", "."]
        
        let displayContainer = UIView()
        view.addUIElement(displayContainer, frame: CGRect(x: 0, y: 0, width: w, height: 160)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor(red: 7/255, green: 54/255, blue: 66/255, alpha: 1.0)
        }
        displayContainer.addUIElement(resultLabel, text: "0", frame: CGRect(x: 70, y: 70, width: w-70, height: 90)) {
            element in
            guard let label = element as? UILabel else { return }
            label.textColor = UIColor(red: 238/255, green: 232/255, blue: 213/255, alpha: 1.0)
            label.font = UIFont(name: label.font.fontName, size: 60)
            label.textAlignment = NSTextAlignment.right
        }
        
        let calcContainer = UIView()
        view.addUIElement(calcContainer, frame: CGRect(x: 0, y: 160, width: w, height: h-160)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor(red: 238/255, green: 232/255, blue: 213/255, alpha: 1.0)
        }

        let margin: CGFloat = 1.0
        let buttonWidth: CGFloat = w / 4.0
        let buttonHeight: CGFloat = 100.0
        
        // MARK: Top Row
        for (i, el) in others.enumerated() {
            let x = (CGFloat(i%3) + 1.0) * margin + (CGFloat(i%3) * buttonWidth)
            let y = (CGFloat(i/3) + 1.0) * margin + (CGFloat(i/3) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
                button.setTitleColor(UIColor(red: 238/255, green: 232/255, blue: 213/255, alpha: 1.0), for: .normal)
                button.backgroundColor = UIColor(red: 38/255, green: 139/255, blue: 210/255, alpha: 1.0)
                button.addTarget(self, action: #selector(operatorPressed), for: .touchUpInside)
            }
        }
        // MARK: Second Row 3x3
        for (i, digit) in digits.enumerated() {
            let x = (CGFloat(i%3) + 1.0) * margin + (CGFloat(i%3) * buttonWidth)
            let y = (CGFloat(i/3) + 1.0) * margin + (CGFloat(i/3) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: digit), text: digit,
            frame: CGRect(x: x, y: y+101.0, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
                button.setTitleColor(UIColor(red: 238/255, green: 232/255, blue: 213/255, alpha: 1.0), for: .normal)
                button.backgroundColor = UIColor(red: 0, green: 43/255, blue: 54/255, alpha: 1.0)
                button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
            }
        }
        // MARK: Vertical Column of Operators
        for (i, el) in operators.enumerated() {
            let x = (CGFloat(3) + 1.0) * margin + (CGFloat(3) * buttonWidth)
            let y = (CGFloat(i) + 1.0) * margin + (CGFloat(i) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.backgroundColor = UIColor(red: 42/255, green: 161/255, blue: 152/255, alpha: 1.0)
                button.setTitleColor(UIColor(red: 238/255, green: 232/255, blue: 213/255, alpha: 1.0), for: .normal)
                button.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
                button.addTarget(self, action: #selector(operatorPressed), for: .touchUpInside)
                if button.titleLabel?.text == "=" {
                    button.backgroundColor = UIColor(red: 101/255, green: 123/255, blue: 131/255, alpha: 1.0)
                }
            }
        }
        // MARK: Last Row for big 0 and .
        for (i, el) in special.enumerated() {
            let myWidth = buttonWidth * (CGFloat((i+1)%2) + 1.0) + margin * (CGFloat((i+1)%2))
            let x = (CGFloat(2*i) + 1.0) * margin + buttonWidth * (CGFloat(i*2))
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: 405, width: myWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
                button.backgroundColor = UIColor(red: 0, green: 43/255, blue: 54/255, alpha: 1.0)
                button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            }
        }
    }

}

