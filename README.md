# AssignmentView

![AssignmentView Showcase](https://github.com/klncEmre/AssingmentView/blob/main/AssingmentView/AssignmentViewShowcase.png)

AssignmentView is a custom UICollectionView which can be implemented to your native iOS app easily. It is perfect fit for the projects that need UICollectionView to show list of images.


## Requirements

AssignmentView only requires  [KingFisher](https://github.com/onevcat/Kingfisher) Library to run.


## Usage 

Firstly, get the AssignmentView file to your project.

Create a instance from AsignmentView
```sh
let assignmentView = AssignmentView()
```

Now you can add it as subview and give the constraints.
```sh
    view.addSubview(assignmentView)
    assignmentView.translatesAutoresizingMaskIntoConstraints = false
    assignmentView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40.0).isActive = true
    assignmentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    assignmentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    assigmentView.heightAnchor.constraint(equalToConstant: 240 ).isActive = true
```

Prepare your array of imageURLs.
```sh
let yourImageURLs = ["yourAmazingImageURL", "yourAmazingImage2URL"]
```
Set the imageURLs with setImages method.
```sh
assignmentView.setImages(images: yourImageURLs)
```
That's it!
