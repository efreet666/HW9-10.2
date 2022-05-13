//
//  PizzaViewController.swift
//  HW9-10.2
//
//  Created by Влад Бокин on 31.08.2021.
//

import UIKit



class PizzaViewController: UIViewController {
    
    public var pizzaDelegate: PizzaDelegate?
    
    let pizzaSizeArray = ["Маленькая", "средняя", "большая"]
    let pizzaWidthArray = ["Тонкое", "Толстое"]
    
    var sizeSegmentControll = UISegmentedControl()
    var widthSegmentConroll = UISegmentedControl()
    
    var pizzaImages: [UIImage?]!
    var pizzaName: String!
    var pizzaCoast: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = pizzaImages[1]
        nameLabel.text = pizzaName
        coastLabel.text = "\(pizzaCoast!)₽"
        
        self.sizeSegmentControll = UISegmentedControl(items: pizzaSizeArray)
        self.sizeSegmentControll.selectedSegmentIndex = 1
        self.sizeSegmentControll.frame = CGRect(x: 50, y: 470, width: 350, height: 40)
        self.sizeSegmentControll.addTarget(self, action: #selector(chooseSize), for: .valueChanged)
        self.view.addSubview(sizeSegmentControll)
        
        self.widthSegmentConroll = UISegmentedControl(items: pizzaWidthArray)
        self.widthSegmentConroll.selectedSegmentIndex = 1
        self.widthSegmentConroll.frame = CGRect(x: 50, y: 520, width: 350, height: 40)
        self.widthSegmentConroll.addTarget(self, action: #selector(chooseSize), for: .valueChanged)
        self.view.addSubview(widthSegmentConroll)
    }
    
    var pizzaNameArray: [String] = []
    
    var activitiViewContorller: UIActivityViewController? = nil
    
    //Mark: - add to cart button
    @IBAction func addToCart(_ sender: Any) {
        pizzaDelegate?.addPizzaToCart(selectSize: "\(sizeSegmentControll.selectedSegmentIndex)", coast: pizzaCoast)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        guard let myActivityController = self.activitiViewContorller else {return}
        self.present(myActivityController, animated: true, completion: nil)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var additionalProductCollectionView: UICollectionView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coastLabel: UILabel!
    
    var totalCoast: Double = 0.0
    @objc func chooseSize(){
        switch sizeSegmentControll.selectedSegmentIndex{
        case 0:
            imageView.image = pizzaImages[0]
            totalCoast = pizzaCoast * 0.8
            coastLabel.text = "\(totalCoast)₽"
        case 1:
            imageView.image = pizzaImages[1]
            coastLabel.text = "\(totalCoast)₽"
        case 2:
            imageView.image = pizzaImages[2]
            totalCoast = pizzaCoast * 1.2
            coastLabel.text = "\(totalCoast)₽"
        default:
            break
        }
    }
    
    @objc func chooseWidth(){
        switch sizeSegmentControll.selectedSegmentIndex{
        case 0:
            coastLabel.text = "\(totalCoast)₽"
        case 1:
            coastLabel.text = "\(pizzaCoast!)₽"
        default:
            break
        }
    }
    
    
}

extension PizzaViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell2", for: indexPath)
        cell.backgroundColor = UIColor.red
        cell.largeContentImage = UIImage(named: "1-L")
        return cell
    }
    
    
    
    
}


