//
//  AnimalViewController.swift
//  104
//
//  Created by Роман Гиниятов on 08.10.2022.
//

import UIKit

class AnimalViewController: UIViewController {

    @IBOutlet var imageViewAnimal: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewAnimal.image = UIImage(named: "photo2.jpeg")
        setConstraints()
        
    }
    
    private func setConstraints(){

        imageViewAnimal.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageViewAnimal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageViewAnimal.centerYAnchor.constraint(equalTo: view.centerYAnchor),
           
        ])
        
    }
    

}
