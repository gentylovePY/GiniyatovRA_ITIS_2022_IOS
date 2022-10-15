//
//  SignOutViewController.swift
//  104
//
//  Created by Роман Гиниятов on 07.10.2022.
//

import UIKit

class SignOutViewController: UIViewController {

    @IBOutlet var buttonSihOut: UIButton!
    @IBOutlet var labelusernamee: UILabel!
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        labelusernamee.text = "Hello, \(UserDefaults.standard.string(forKey: "textFieldUsername")!)"
        setConstraint()
    }
    
    @IBAction func clickSignOut(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func setConstraint(){
        labelusernamee.translatesAutoresizingMaskIntoConstraints = false
         
        NSLayoutConstraint.activate([
            labelusernamee.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelusernamee.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            labelusernamee.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
        
        buttonSihOut.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonSihOut.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSihOut.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
