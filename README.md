# AutoView
This is a way to create custom views with their own xibs and use them across multiple view controllers, cells etc... Properties can be easily set and customized independently for each view controller

## The Problem
Throughout my projects I had a problem where I have to use the same view in multiple places, and whenever I implement the layouts in the storyboards, things get messy when the storyboard grows and I have to keep track where I implemented each view. Things get more messy when I want to modify a subview inside these views (layout, color etc..), I had to go through all the storyboard to change them.

## How MSAutoView solves the problem
MSAutoView allows me to create a single layout xib, and reference it wherever I want it to appear. So I can create a Views folder and add all the xibs in it. Whenever I want to change a color or a layout, I can do it in this view and the change will reflect among all the instances

## Installation

MSAutoView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MSAutoView'
```

# Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Customizing The View](#customizing-the-view)
4. [Deployment](#deployment)
5. [Authors](#authors)
6. [License](#license)

## Prerequisites

- XCode 9


## Usage

1. Add a xib and give it any name (in my case it will be "ListingView")
![Image](https://user-images.githubusercontent.com/24646608/34810071-57e5fa72-f6ed-11e7-9ab1-a316210ea9fb.png)

2. Click on the xib

3. (For convenience) Go to attribute inspector and change the simulated metrics as below:

![Image](https://user-images.githubusercontent.com/24646608/34810212-fcc4b7a4-f6ed-11e7-98b6-698ce2bf11e8.png)

4. Add whatever views you want in the xib (Example):

![Image](https://user-images.githubusercontent.com/24646608/34810736-4aba90b6-f6f1-11e7-8765-803c93fd06df.png)

5. Create a Cocoa Touch Class and give it the same name as the xib (in my case it will be "ListingView"), **make sure it inherits from MSAutoView**

![Image](https://user-images.githubusercontent.com/24646608/34810665-dcc903da-f6f0-11e7-85a1-c0c4e5cbdd70.png)

6. Go back to the xib and click on the File's Owner in the Document Outline:

![Image](https://user-images.githubusercontent.com/24646608/34810829-b5e5afb0-f6f1-11e7-9f74-676b60d7cac6.png)

7. Click on the Identity Inspector and set the class to the cocoa touch class created in step 5 (in my case "ListingView")

![Image](https://user-images.githubusercontent.com/24646608/34810966-6839b2ba-f6f2-11e7-92b2-fbd6a0ef68d6.png)

8. Add a view to your storyboard
9. Set its class to the class created in step 5
10. Run the project, the view should contain the content of the xib

![Image](https://user-images.githubusercontent.com/24646608/34811158-9ee32e80-f6f3-11e7-9645-b488647af327.png)

## Customizing The View

- You can add outlets to the class created and connect them in the xib:

```swift
class ListingView: MSAutoView {

@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var detailsLabel: UILabel!
@IBOutlet weak var priceLabel: UILabel!

}
```

![Image](https://user-images.githubusercontent.com/24646608/34811291-55f0c16e-f6f4-11e7-9c6b-54f9f702417e.png)

- You can also add Inspectable variables and set them from the storyboard (**make sure the inspectable variables are not optionals or it won't work**):

```swift
class ListingView: MSAutoView {

@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var detailsLabel: UILabel!
@IBOutlet weak var priceLabel: UILabel!

@IBInspectable var title: String = "This is a default title"
@IBInspectable var details: String = "This is a default details"
@IBInspectable var price: Double = 300

override func awakeFromNib() {
super.awakeFromNib()
updateView()
}

func updateView() {
titleLabel.text = title
detailsLabel.text = details
priceLabel.text = String(describing: price)

}

}
```

![Image](https://user-images.githubusercontent.com/24646608/34811485-34100180-f6f5-11e7-9671-44705690d06b.png)

- You can also override the default values from the storyboard's attributes inspector for the view (**Make sure you don't set the attributes in the attribute inspector of the xib or they will override all other values**):

![Image](https://user-images.githubusercontent.com/24646608/34811582-a519fe26-f6f5-11e7-8d71-80bb77d8c55f.png)

This is the result:

![Image](https://user-images.githubusercontent.com/24646608/34811599-c514e92a-f6f5-11e7-9405-e85e7ced94d5.png)

- You can also create a reference for the view in the view controller's class and set its values:

```swift
class ViewController: UIViewController {

@IBOutlet weak var listingView: ListingView!

override func viewDidLoad() {
super.viewDidLoad()
listingView.title = "Title from View Controller"
listingView.details = "Details from View Controller"
listingView.price = 40
listingView.updateView()
}

}
```

![Image](https://user-images.githubusercontent.com/24646608/34811911-7f51df36-f6f7-11e7-9a48-fce96c59d195.png)

## Deployment

If you want to use the auto view in your own project just copy the AutoView Folder.

## Authors

* **Maher Santina** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/MaherKSantina/MSDialogViewController/blob/master/LICENSE) file for details

