//
//  ProductListViewController.swift
//  HW9-10.2
//
//  Created by Влад Бокин on 29.08.2021.
//

import UIKit

class ProductListViewController: UIViewController {

    var pizza = pizzaArray
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    func addProductViews() {
            for product in 0..<pizza.count {
                let productView = ProductView(frame: CGRect(x: 0, y: product * 100 + 100, width: 450, height: 100))
                productView.setup(image: UIImage(named: "\(product + 1)"), productName: pizza.)
                productView.setUnderLine(color: .lightGray)
                let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showTrackVC(gestureRecognizer:)))
                trackView.addGestureRecognizer(gestureRecognizer)
                
                
               
                configuratePlayer(trackName: trackNames[product])
                configuratePlayerDurationLabel()
                
                view.addSubview(trackView)
            }
        }


}

extension UIView {
    func setUnderLine(color: UIColor = .darkGray) {
        let border = UIView()
        self.addSubview(border)
        
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        border.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        border.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        border.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        border.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}
