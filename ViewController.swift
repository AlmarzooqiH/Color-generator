//
//  ViewController.swift
//  Color generator
//
//  Created by Hamad Saleh Almarzooqi on 07/08/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var color1: UIButton!
    @IBOutlet weak var color2: UIButton!
    @IBOutlet weak var color3: UIButton!
    @IBOutlet weak var color4: UIButton!
    @IBOutlet weak var copyColorValue1: UIButton!
    @IBOutlet weak var copyColorValue2: UIButton!
    @IBOutlet weak var copyColorValue3: UIButton!
    @IBOutlet weak var copyColorValue4: UIButton!
    var redValue: Int = 0
    var greenValue: Int = 0
    var blueValue: Int = 0
    var opacity: Float = 0.0
    var colorNumber: Int = 0
    var iteration = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        color1.setTitle("", for: .normal)
        color2.setTitle("", for: .normal)
        color3.setTitle("", for: .normal)
        color4.setTitle("", for: .normal)
        
    }
    
    //This is the generating button that will generate new colors.
    @IBAction func Generate(_ sender: Any) {
        while (colorNumber <= 4 ){
            rgbValueGenerator()
            makeColors(red: redValue, green: greenValue, blue: blueValue,alpha: self.opacity)
            
            colorNumber += 1
            if colorNumber == 5 {
                colorNumber = 0
                break
            }
        }
        
        
    }
    
    //This function provides the rgb values.
    func rgbValueGenerator() {
        //The while loop will iterate 12 times so it can make 4 colors, which 4 colors need 12 rgb values.
        while iteration <= 12 {
            //The values are randomly chosen by the function Int.random(in: )
            redValue = Int.random(in: 0...255)
            greenValue = Int.random(in: 0...255)
            blueValue = Int.random(in: 0...255)
            opacity = Float.random(in: 0...1)
            print("The red value is: \(redValue), and the green value is \(greenValue), and the blue value is \(blueValue), and the opacity is: \(opacity)")
            iteration += 1
            //This checks if the value of the iteration reached 12 so it can resets the iteration value and break out of the loop, so when the user presses the generate button the user won't be stuck in infinite loop.
            if iteration == 12 {
                iteration = 0
                print("--------------------")
                break
            }
        }
    }
    //The following functions takes the RGBA and converts it to a color.
    func makeColors(red: Int, green: Int, blue: Int, alpha: Float) -> UIColor {
        //Converting the data types from Int and Float to CGFloat
        var rcolor =  CGFloat(red)
        var gcolor =  CGFloat(green)
        var bcolor = CGFloat(blue)
        var opacity = CGFloat(alpha)
        print("rcolor: \(rcolor), gcolor: \(gcolor), bcolor: \(bcolor), opacity: \(opacity)")
        //This is where the color will be made with the rgb values.
        var color = UIColor(red: rcolor, green: gcolor, blue: bcolor, alpha: opacity)
        //Setting the backround of the button to the color that we got, and the text of the rgba value to the number we got.
        let redString = String(format: "%.0f", rcolor)
        let greenStirng = String(format: "%.0f", gcolor)
        let blueString = String(format: "%.0f", bcolor)
        let alphaString = String(format: "%.3f", opacity)
       
        //Checks at what color it is so it can give it the number and value of the color.
        if (colorNumber == 1 ){
            color1.backgroundColor = UIColor(red: (100/rcolor), green: (100/gcolor), blue: (100/bcolor), alpha: (opacity))
            
            copyColorValue1.setTitle("R:\(redString) G:\(greenStirng) B:\(blueString) A:\(alphaString)", for: .normal)
        } else if (colorNumber == 2){
            color2.backgroundColor = UIColor(red: (100/rcolor), green: (100/gcolor), blue: (100/bcolor), alpha: (opacity))
            
            copyColorValue2.setTitle("R:\(redString) G:\(greenStirng) B:\(blueString) A:\(alphaString)", for: .normal)
        }   else if (colorNumber == 3){
            color3.backgroundColor = UIColor(red: (100/rcolor), green: (100/gcolor), blue: (100/bcolor), alpha: (opacity))
            
            copyColorValue3.setTitle("R:\(redString) G:\(greenStirng) B:\(blueString) A:\(alphaString)", for: .normal)
            
        }   else if (colorNumber == 4){
            
            color4.backgroundColor = UIColor(red: (100/rcolor), green: (100/gcolor), blue: (100/bcolor), alpha: (opacity))
            
            copyColorValue4.setTitle("R:\(redString) G:\(greenStirng) B:\(blueString) A:\(alphaString)", for: .normal)
        }
        
        
        return color
    }
}

