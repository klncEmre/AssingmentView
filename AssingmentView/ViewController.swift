//
//  ViewController.swift
//  AssingmentView DEMO APP!
//
//  Created by Emre Kılınç on 15.08.2022.
//

import UIKit
import Kingfisher
class ViewController: UIViewController, UICollectionViewDelegate {
    
    let imageView = UIImageView()
    let assignmentView = AssignmentView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(assignmentView)
        assignmentView.translatesAutoresizingMaskIntoConstraints = false
        assignmentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        assignmentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        assignmentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        assignmentView.heightAnchor.constraint(equalToConstant: 200.0 ).isActive = true
        assignmentView.setImages(images: ["https://db62cod6cnasq.cloudfront.net/user-media/0/image1-500kb.png"])
        
        // Do any additional setup after loading the view.
    }
}

//imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        let url = URL(string: "https://db62cod6cnasq.cloudfront.net/user-media/0/image4-5mb.png")
//        imageView.kf.indicatorType = .activity
//        imageView.kf.setImage(
//            with: url,
//            placeholder: UIImage(systemName: "loading" ),
//            options: [
//                .scaleFactor(UIScreen.main.scale),
//                .transition(.fade(1)),
//                .cacheOriginalImage
//            ])
//        {
//            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//            case .failure(let error):
//                print("Job failed: \(error.localizedDescription)")
//            }
//        }
