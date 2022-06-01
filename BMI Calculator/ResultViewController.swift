//
//  LastViewController.swift
//  BMI Calculator
//
//  Created by Kalybay Zhalgasbay on 07.04.2022.
//

import UIKit



final class ResultViewController: UIViewController {

    //MARK: - Creating IBOutlets and attributes of ResultViewController
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var indicator: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var BMIresultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var textInfo: String?
    var BMIresult: String?
    var BMIIndex: Double?
    var anotherText: String?
    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultImageView.image = UIImage(named: "bmichart")
        indicator.image = UIImage(named: "indicator")
        //Unwrapping optional types
        if textInfo != nil {
            infoLabel.text = textInfo
        }
        if let safeText = anotherText {
            adviceLabel.text = safeText
        }
        if let safeBMIresult = BMIresult {
            BMIresultLabel.text = safeBMIresult
        }
        
        //MARK: - Presenting results: indicator, personal info and advice included
        if let safeBMIIndex = BMIIndex {
            if(safeBMIIndex<18.5){
                adviceLabel.text = "    Being underweight could be a sign you're not eating enough or you may be ill. If you're trying to gain weight, eat foods that are not only healthy but also high in energy. Aim for regular meals and occasional snacks, and base your diet."
                indicator.transform = indicator.transform.rotated(by: CGFloat(Double.pi*1.6))
            } else if(safeBMIIndex>18.5 && safeBMIIndex<24.9){
                adviceLabel.text = "    Keep up the good work! To maintain a healthy weight, try out the food, diet and fitness."
                indicator.transform = indicator.transform.rotated(by: CGFloat(Double.pi*1.8))
            } else if (safeBMIIndex>24.9 && safeBMIIndex<29.9){
                adviceLabel.text = "    The best way to lose weight if you're overweight is through a combination of diet and exercise."
            } else if (safeBMIIndex>29.9 && safeBMIIndex<34.9){
                adviceLabel.text = "    The best way to lose weight if you're obese is through a combination of diet and exercise, and, in some cases, medicines."
                indicator.transform = indicator.transform.rotated(by: CGFloat(Double.pi/6))
            } else {
                adviceLabel.text = " The best way to treat obesity is to eat a healthy reduced-calorie diet and exercise regularly. You may also benefit from receiving psychological support from a trained healthcare professional to help change the way you think about food and eating."
                indicator.transform = indicator.transform.rotated(by: CGFloat(Double.pi/3))
            }
        }
    }
    //MARK: - Navigate to IntroViewController
    @IBAction func backButton(_ sender: UIButton) {
        let introController = storyboard?.instantiateViewController(withIdentifier: "IntroVC") as! IntroViewController
        introController.modalPresentationStyle = .fullScreen
        introController.modalTransitionStyle = .flipHorizontal
        present(introController, animated: true, completion: nil)
    }
    
    
}
