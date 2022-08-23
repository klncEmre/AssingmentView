//
//  ViewController.swift
//  AssingmentView DEMO APP!
//
//  Created by Emre Kılınç on 15.08.2022.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let assignmentView = AssignmentView()
    let source = "https://prod-storyly-media.s3.eu-west-1.amazonaws.com/sdk-test-scenarios/assignment.json"
   
    lazy var imageURLs: [String] = [] {
        didSet {
            assignmentView.setImages(images: imageURLs) //Data updated reload the collectionView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(assignmentView)
        assignmentView.translatesAutoresizingMaskIntoConstraints = false
        assignmentView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40.0).isActive = true
        assignmentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        assignmentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        assignmentView.heightAnchor.constraint(equalToConstant: 240 ).isActive = true
        
        getAndPassImageURLsToAssignmentView(source: self.source)
    }
}

extension ViewController {
    func getAndPassImageURLsToAssignmentView(source: String) {
        var localImageURLs: [String] = []
        if let url = URL(string: source) {
              URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                      let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                      if let safeData = json?["data"]?["images"] as? [String] {
                          for urlOfImage in safeData {
                              localImageURLs.append(urlOfImage)
                          }
                          self.imageURLs = localImageURLs
                      }
                  }
                  catch let error {
                      print(error.localizedDescription)
                  }
               }
           }.resume()
        }
    }
}
