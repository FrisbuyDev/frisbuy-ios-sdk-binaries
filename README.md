# FrisbuyStoriesSDK

FrisbuyStories позволяет вашему iOS приложению использовать Frisbuy виджет для просмотра и взимодействия с медиконтентом.

## Установка

### Через SPM

```
.package(name: "FrisbuyStories", url: "https://gitlab.com/frisbuy/mobile-sdk/frisbuy-ios-sdk-binaries", .upToNextMajor(from: "1.0.0")),
```

## Использование

```swift
import UIKit
import FrisbuyStoriesSDK

class ViewController: UIViewController {
    
    var frisbuyStories1: FrisbuyStories?
    var frisbuyStories2: FrisbuyStories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.frisbuyStories1 = FrisbuyStories(embedId: "623c78d7-5f73-11ed-8e80-0242ac130002", delegate: self, formStrory: .round)
        
        let height = UIScreen.main.bounds.width/3/0.7 + 100
        self.frisbuyStories1!.view!.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: height - 100)
        self.view.addSubview(self.frisbuyStories1!.view!)
        self.frisbuyStories1?.reloadData()

        self.frisbuyStories2 = FrisbuyStories(embedId: "623c78d7-5f73-11ed-8e80-0242ac130002", delegate: self, formStrory: .square)
        
        self.frisbuyStories2!.view!.frame = CGRect(x: 0, y: self.frisbuyStories1!.view!.frame.maxY + 16, width: UIScreen.main.bounds.width, height: height - 100)
        self.view.addSubview(self.frisbuyStories2!.view!)
        self.frisbuyStories2?.reloadData()

    }

}

extension ViewController: FrisbuyStoriesDelegate {
    func didSelect(link: Link) {
        //Товар выбран
    }

    func buyButtonTapped(link: Link) {
        //Товар добавлен в корзину
    }

}
```

