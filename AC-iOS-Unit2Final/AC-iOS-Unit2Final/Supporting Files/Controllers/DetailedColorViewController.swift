//
//  DetailedColorViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class DetailedColorViewController: UIViewController {

    var crayon:Crayon? = nil
    
    @IBOutlet weak var colorName: UILabel!
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var greenSliderOutlet: UISlider!
    
    @IBOutlet weak var redSliderOultet: UISlider!
    
    @IBOutlet weak var alphaSliderOutlet: UISlider!
    
    @IBOutlet weak var blueSliderOutlet: UISlider!
    

    // MarkL ResetButton
    @IBAction func resetButton(_ sender: UIButton) {
        if let safeCrayon = crayon{
        self.colorView.backgroundColor = UIColor(red: CGFloat((safeCrayon.red)/255), green: CGFloat(safeCrayon.green/255), blue: CGFloat(safeCrayon.blue/255), alpha: 1)
            self.blueSliderOutlet.value = Float(safeCrayon.blue)
            self.redSliderOultet.value = Float(safeCrayon.red)
            self.greenSliderOutlet.value = Float(safeCrayon.green)
            self.alphaSliderOutlet.value = 1
        }
        
    }
        // Mark: Sliders
    
    @IBAction func redSliderInput(_ sender: UISlider) {
        self.colorView.backgroundColor = UIColor(red: CGFloat(sender.value), green: CGFloat(Settings.green/255), blue: CGFloat(Settings.blue/255), alpha: CGFloat(Settings.alpha))
    }
    
    
    @IBAction func greenSliderInput(_ sender: UISlider) {
                self.colorView.backgroundColor = UIColor(red: CGFloat(Settings.red/255), green: CGFloat(sender.value), blue: CGFloat(Settings.blue/255), alpha: CGFloat(Settings.alpha))
    }
    
    
    @IBAction func blueSliderInput(_ sender: UISlider) {
                self.colorView.backgroundColor = UIColor(red: CGFloat(Settings.red/255), green: CGFloat(Settings.green/255), blue: CGFloat(sender.value), alpha: CGFloat(Settings.alpha))
    }
    
    
    @IBAction func alphaSliderInput(_ sender: UISlider) {
                self.colorView.backgroundColor = UIColor(red: CGFloat(Settings.red/255), green: CGFloat(Settings.green/255), blue: CGFloat(Settings.blue/255), alpha: CGFloat(sender.value))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeCrayon = crayon{
            self.colorName.text = safeCrayon.name
            self.colorView.backgroundColor = UIColor(red: CGFloat(safeCrayon.red/255), green: CGFloat(safeCrayon.green/255), blue: CGFloat(safeCrayon.blue/255), alpha: 1)
            self.blueSliderOutlet.value = Float(Settings.blue)
            self.redSliderOultet.value = Float(Settings.red)
            self.greenSliderOutlet.value = Float(Settings.green)
            self.alphaSliderOutlet.value = Float(Settings.alpha)
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
