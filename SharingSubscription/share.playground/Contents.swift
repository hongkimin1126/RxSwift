import UIKit
import RxSwift

/*:
 # share: 2개의 파라미터를 받고 (replay: 5, scope: .forever)에서 replay연산자는 버퍼의 크기임 기본값으로 0이고 multicast로 간주함, 두번째 파라미터는
 forever와 whileConnected 값을 가지며, whileConnected는  connect가 새로 될때마다 새로운 subject를 생성하며 사용.
 

 */

let bag = DisposeBag()


let source = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance).debug().share(replay: 5, scope: .forever) // scope: .forever 하게 되먄 전체가 공유된다.


let observer1 = source
    .subscribe { print("🔵", $0) }

let observer2 = source
    .delaySubscription(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe { print("🔴", $0) }

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    observer1.dispose()
    observer2.dispose()
}



DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
    let observer3 = source.subscribe { print("⚫️", $0) }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        observer3.dispose()
    }
}
