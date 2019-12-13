//
//  ViewController.swift
//  Hello World
//
//  Created by Charlie on 12/13/19.
//  Copyright © 2019 Charlie Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Variables
    let red = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    let green = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
    let blue = #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)
    let magenta = #colorLiteral(red: 1, green: 0, blue: 0.9086670311, alpha: 1)
    let cyan = #colorLiteral(red: 0, green: 1, blue: 0.9585074513, alpha: 1)
    let yellow = #colorLiteral(red: 1, green: 0.9499483218, blue: 0, alpha: 1)
    var TextColorArray: [UIColor] = []
    var BackgroundColorArray: [UIColor] = []
    var backgroundColorIndex = 0
    var textColorIndex = 0
    
    //IBOutlets
    @IBOutlet var BackgroundView: UIView!
    @IBOutlet weak var HelloText: UILabel!
    @IBOutlet weak var ChangeTextColorButton: UIButton!
    @IBOutlet weak var ChangeBackgroundColorButton: UIButton!
    @IBOutlet weak var ChangeTextStringButton: UIButton!
    @IBOutlet weak var GoodbyeMessageButton: UIButton!
    @IBOutlet weak var TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetCornerRadius(radius: 5)
        SetTextColorArray()
        SetBackgroundColorArray()
    }
    
    func SetBackgroundColorArray() {
        let defaultBackgroundColor = BackgroundView.backgroundColor
        BackgroundColorArray = [defaultBackgroundColor!, magenta, cyan, yellow]
    }
    
    func SetTextColorArray() {
        let defaultTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        TextColorArray = [defaultTextColor, red, green, blue]
    }

    func SetCornerRadius(radius: CGFloat) {
        ChangeTextColorButton.layer.cornerRadius = radius
        ChangeBackgroundColorButton.layer.cornerRadius = radius
        ChangeTextStringButton.layer.cornerRadius = radius
        GoodbyeMessageButton.layer.cornerRadius = radius
    }
    
    func SetBackgroundColor() {
        BackgroundView.backgroundColor = BackgroundColorArray[backgroundColorIndex]
    }
    
    func SetTextColor() {
        HelloText.textColor = TextColorArray[textColorIndex]
    }
    
    @IBAction func ChangeTextColor(_ sender: UIButton) {
        if textColorIndex < 3 {
            textColorIndex += 1
        } else {
            textColorIndex = 0
        }
        SetTextColor()
    }
    
    @IBAction func ChangeBackgroundColor(_ sender: UIButton) {
        if backgroundColorIndex < 3 {
            backgroundColorIndex += 1
        } else {
            backgroundColorIndex = 0
        }
        SetBackgroundColor()
    }
    
    @IBAction func GoodbyeMessage(_ sender: UIButton) {
        HelloText.text = "Goodbye 👋"
    }
    
    @IBAction func ChangeTextString(_ sender: UIButton) {
        if !(TextField.text!.isEmpty) {
            HelloText.text = TextField.text
        } else {
            HelloText.text = "Hello From Charlie!"
        }
        self.view.endEditing(true)
    }
    
    @IBAction func ResetDefaults(_ sender: UIButton) {
        backgroundColorIndex = 0
        textColorIndex = 0
        HelloText.text = "Hello From Charlie!"
        SetBackgroundColor()
        SetTextColor()
    }
}

