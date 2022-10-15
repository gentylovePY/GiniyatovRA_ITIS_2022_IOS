//
//  BrowsCatalogViewControler.swift
//  104
//
//  Created by Роман Гиниятов on 07.10.2022.
//

import UIKit

class BrowsCatalogViewControler: UIViewController {
    
    @IBOutlet var buttonBrowseCatalog: UIButton!
    @IBOutlet var labelBrowseCatalog: UILabel!
    override func viewDidLoad() {
        let value = navigationController?.viewControllers.count ?? 0
        labelBrowseCatalog.text = "Page = \(value - 1)"
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.tintColor = .white

        setConstraints()
        
    }
    
    @IBAction func clickBrowse(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BrowseCatalogViewControler")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setConstraints(){
        labelBrowseCatalog.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelBrowseCatalog.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelBrowseCatalog.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            labelBrowseCatalog.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
        
        buttonBrowseCatalog.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonBrowseCatalog.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonBrowseCatalog.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
   
}
