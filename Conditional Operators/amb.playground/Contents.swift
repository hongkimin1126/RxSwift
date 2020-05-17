import UIKit
import RxSwift

/*:
 # amb
 */
//amb: 여러 옵져버블중에 가장빠른 옵져버블을 선택하여 방출한다.
//여러 서버로 요청을 전달하고 가장빠른 응답을 처리하는 패턴을 구현가능.


let bag = DisposeBag()

enum MyError: Error {
    case error
}

let a = PublishSubject<String>()
let b = PublishSubject<String>()
let c = PublishSubject<String>()


//a와b 중에 빠른것을 방출

a.amb(b)
    .subscribe{print($0)}
    .disposed(by: bag)

a.onNext("A") //a가 먼정 방출이라서 밑에 b는 방출 안됨.
b.onNext("B")

b.onCompleted()
a.onCompleted()

//3개 이상일경우.
//Observable.amb([a,b,c])
//    .subscribe{print($0)}
//    .disposed(by: bag)
