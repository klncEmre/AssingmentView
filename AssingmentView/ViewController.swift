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
        assignmentView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40.0).isActive = true
        assignmentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        assignmentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        assignmentView.heightAnchor.constraint(equalToConstant: 200.0 ).isActive = true
        assignmentView.setImages(images: [
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image1-500kb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image2-500kb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image3-500kb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image4-500kb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image1-1mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image2-1mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image3-1mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image4-1mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image1-1_5mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image2-1_5mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image3-1_5mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image4-1_5mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image1-2mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image2-2mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image3-2mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image4-2mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image1-3mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image2-3mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image3-3mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image4-3mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image1-5mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image2-5mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image3-5mb.png",
            "https://db62cod6cnasq.cloudfront.net/user-media/0/image4-5mb.png"
        ])
    }
}

