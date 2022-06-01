//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Kalybay Zhalgasbay on 05.04.2022.
//

import UIKit


class MainViewController: UIViewController{

    //MARK: - Creating IBOutlets and attributes of MainViewController.
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightTypeLabel: UILabel!
    @IBOutlet weak var ageValueLabel: UILabel!
    @IBOutlet weak var inchButton: UIButton!
    @IBOutlet weak var cmButton: UIButton!
    @IBOutlet weak var lbsButton: UIButton!
    @IBOutlet weak var kgButton: UIButton!
    @IBOutlet weak var ageValueStepper: UIStepper!
    @IBOutlet weak var weightValueStepper: UIStepper!
    @IBOutlet weak var heightValueSlider: UISlider!
    
    var isLbsClicked = false
    var isKgClicked = false
    var isInchClicked = false
    var isCmClicked = false
    var isGenderChoosen = false
    var BMI = 0.0
    var gender: String = ""
    
    // Initializing alert, that shows warning message about incorrect input
    let alert = UIAlertController(title: "Incorrect input", message: "Choose metric systems and gender, inch-lbs, cm-kg", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    var weightType: String = ""
    var personalInfo: String = "Empty"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.addAction(okAction)
    }
    
    //MARK: - Adding actions to buttons, BMICalculator configuration.
    @IBAction func femaleButtonClicked(_ sender: Any) {
        femaleButton.setImage(UIImage(named: "femaleIconTapped")!, for: .normal)
        maleButton.setImage(UIImage(named: "maleIcon")!, for: .normal)
        gender = "female"
        isGenderChoosen = true
    }
    @IBAction func maleButtonClicked(_ sender: Any) {
        maleButton.setImage(UIImage(named: "maleIconTapped"), for: .normal)
        femaleButton.setImage(UIImage(named: "femaleIcon"), for: .normal)
        gender = "male"
        isGenderChoosen = true
    }
    @IBAction func cmClicked(_ sender: UIButton) {
        isCmClicked = true
        isInchClicked = false
        sender.setImage(UIImage(named: "cmTappedIcon")!, for: .normal)
        inchButton.setImage(UIImage(named: "inchIcon")!, for: .normal)
        heightTypeLabel.text = "cm"
    }
    
    @IBAction func inchClicked(_ sender: UIButton) {
        isInchClicked = true
        isCmClicked = false
        sender.setImage(UIImage(named: "inchTappedIcon")!, for: .normal)
        cmButton.setImage(UIImage(named: "cmIcon")!, for: .normal)
        heightTypeLabel.text = "inch"
    }
    
    @IBAction func lbsClicked(_ sender: UIButton) {
        weightType = "lbs"
        isLbsClicked = true
        isKgClicked = false
        sender.setImage(UIImage(named: "weightTappedIcon")!, for: .normal)
        kgButton.setImage(UIImage(named: "kgIcon")!, for: .normal)
    }
    
    @IBAction func kgClicked(_ sender: Any) {
        weightType = "kg"
        isKgClicked = true
        isLbsClicked = false
        kgButton.setImage(UIImage(named: "kgTappedIcon")!, for: .normal)
        lbsButton.setImage(UIImage(named: "weightIcon")!, for: .normal)
    }
    
    @IBAction func sliderChoosed(_ sender: UISlider) {
        heightValueLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func weightStepperClicked(_ sender: UIStepper) {
        weightValueLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func ageStepperClicked(_ sender: UIStepper) {
        ageValueLabel.text = "\(Int(sender.value))"
    }
       
    @IBAction func calculateBMI(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LastVC") as! ResultViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        controller.textInfo = personalInfo
        
        if((isKgClicked && isCmClicked && isGenderChoosen) || (isLbsClicked && isInchClicked && isGenderChoosen)){
            if(isKgClicked && isCmClicked){
                let sliderValue = Double(heightValueSlider.value/100)
                BMI = Double(weightValueStepper.value/(sliderValue*sliderValue))
            } else if (isLbsClicked && isInchClicked) {
                let sliderValue = Double(heightValueSlider.value)
                BMI = 703*Double(weightValueStepper.value/(sliderValue*sliderValue))
            }
            controller.BMIIndex = BMI
            controller.BMIresult  = """
   BMI Index: \(String(format: "%0.2f", BMI))\n   Gender: \(gender) \n   Age: \(Int(ageValueStepper.value)) \n   Weight: \(Int(weightValueStepper.value)) \(weightType) \n   Height: \(Int(heightValueSlider.value)) \(heightTypeLabel.text!)
"""
            present(controller, animated: true, completion: nil)
        } else {
            print("Enter correct metric values!")
            present(alert, animated: true, completion: nil)
        }

    }

   
}

