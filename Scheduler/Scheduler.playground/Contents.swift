import UIKit
import RxSwift

/*:
 # Scheduler: GCD개념임
 
 Main Queue(GCD) --> Main Scheduler(RxSwift)
 Global Queue(GCD) --> Backgrounf Scheduler(RxSwift)
 */

let bag = DisposeBag()

let backgroundScheduler = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())

Observable.of(1, 2, 3, 4, 5, 6, 7, 8, 9)
    .subscribeOn(MainScheduler.instance)//subscribeOn은 옵져버블의 시작 위치를 말함. 코드의 위치는 상관없다.
    .filter { num -> Bool in
        print(Thread.isMainThread ? "Main Thread" : "Background Thread", ">> filter")
        return num.isMultiple(of: 2)
}
    .observeOn(backgroundScheduler) //observeOn 은 뒤에 부터 지정한 스케쥴러가 적용된다. 선언 이전은 적용 안된다. 여기서는 map가 해당.
    .map { num -> Int in
        print(Thread.isMainThread ? "Main Thread" : "Background Thread", ">> map")
        return num * 2
}
.subscribe {
    print(Thread.isMainThread ? "Main Thread" : "Background Thread", ">> subscribe")
    print($0)
    
}
    .disposed(by: bag)
