//
//  AssignmentView.swift
//  AssingmentView itself.
//
//  Created by Emre Kılınç on 15.08.2022.
//

import Foundation
import UIKit
import Kingfisher

class AssignmentView: UICollectionView {
    
    private let endPointURL = "https://httpbin.org/post"
    
    private lazy var imageURLs:[String] = []
    private lazy var readyImages: [UIImageView] = []
    private lazy var loadStartMoments:[String:Double] = [:]
    
    init(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 110, height: 200)
        layout.scrollDirection = .horizontal
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
       
        self.dataSource = self
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AssignmentView { 
    public func setImages(images:[String]){
        self.imageURLs = images
        getImagesFromInternet()
    }
}

extension AssignmentView {
    private func getImagesFromInternet() {
        for imageUrl in imageURLs {
            DispatchQueue.main.async {
               // UI work here
                let customImageView = UIImageView()
                let url = URL(string: imageUrl)
                customImageView.kf.indicatorType = .activity
                
                self.loadStartMoments[imageUrl] = Date().timeIntervalSince1970 //save the time to calculate the load time later.
                customImageView.kf.setImage(
                    with: url,
                    placeholder: UIImage(systemName: "circle.dotted" ),
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage,
                    ]) {  [weak self] result in
                    switch result {
                    case .success(let value):
                        self?.readyImages.append(customImageView)
                        self?.reloadData()
                        self?.logTimeDifferenceForImage(from: self?.loadStartMoments[value.source.url?.absoluteString ?? ""] ?? 0.0, to: Date().timeIntervalSince1970,identifier:value.source.url?.absoluteString ?? "")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    private func logTimeDifferenceForImage(from: TimeInterval, to: TimeInterval, identifier: String) {
        let timeDifference = (to - from)
        print("Task done for: \(identifier) \n - Load Time was: \(timeDifference) seconds \n")
        passLoadTimeDataToEndPoint(identifier: identifier, loadTime: timeDifference)
    }
}

extension AssignmentView {
    private func passLoadTimeDataToEndPoint(identifier:String, loadTime: Double){
        let json = ["loadTime":[identifier:loadTime]]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
  
        guard let url = URL(string: self.endPointURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data") //HANDLE ERROR HERE
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON) //HANDLE DATA HERE
            }
        }.resume()
    }
}

extension AssignmentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return readyImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.white
        let imageViewReady = readyImages[indexPath.row]
        cell.addSubview(imageViewReady)
      
        imageViewReady.translatesAutoresizingMaskIntoConstraints = false
        imageViewReady.widthAnchor.constraint(equalTo: cell.widthAnchor).isActive = true
        imageViewReady.heightAnchor.constraint(equalTo: cell.heightAnchor ).isActive = true
        imageViewReady.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        imageViewReady.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        return cell
    }
}


/**
 #my notes
 *  you need to do parse json operations in the demo page
 * you will give list of url to AssignmentView with a custom method in Demo Page.( AssignmentView.setImages(url: "url.com")
 * one private  method to add a log for load times.
 
 *save the date at the beginning of request and at the result calculate the difference with the correct(you may use dictionary for this purpose) saved date then print it. 
 */

