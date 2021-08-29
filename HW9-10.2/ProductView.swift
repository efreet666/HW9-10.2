//
//  ProductView.swift
//  HW9-10.2
//
//  Created by Влад Бокин on 29.08.2021.
//

import UIKit

class ProductView: UIView {

    let productImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 5
            imageView.frame = CGRect(x: 10, y: 15, width: 80, height: 80)
            return imageView
        }()
        
        let productNameLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
                label.numberOfLines = 0
                return label
            }()
            
            
            let addToCartButton: UIButton = {
                let button = UIButton()
                button.setTitle("+", for: .normal)
                return button
            }()
        
        override init(frame: CGRect) {
              super.init(frame: frame)
          }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setup(image: UIImage, productName: String) {
                productImageView.image = image
                productNameLabel.text = productName
                productNameLabel.frame = CGRect(x: productImageView.frame.maxX + 5, y: productImageView.frame.midY - 30, width: 230, height: 60)
                addToCartButton.frame = CGRect(x: 380, y: Int(productNameLabel.frame.midY - 10), width: 40, height: 20)
                
                addSubview(productImageView)
                addSubview(productNameLabel)
                addSubview(addToCartButton)
            }
}
