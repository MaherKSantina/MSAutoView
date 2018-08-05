# MSAutoView

To create an iOS app, you have to deal with ALOT of views. So, managing different views will become painful as the project grows. Sometimes, a single view will be used in multiple places with small variations. You feel that if there's a way to manage every view in one place would save you alot of trouble. Well, this is what MSAutoView does exactly.

# Table of Contents
1. [Installation](#installation)
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Customization](#customization)
4. [Deployment](#deployment)
5. [Authors](#authors)
6. [License](#license)

## Installation

MSAutoView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MSAutoView'
```

## Prerequisites

- XCode 9


## Structure
This is an example of how your view files will be structured when using MSAutoView:
![Image](https://user-images.githubusercontent.com/24646608/43649568-d343d6c4-9780-11e8-952b-bf9523f82dbd.png)

Each view will have its own xib file and swift file. The xib file will contain the view hierarchy, and the swift file will hold the logic for this view.

## Usage
### Minimal Configuration
#### Storyboard

1. Create a xib file and add the reusable view to it (Example):

    ![Image](https://user-images.githubusercontent.com/24646608/34810736-4aba90b6-f6f1-11e7-8765-803c93fd06df.png)

2. Create a swift file and add a class that inherits from `MSAutoView`

```swift
import UIKit
import MSAutoView

class ListingView: MSAutoView {

}
```
**Note: For the minimal configuration to work, the class's name should be the same as the xib's name**

8. Add a normal view to your storyboard
9. Set its class to the one created
10. Run the project, the view should contain the content of the xib

    ![Image](https://user-images.githubusercontent.com/24646608/34811158-9ee32e80-f6f3-11e7-9645-b488647af327.png)
    
## Customization
### Updating Views Programmatically

Ofcourse, the reusable view will be useless if you can't pass data to it programmatically. To do that, follow the steps below:

1. Set the xib `File's Owner` class to the class created previously

2. Add outlets to the class:

```swift
class ListingView: MSAutoView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
}
```

3. In the xib file, connect the outlets to their respective views

4. In the class file, create the logic to set values to the views:

```swift
class ListingView: MSAutoView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var title: String?
    var details: String?
    var price: String?
    
    override func updateView() {
        super.updateView()
        titleLabel.text = title
        detailsLabel.text = details
        priceLabel.text = price
        
    }
    
}
```
5. In the view controller, create an outlet for the view

```swift
@IBOutlet weak var listingView: ListingView!
```

6. Connect the view's outlet to the storyboard view

7. Set the values anywhere in the view controller and update the view:
```swift
listingView.title = "This is a default title"
listingView.details =  "This is a default details"
listingView.price = "300"
listingView.updateView()
```

## Authors

* **Maher Santina** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/MaherKSantina/MSDialogViewController/blob/master/LICENSE) file for details
