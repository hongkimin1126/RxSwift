
import UIKit
import RxSwift

/*:
 # interval: 원하는 시간간견으로 1씩 무한정 증각하는 요소 방출.
 */


let i = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)

let subscription1 = i.subscribe{print("1>> \($0)")}

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription1.dispose()
}

var subscription2: Disposable?

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    subscription2 = i.subscribe{print("2>> \($0)")}
}

DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
    subscription2?.dispose()
}
