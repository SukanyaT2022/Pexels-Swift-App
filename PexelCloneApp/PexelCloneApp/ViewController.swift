//
//  ViewController.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SearchTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SearchTextField.delegate = self
    }

    @IBAction func searchButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "listConnect", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listViewController = segue.destination as? PhotoListViewController
        listViewController?.searchQuery = searchText
    }
}
//when user type somthing on text area or textfield
extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        searchText = textField.text ?? "" + string
        return true
    }
}
