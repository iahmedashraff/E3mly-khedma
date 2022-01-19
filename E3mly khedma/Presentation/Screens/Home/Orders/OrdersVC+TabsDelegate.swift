//
//  OrdersVC+TabsDelegate.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 19/01/2022.
//

import Foundation



extension OrdersVC: TabsDelegate {
    func tabsViewDidSelectItemAt(position: Int) {
        // Check if the selected tab cell position is the same with the current position in pageController, if not, then go forward or backward
        if position != currentIndex {
            if position > currentIndex {
                self.pageController.setViewControllers([showViewController(position)!], direction: .forward, animated: true, completion: nil)
            } else {
                self.pageController.setViewControllers([showViewController(position)!], direction: .reverse, animated: true, completion: nil)
            }
            tabsView.collectionView.scrollToItem(at: IndexPath(item: position, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}
