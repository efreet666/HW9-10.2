//
//  CartViewController.swift
//  HW9-10.2
//
//  Created by Влад Бокин on 03.09.2021.
//

import UIKit

class CartViewController: UIViewController {

    var cartItems: [String : Double] = [:]
    
    var additionalItems: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cartItems.forEach {cell.textLabel?.text = "\($0)"}
        cartItems.forEach {cell.detailTextLabel?.text = "\($1)"}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
}
