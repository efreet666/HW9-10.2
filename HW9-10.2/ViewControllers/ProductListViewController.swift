//
//  ProductListViewController.swift
//  HW9-10.2
//
//  Created by Влад Бокин on 29.08.2021.
//

import UIKit


public protocol PizzaDelegate{
    func addPizzaToCart(selectSize: String, coast: Double)
}

var isAddedToCart = false

var name: String = ""
var pizzaCoast: Double = 0.0

class ProductListViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var segueToCartVC: UIBarButtonItem!
    
    @IBAction func segueToCartVCAction(_ sender: Any) {
        let storyB = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyB.instantiateViewController(identifier: "CartViewController") as? CartViewController else { return }
        vc.cartItems = [name : pizzaCoast]
                self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func openPizzaVC(name: String, images: [UIImage?], coast: Double){
        let storyB = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyB.instantiateViewController(identifier: "PizzaViewController") as? PizzaViewController else { return }
        
        vc.pizzaCoast = coast
        vc.pizzaImages = images
        vc.pizzaName = name
        self.present(vc, animated: true, completion: nil)
        
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
        cell.imageView?.image = number.images[1]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = pizzaArray[indexPath.row]
        
        openPizzaVC(name: "\(number.name)" , images: number.images, coast: number.coast)
    }

}

extension ViewController: PizzaDelegate{
    func addPizzaToCart(selectSize: String, coast: Double) {
        name = selectSize
        pizzaCoast = coast
    }
    
 
    
}
