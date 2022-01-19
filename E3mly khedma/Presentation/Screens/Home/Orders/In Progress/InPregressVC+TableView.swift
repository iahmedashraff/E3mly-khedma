//
//  InPregressVC+TableView.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 19/01/2022.
//

import Foundation
import UIKit

extension InProgressVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InPregressTableVC
        cell.item = Orders[indexPath.row]
        return cell
        
    }

}
