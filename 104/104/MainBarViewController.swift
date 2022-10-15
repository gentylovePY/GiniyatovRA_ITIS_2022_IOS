//
//  MainBarViewController.swift
//  104
//
//  Created by Роман Гиниятов on 07.10.2022.
//

import UIKit

class MainBarViewController: UIViewController {

    @IBOutlet var labelUserName: UILabel!
    
    @IBOutlet var buttonAnimal: UIButton!
   
    @IBOutlet var buttonBrowseCatalog: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUserName.text = "Hello, \( UserDefaults.standard.string(forKey: "textFieldUsername")!)"
       setConstraints()
    }
    
    
    
    @IBAction func clickBrowseCatalog(_ sender: Any) {
        let vc: BrowsCatalogViewControler = UIStoryboard(name: "Main", bundle: nil)
              .instantiateViewController(identifier: "BrowseCatalogViewControler")
        navigationController?.pushViewController(vc, animated: true)

    }
    

    @IBAction func clickAnimal(_ sender: Any) {
        let vcAmimal: AnimalViewController = UIStoryboard(name: "Main", bundle: nil)
              .instantiateViewController(identifier: "AnimalVC")
        navigationController?.pushViewController(vcAmimal, animated: true)
    }
    
    private func setConstraints(){
        labelUserName.translatesAutoresizingMaskIntoConstraints = false
         
        NSLayoutConstraint.activate([
            labelUserName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelUserName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            labelUserName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
        
        buttonBrowseCatalog.translatesAutoresizingMaskIntoConstraints = false
        buttonAnimal.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonBrowseCatalog.topAnchor.constraint(equalTo: labelUserName.bottomAnchor, constant: 32),
            buttonBrowseCatalog.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            buttonAnimal.topAnchor.constraint(equalTo: buttonBrowseCatalog.bottomAnchor, constant: 16),
            buttonAnimal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
    }

}
