//
//  ViewController.swift
//  104
//
//  Created by Роман Гиниятов on 07.10.2022.
//

import UIKit

class SignInViewController2: UIViewController {

   
    @IBOutlet var textFieldUsername: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var submitbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setConstraints()
    }


    @IBAction func clickSubmitButton(_ sender: Any) {
        
        if (((textFieldUsername.text ?? "").isEmpty) || ((textFieldPassword.text ?? "").isEmpty)) {
            createAlert(title: "Warning", description: "Wrong username or password")
        
        } else {
            UserDefaults.standard.set(textFieldUsername.text, forKey: "textFieldUsername")
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "TabbarViewController") else { return }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)

        }
        UserDefaults.standard.set(0, forKey: "value")

        
    }
    
    func createAlert(title: String?, description: String?) {

            let alertController = UIAlertController(
                title: title, message: description, preferredStyle: .alert
            )
        
            alertController.addAction(
                UIAlertAction(title: "OK", style: .default, handler: nil)
            )
        
            present(alertController, animated: true, completion: nil)

        }
    private func setConstraints() {
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldUsername.translatesAutoresizingMaskIntoConstraints = false

     

        NSLayoutConstraint.activate([
            textFieldUsername.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldUsername.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            textFieldUsername.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            textFieldPassword.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            textFieldPassword.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
            textFieldPassword.topAnchor.constraint(equalTo: textFieldUsername.bottomAnchor, constant: 16)
        ])

        submitbutton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            submitbutton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 20),
            submitbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

    }
}

