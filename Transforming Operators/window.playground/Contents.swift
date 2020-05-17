import UIKit
import RxSwift

/*:
 # window
 */

//옵져버블이 1초에 1씩 증가시키켜 방출하고, window는 최대 2초마다 최대 3개씩 방출한다.

let disposeBag = DisposeBag()


Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .window(timeSpan: .seconds(2), count: 3, scheduler: MainScheduler.instance)
    .take(5)
    .subscribe{
        print($0)
        
        if let observable = $0.element {
            observable.subscribe{print("inner: ", $0)}
        }
}
    .disposed(by: disposeBag)
