import UIKit
import RxSwift

/*:
 # refCount: connect가 구독을 시작하는 타이밍에서 자동으로 실행되고 구독을 해지(dispose) 하면 자동으로 connect가 해지 된다.
 자동문 개념임!!!!!
 */

let bag = DisposeBag()
let source = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance).debug().publish().refCount()

let observer1 = source
    .subscribe { print("🔵", $0) }

//source.connect()  //위에서 refCount() 하였기 때문에 자동으로 connect가 되기때문에 필요없는 구문임.

DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    observer1.dispose()
}

//DispatchQueue.main.asyncAfter(deadline: .now() + 7) { //밑에 꺼 랑 비교해보기!!!!!
//    let observer2 = source.subscribe { print("🔴", $0) }
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//        observer2.dispose()
//    }

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    let observer2 = source.subscribe { print("🔴", $0) }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        observer2.dispose()
    }
    
    
}
