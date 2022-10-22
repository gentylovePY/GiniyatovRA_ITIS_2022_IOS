//
//  CustomTableViewCell.swift
//  hw6
//
//  Created by Роман Гиниятов on 21.10.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }
    private let imageios: UIImageView = .init()
    private let nameCompanyLabel: UILabel = .init()
    private let price: UILabel = .init()
    private let screenSizeLabel: UILabel = .init()
    private let memoryLabel: UILabel = .init()
    
    public func toString() -> String {
        let text = " название = \(nameCompanyLabel.text ?? "")\n цена = \(price.text ?? "" )\n \(screenSizeLabel.text ?? "")\n память = \(memoryLabel.text ?? "")\n"
        return text
    }
    

    func set(phone: Phone) {
        imageios.image = UIImage(named: "iphone")
        nameCompanyLabel.text = "\(phone.model)"
        price.text = String( "price = \(phone.price)")
        screenSizeLabel.text =  String( "screenSize = \(phone.screenSize)")
        memoryLabel.text =  String( "memory = \(phone.memory)")
    }

    private func setup() {
        nameCompanyLabel.font = .boldSystemFont(ofSize: 16)
        memoryLabel.font = .boldSystemFont(ofSize: 14)
        screenSizeLabel.font = .boldSystemFont(ofSize: 14)
        price.font = .boldSystemFont(ofSize: 14)
        setConstraint()
        
    }
    
    
    private func setConstraint(){let labelStackView = UIStackView(arrangedSubviews: [
        nameCompanyLabel, price, memoryLabel, screenSizeLabel])
        
        labelStackView.axis = .vertical
        labelStackView.alignment = .leading
        let imageStackView = UIStackView(arrangedSubviews: [
            imageios])
        
        contentView.addSubview(labelStackView)
        contentView.addSubview(imageStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageStackView.widthAnchor.constraint(equalToConstant: 60),
            imageStackView.heightAnchor.constraint(equalToConstant: 60),
            imageStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            imageStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            labelStackView.leadingAnchor.constraint(equalTo: imageios.trailingAnchor, constant: 10),
            labelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
        ])
    }
}


 
