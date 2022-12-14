# AssignmentView

![AssignmentView Showcase](https://github.com/klncEmre/AssingmentView/blob/main/AssingmentView/AssignmentViewShowcase.png)

AssignmentView is a custom UICollectionView which can be implemented to your native iOS app easily. It is perfect fit for the projects that need UICollectionView to show list of images.


## Requirements

AssignmentView only requires  [KingFisher](https://github.com/onevcat/Kingfisher) Library to run.


## Usage 

Firstly, get the AssignmentView file to your project.

Create an instance from AsignmentView
```sh
let assignmentView = AssignmentView()
```

Now you can add it as subview and give the constraints. You don't have to give the constraints below. You can specify them according to your design. Its just an example.
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

## Features
You can inspect the loading time info of every image. Loading time will be printed to the console after image is showed to the user. 
You can change and send the loading time data to desired endpoint.
```sh
let endPointURL = "https://httpbin.org/post"
```
## Demo App
You can check demo app code from [this page](https://github.com/klncEmre/AssingmentView/blob/main/AssingmentView/ViewController.swift) .

If you want to show your images in demo app, you should change the source variable to your source url.
```sh
 let source = "your-source-url"
```

In order to change the source to another one, you need to have returned data as shown below. 
```sh
{
    "data": {
        "images": [
            "https://image1",
            "https://image2",
        ]
    }
}
```

