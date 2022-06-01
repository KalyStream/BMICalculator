//
//  IntroViewController.swift
//  BMI Calculator
//
//  Created by Kalybay Zhalgasbay on 08.04.2022.
//

import UIKit

class IntroViewController: UIViewController {
    
    //MARK: - Creating IBOutlets and attributes of IntroViewController.
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var name: String?
    var surname: String?
    var mobileNumber: String?
    var email: String?
    let warningAlert = UIAlertController(title: "Incorrect input", message: "Please fill empty forms", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningAlert.addAction(okAction)
    }
    
    //MARK: - Filling user info and transition to MainViewController
    @IBAction func calculaterTapped(_ sender: Any) {
        if let nameText = nameTextField.text {
            name = nameText
        }
        if let surnameText = surnameTextField.text {
            surname = surnameText
        }
        if let numberText = numberTextField.text {
            mobileNumber = numberText
        }
        if let emailText = emailTextField.text {
            email = emailText
        }
        guard let safeName = name,
              let safeSurname = surname,
              let safeMobilenNum = mobileNumber,
              let safeEmail = email else {
            return
        }
        
        let mainController = storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
        mainController.modalTransitionStyle = .flipHorizontal
        mainController.modalPresentationStyle = .fullScreen

        let text: String = """
           Name: \(safeName) \n   Surname: \(safeSurname) \n   Moblie number: \(safeMobilenNum) \n   E-mail: \(safeEmail)
        """
        if(safeName.count==0 || safeEmail.count==0 || safeSurname.count==0 || safeMobilenNum.count==0){
            present(warningAlert, animated: true, completion: nil)
        }
        mainController.personalInfo = text
        present(mainController, animated: true, completion: nil)
    }
    
}
