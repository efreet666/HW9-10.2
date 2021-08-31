//
//  ProductListViewController.swift
//  HW9-10.2
//
//  Created by Влад Бокин on 29.08.2021.
//

import UIKit

class ProductListViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    
    @IBOutlet weak var cellImageView: UIImageView!
    var pizzaArray: [Pizza] = [Pizza(name: "Пеперони", coast: 639, image: UIImage(named: "1")),
                               Pizza(name: "Маргарита", coast: 540, image: UIImage(named: "2")),
                               Pizza(name: "Ветчина и сыр", coast: 540, image: UIImage(named: "3")),
                               Pizza(name: "Ветчина и грибы", coast: 560, image: UIImage(named: "4")),
                               Pizza(name: "4 сыра", coast: 540, image: UIImage(named: "5")),
                               Pizza(name: "Пеперони", coast: 639, image: UIImage(named: "1")),
                               Pizza(name: "Маргарита", coast: 540, image: UIImage(named: "2")),
                               Pizza(name: "Ветчина и сыр", coast: 540, image: UIImage(named: "3")),
                               Pizza(name: "Ветчина и грибы", coast: 560, image: UIImage(named: "4")),
                               Pizza(name: "4 сыра", coast: 540, image: UIImage(named: "5"))]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let number = pizzaArray[indexPath.row]
        
        cell.textLabel?.text = number.name
        cell.imageView?.image = number.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PizzaViewController()
        
    }
}
