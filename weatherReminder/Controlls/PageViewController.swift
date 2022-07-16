//
//  PageViewController.swift
//  weatherReminder
//
//  Created by Idel Mukhamedyanov on 07.06.2022.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()

         dataSource = self
        
        if let controllerView = showViewControllerAtIndex(index: 0){
            setViewControllers([controllerView], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    func showViewControllerAtIndex(index: Int) -> UIViewController? {
        
        switch index {
        case 0:
            guard let mainViewController = storyboard?.instantiateViewController(withIdentifier: "mainScreen") as? MainViewController else {return nil}

            return mainViewController
            
        case 1:
            
            
            
            guard let weatherDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "weatherDetailsScreen") as? WeatherDetailsViewController else {return nil}
            
            return weatherDetailsViewController
        case 2:
            
            
            
            guard let weatherDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "weatherDetailsScreen") as? WeatherDetailsViewController else {return nil}
            
            return weatherDetailsViewController
        default:
            return nil
        }
          
        
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        currentPage -= 1
        
        return showViewControllerAtIndex(index: currentPage)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        currentPage += 1
        
        return showViewControllerAtIndex(index: currentPage)
    }
    
    
}
