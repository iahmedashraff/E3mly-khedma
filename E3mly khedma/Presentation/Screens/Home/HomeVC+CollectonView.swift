//
//  HomeVC+CollectonView.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 13/01/2022.
//

import Foundation
import UIKit

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ServicesCollectionVC
        
        return cell
    }
    
    
}
