import UIKit
import RxSwift

/*:
 # switchLatest
 */
//switchLatest: 가장 최근 옵져버블이 방출하는 이벤트를 방출. 지정한 옵져버블만 방출.

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let a = PublishSubject<String>()
let b = PublishSubject<String>()

let source = PublishSubject<Observable<String>>()

source
    .subscribe{print($0)}
    .disposed(by: bag)

a.onNext("1") //아직 옵져버블을 지정하지 않아서 무용지물코드.
b.onNext("b") //아직 옵져버블을 지정하지 않아서 무용지물코드.

source.onNext(a) //a로 옵져버블 지정

a.onNext("2") // 2가 방출된다
b.onNext("b") //옵져버블이 a로 지정되어있어서 b는 방출안됨.
