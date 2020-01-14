//
//  FirstViewController.swift
//  FlickerSearch
//
//  Created by 蘇健豪1 on 2020/1/14.
//  Copyright © 2020 Oyster. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
    }
    
    private func viewSetup() {
        searchTextField.delegate = self
        numberTextField.delegate = self
        numberTextField.keyboardType = .numberPad
        
        searchButton.isEnabled = false
        searchButton.setTitleColor(.red, for: .disabled)
    }

    @IBAction func Search(_ sender: UIButton) {
        
    }
    
    // MARK: - TextField
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard searchTextField.text != "" else {
            searchButton.isEnabled = false
            return
        }
        
        guard numberTextField.text != "" else {
            searchButton.isEnabled = false
            return
        }
        
        searchButton.isEnabled = true
    }
    
    // MARK: Fold Keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

