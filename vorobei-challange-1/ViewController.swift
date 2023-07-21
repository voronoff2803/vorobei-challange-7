//
//  ViewController.swift
//  vorobei-challange-1
//
//  Created by Alexey Voronov on 03.07.2023.
//

import UIKit

class StretchableHeaderViewController: UIViewController, UIScrollViewDelegate {
    // Create a reference to the scroll view and the image view
    private var scrollView: UIScrollView!
    private var imageView: UIImageView!
    
    let initialImageHeight: CGFloat = 270
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the scroll view
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
        view.addSubview(scrollView)
        
        // Set up the image view
        imageView = UIImageView(image: UIImage(named: "header_image"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        // Calculate the initial frame for the image view
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: initialImageHeight)
        scrollView.addSubview(imageView)

        // Adjust the content inset of the scroll view to account for the stretching header
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            imageView.frame.origin.y = offsetY
            imageView.frame.size.height = -offsetY + initialImageHeight

            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: -offsetY + initialImageHeight, left: 0, bottom: 0, right: 0)
        }
    }
}
