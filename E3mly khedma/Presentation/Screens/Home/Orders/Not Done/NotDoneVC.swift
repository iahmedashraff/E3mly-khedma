//
//  NotDoneVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 19/01/2022.
//

import UIKit

class NotDoneVC: UIViewController {

    //MARK: -Constanse
    var pageIndex: Int!
    var name: String = ""
    var Orders: [OrderModel] = []

    //MARK: -Outlets
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        setupMockData()
        // Do any additional setup after loading the view.
    }
    
    

    //MARK: -IBActions
    
    
    //MARK: -Helper Functions
    func setupMockData() {
        let order1 = OrderModel()
        order1.orderName = "Order 1"
        order1.orderDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.".localize
        order1.Duration = "2 Hours"
        order1.location = "El Mansoura, Dakahlia Governorate"
        order1.date = "3:00 PM , 21 october 19"
        
        
        self.Orders.append(order1)
        
        let order2 = OrderModel()
        order2.orderName = "Order 1"
        order2.orderDescription = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.".localize
        order2.Duration = "2 Hours"
        order2.location = "El Mansoura, Dakahlia Governorate"
        order2.date = "3:00 PM , 21 october 19"
        
        
        self.Orders.append(order2)
    }
}
