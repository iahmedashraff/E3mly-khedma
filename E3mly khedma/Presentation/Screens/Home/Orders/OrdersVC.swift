//
//  OrdersVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 19/01/2022.
//

import UIKit

class OrdersVC: UIViewController {
    //MARK: -Constanse
    var currentIndex: Int = 0
        
    var pageController: UIPageViewController!
    
    //MARK: -Outlets
    
    @IBOutlet weak var tabsView: TabsView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblMyOrders: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTabs()
        setupPageViewController()

        // Do any additional setup after loading the view.
    }
    //MARK: -IBActions
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func btnSearchPressed(_ sender: UIButton) {
    }
    
    
    
    //MARK: -Helper Functions
    func setupUI(){
        btnBack.setImage(UIImage(named: "arrow.left".localize), for: .normal)
        btnBack.setTitle("", for: .normal)
        btnSearch.setTitle("", for: .normal)
        lblMyOrders.text = "My Orders".localize
    }
    func setupTabs() {
            // Add Tabs (Set 'icon'to nil if you don't want to have icons)
            tabsView.tabs = [
                Tab(title: "Not Done".localize),
                Tab(title: "In Pregress".localize),
                Tab(title: "Done".localize)
            ]
            
            // Set TabMode to '.fixed' for stretched tabs in full width of screen or '.scrollable' for scrolling to see all tabs
            tabsView.tabMode = .fixed
            
            // TabView Customization
            tabsView.titleColor = .white
            tabsView.iconColor = .white
            tabsView.indicatorColor = UIColor(hexString: "#FEBD63")
            tabsView.titleFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
            tabsView.collectionView.backgroundColor = UIColor(hexString: "#413D7D")
            
            // Set TabsView Delegate
            tabsView.delegate = self
            
            // Set the selected Tab when the app starts
            tabsView.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
        }
    func setupPageViewController() {
           // PageViewController
           self.pageController = storyboard?.instantiateViewController(withIdentifier: "TabsPageViewController") as! TabsPageViewController
           self.addChild(self.pageController)
           self.view.addSubview(self.pageController.view)
           
           // Set PageViewController Delegate & DataSource
           pageController.delegate = self
           pageController.dataSource = self
           
           // Set the selected ViewController in the PageViewController when the app starts
           pageController.setViewControllers([showViewController(0)!], direction: .forward, animated: true, completion: nil)
           
           // PageViewController Constraints
           self.pageController.view.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               self.pageController.view.topAnchor.constraint(equalTo: self.tabsView.bottomAnchor),
               self.pageController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
               self.pageController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
               self.pageController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
           ])
           self.pageController.didMove(toParent: self)
       }
    func showViewController(_ index: Int) -> UIViewController? {
        if (self.tabsView.tabs.count == 0) || (index >= self.tabsView.tabs.count) {
            return nil
        }
        
        currentIndex = index
        
        if index == 0 {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "NotDoneVC") as! NotDoneVC
            contentVC.pageIndex = index
            return contentVC
        } else if index == 1 {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "InProgressVC") as! InProgressVC
            contentVC.pageIndex = index
            return contentVC
        } else if index == 2 {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "DoneVC") as! DoneVC
            contentVC.pageIndex = index
            return contentVC
        }else {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "NotDoneVC") as! NotDoneVC
            contentVC.name = tabsView.tabs[index].title
            contentVC.tableView
            contentVC.pageIndex = index
            return contentVC
    }
    }
}

extension OrdersVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // return ViewController when go forward
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = pageViewController.viewControllers?.first
        var index: Int
        index = getVCPageIndex(vc)
        // Don't do anything when viewpager reach the number of tabs
        if index == tabsView.tabs.count {
            return nil
        } else {
            index += 1
            return self.showViewController(index)
        }
    }
    
    // return ViewController when go backward
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = pageViewController.viewControllers?.first
        var index: Int
        index = getVCPageIndex(vc)
        
        if index == 0 {
            return nil
        } else {
            index -= 1
            return self.showViewController(index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            if completed {
                guard let vc = pageViewController.viewControllers?.first else { return }
                let index: Int
                
                index = getVCPageIndex(vc)
                
                tabsView.collectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredVertically)
                // Animate the tab in the TabsView to be centered when you are scrolling using .scrollable
                tabsView.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
    }
    
    // Return the current position that is saved in the UIViewControllers we have in the UIPageViewController
    func getVCPageIndex(_ viewController: UIViewController?) -> Int {
        switch viewController {
        case is NotDoneVC:
            let vc = viewController as! NotDoneVC
            return vc.pageIndex
        case is InProgressVC:
            let vc = viewController as! InProgressVC
            return vc.pageIndex
        case is DoneVC:
            let vc = viewController as! DoneVC
            return vc.pageIndex
        default:
            let vc = viewController as! NotDoneVC
            return vc.pageIndex
        }
    }
}





