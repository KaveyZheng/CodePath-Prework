//
//  ViewController.swift
//  Prework
//
//  Created by Kavey Zheng on 7/27/22.
//

import UIKit

class ViewController: UIViewController {
    let colors: [UIColor] = [ // array of different colors
        .systemYellow,
        .systemRed,
        .systemBrown,
        .systemGray,
        .systemGreen,
        .systemPurple
    ]

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        configureTap()
    }
    
    private func configureTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
        textField.text = nil
        TxtLabel.text = "Hello from Kavey!"
        TxtLabel.textColor = .systemGray
        view.backgroundColor = .systemGray
    }
    
    @IBOutlet weak var TxtLabel: UILabel!
    
    @IBAction func ChangeTxtStringClick(_ sender: Any) {
        if (textField.hasText) {
            TxtLabel.text = textField.text
            textField.resignFirstResponder()
        }
        else { TxtLabel.text = "Goodbye 👋" }
        textField.text = nil
    }
    
    @IBAction func ChangeBackgroundColorClick(_ sender: Any) {
        view.backgroundColor = colors.randomElement()
    }
    
    @IBAction func ChangeTxtColorClick(_ sender: Any) {
        TxtLabel.textColor = colors.randomElement()
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
