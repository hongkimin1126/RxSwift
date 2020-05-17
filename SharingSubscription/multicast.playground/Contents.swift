import UIKit
import RxSwift

/*:
 # multicast : 번거러워서 잘 사용하지 않는다. 즉시 방출하지 않고 connect()가 호출될때 까지 기다리고 있다고 호출시 방출한다.
 원래 여러 구독자가 구독을 할때 독릭적 시퀸스로 처리하지만 multicast를 사용하면 옵져버블이 방출하는 요소를 하난의 시퀸스로 처리한다.
 !! 쉽게 정의하면 하나의 시퀸스를 사용한다.
 */

let bag = DisposeBag()
let subject = PublishSubject<Int>()

//multicast에 옵져버블을 저장해 두었다가 connect이 호출되는 시점에서 방출과 구독을 시작한다,
let source = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance).take(5).multicast(subject)

source
    .subscribe { print("🔵", $0) }
    .disposed(by: bag)



source
    .delaySubscription(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe { print("🔴", $0) }
    .disposed(by: bag)


source.connect()
