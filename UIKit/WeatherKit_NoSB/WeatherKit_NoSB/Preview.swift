//
//  Preview.swift
//  UIKitPractice
//
//  Created by gnksbm on 2023/07/24.
//

import UIKit
import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {
    
    let viewControllerGenerator: () -> UIViewController
    
    init(viewControllerGenerator: @escaping () -> UIViewController) {
        self.viewControllerGenerator = viewControllerGenerator
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerGenerator()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

//class PreviewScene: UITabBarController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let vc1 = ViewController()
//        vc1.tabBarItem = UITabBarItem(title: "Label", image: UIImage(systemName: "note.text"), tag: 0)
//        let vc2 = FilteredResultViewController()
//        vc2.tabBarItem = UITabBarItem(title: "Label", image: UIImage(systemName: "note.text"), tag: 1)
//        let vc3 = ThirdViewController()
//        vc3.tabBarItem = UITabBarItem(title: "Label", image: UIImage(systemName: "note.text"), tag: 2)
//
//        let tabbar = UITabBarController()
//        self.viewControllers = [vc1, vc2, vc3]
//        self.selectedIndex = 2
//        self.tabBar.tintColor = .black
//        self.tabBar.backgroundColor = .white
//    }
//}

struct ScenePreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }
    }
}

