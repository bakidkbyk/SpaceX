//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Baki on 13.01.2025.
//

import UIKit
import TinyConstraints

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let segmentControl: UISegmentedControl = {
        let titles = ["Upcoming","Past"]
        let segmentControl = UISegmentedControl(items: titles)
        
        return  segmentControl
    }()
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private lazy var subViewControllers: [UIViewController] = {
        return self.configureControllers()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configure()
        setLocalize()
    }

}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubviews() {
        addSegmentView()
        addPageViewController()
    }
    
    private func addSegmentView() {
        view.addSubview(segmentControl)
        segmentControl.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
    }
    
    private func addPageViewController() {
        definesPresentationContext = true
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        
        pageViewController.view.edgesToSuperview(excluding: .top, usingSafeArea: true)
        pageViewController.view.topToBottom(of: segmentControl)
    }
}

// MARK: - Configure Contents
extension HomeViewController {
    
    private func configure() {
        view.backgroundColor = .white
        pageViewController.delegate = self
        pageViewController.dataSource = self
        segmentControl.height(46)
        
        pageViewController.setViewControllers([subViewControllers[viewModel.selectedSegmentIndex]], direction: .forward, animated: true)
        segmentControl.selectedSegmentIndex = 0
        
        segmentControl.addTarget(self, action: #selector(segmentControlValueChanged), for: .valueChanged)
    }
    
    private func setLocalize(){
        navigationItem.title = "Launches"
    }

}

// MARK: - Configure Controllers
extension HomeViewController {
    
    private func configureControllers() -> [UIViewController] {
        let upcomingRouter = UpcomingRouter()
        let upcomingViewModel = UpcomingViewModel(router: upcomingRouter)
        let upcomingViewController = UpcomingViewController(viewModel: upcomingViewModel)
        upcomingRouter.viewController = upcomingViewController
        
        let pastRouter = PastRouter()
        let pastViewModel = PastViewModel(router: pastRouter)
        let pastViewController = PastViewController(viewModel: pastViewModel)
        pastRouter.viewController = pastViewController
        
        return [upcomingViewController, pastViewController]
    }
}

// MARK: - Segmented Control Value Change
extension HomeViewController {

    @objc
    func segmentControlValueChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        let direction: UIPageViewController.NavigationDirection = selectedIndex > viewModel.selectedSegmentIndex ? .forward : .reverse
        
        viewModel.selectedSegmentIndex = selectedIndex
        
        self.pageViewController.setViewControllers([subViewControllers[selectedIndex]], direction: direction, animated: true)
    }
 }

// MARK: - Page View Controller Delegate
extension HomeViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let index = subViewControllers.firstIndex(of: currentViewController) {
                segmentControl.selectedSegmentIndex = index
            }
        }
    }
}

// MARK: - Page View Controller Data Source
extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.subViewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        let before = index - 1
        return subViewControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.subViewControllers.firstIndex(of: viewController), index < (subViewControllers.count - 1) else { return nil }
        let after = index + 1
        return subViewControllers[after]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
}


