import UIKit
import RxSwift

/*:
 # combineLatest
 */
//combineLatest: 두 요소위 마지막 값끼리 합친다

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let greetings = PublishSubject<String>()
let languages = PublishSubject<String>()

Observable.combineLatest(greetings, languages) {"\($0) \($1)"}
    .subscribe{print($0)}
    .disposed(by: bag)

//배열로 사용할 경우
//Observable.combineLatest([greetings, languages]) {"\($0[0]) \($0[1])"}
//.subscribe{print($0)}
//.disposed(by: bag)

greetings.onNext("Hi")
languages.onNext("World!")

greetings.onNext("Hello")
languages.onNext("RxSwift!")

greetings.onCompleted() // Completed 하면 해당 방출값중 가장 마지막값 사용. 여기서는 ("Hello")임.
languages.onNext("RxSwiftUI!") //--> next(Hello RxSwiftUI!)

languages.onCompleted() //greetings, languages 모두 Completed 되었기에 더이상 이벤트 못받는다.
