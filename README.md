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
	var padding: UIEdgeInsets?
	var bigView = UIScrollView()
	var isVisible = false

	override func viewDidLoad() {
    	super.viewDidLoad()

    	self.view.backgroundColor = .white

    	padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)    	

        self.frisbuyStories1 = FrisbuyStories(embedId: "42a298f5-77bc-11ee-90cf-0242ac130002", isAlbums: false, delegate: self, formStrory: .square, space: 16, paddings: padding, contentBorder: 2, isHorizontalScroll: isHorizontalScroll1, heightWidget: heightWidget1, rimColor: UIColor.green, isSaveResult: false, isReactNative: false, countElements: 20)

    	let height = UIScreen.main.bounds.width/3/0.7 + 100
    	self.bigView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    	self.bigView.contentSize = CGSize(width:  UIScreen.main.bounds.width, height: 1000)
    	self.frisbuyStories1?.view?.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: height - 60)
    	self.view.addSubview(bigView)
    	self.bigView.addSubview(self.frisbuyStories1!.view!)
    	self.frisbuyStories1?.reloadData()
        self.bigView.delegate = self

// Данные callback можно использовать для аналитики. 

    	self.frisbuyStories1?.dataReceived = { status in
        	//Bool статус о том загружены или не загружены данные с сервера. Событие для аналитики: frisbuy_sr_load, параметры: embed_id
    	}

    	self.frisbuyStories1?.clickedPost = { postId in
        	//клик по посту в сториз, событие frisbuy_sr_clickpost, параметры embed_id и post_id = postId
    	}

    	self.frisbuyStories1?.clickedAlbum = { albumId in
        	//клик по альбому, событие frisbuy_sr_clickpost, параметры embed_id и post_id = albumId
    	}

    	self.frisbuyStories1?.watchedPost = { postId in
        	//Просмотр постов сториз. Событие для аналитики: frisbuy_sr_viewpost, параметры: параметры embed_id и post_id = postId. После просмотра каждого поста, отправляется его postId. 
    	}

    	self.frisbuyStories1?.swipedPost = { swipedStatus in
            	// Bool был ли факт просмотра всего виджета до конца. Если пользователь доскроллит ленту сториз\альбомов до конца, то swipedStatus примет значение true.  Событие для аналитики: frisbuy_sr_swipe, параметры: embed_id
    	}
   }
}










extension ViewController: FrisbuyStoriesDelegate {
	func didSelect(link: Link, postId: String) {
    	//"Товар выбран" postId - id поста с которого перешли на товар.
Событие для аналитики frisbuy_sr_clicklink, параметры embed_id, post_id = postId, link_id = link.id, link_label = link.title
	}
    
	func buyButtonTapped(link: Link, postId: String) {
    	//"Товар добавлен в корзину"  postId - id поста с которого перешли на товар
Событие для аналитики frisbuy_sr_clicklink, параметры embed_id, post_id = postId, link_id = link.id, link_label = link.title
	}
}


//Это расширение необходимо для определения видимости виджета на экране, при условии, что вы используете UIScrollView.

extension ViewController: UIScrollViewDelegate {

  	func scrollViewDidScroll(_ scrollView: UIScrollView) {

      	guard let isVisible = frisbuyStories1?.view.isViewVisible else { return }

      	if self.isVisible != isVisible {
          	self.isVisible = isVisible
// Если вы используете ScrollView  на экране и важен факт видно или не видно виджет, то переменная isVisible: Bool поможет вам с этим. Метод срабатывает однократно при изменении статуса. Это событие: frisbuy_sr_eyesigh, параметр: embed_id 
      	}
	}
}


//Данное расширение нужно для определения видимости view на экране. 

public extension UIView {
	var isViewVisible: Bool {
     	func isVisible(view: UIView, inView: UIView?) -> Bool {
         	guard let inView = inView else { return true }
         	let viewFrame = inView.convert(view.bounds, from: view)
         	if viewFrame.intersects(inView.bounds) {
             	return isVisible(view: view, inView: inView.superview)
         	}
         	return false
     	}
     	return isVisible(view: self, inView: self.superview)
 	}
 }


Вы можете изменить следующие размеры для виджета

Параметры задаются при инициализации виджета:

var padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

self.frisbuyStories1 = FrisbuyStories(embedId: "XXXX-XXXX-XXXX-XXXXXXXXX", isAlbums: false, delegate: self, formStrory: .round, space: 45, paddings: padding, contentBorder: 2)


Расстояние между ячейками: space 
Толщину окружности вокруг виджета: contentBorder
Вариант представления виджета прямоугольный или круглый: formStrory: .square\.round 
Вариант сториз или хайлайт: isAlbums - false\true соответственно
Выбор ID виджета для вывода:  embedId: "XXXX-XXXX-XXXX-XXXXXXXXX"
```

