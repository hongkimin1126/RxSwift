import UIKit
import RxSwift

/*:
 # throttle
 ## latest parameter
 */

let disposeBag = DisposeBag()

func currentTimeString() -> String {
   let f = DateFormatter()
   f.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
   return f.string(from: Date())
}

//latest: true로 하고 인터벌을 2.5초로 하면 초기값 이후에 2.5초 지나고 방출된 값 중에 가장 마지막 요소를 방출한다 그래서 0 다음에 2,5,7,9 이런식으로 방출됨. --> (=<) 작거나 같은거.
//latest: false로 하고 인터벌을 2.5초로 하면 2.5초 지나고 방출된 값 중 직후의 값만 방출 0 다음에 3,6,9 가 방출된다. --> (>) 무족건 큰거
// 9는 마지막값이라서 출력 된것임. 컴퓨터가 이상한 놈임....

//Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//   .debug()
//   .take(10)
//   .throttle(.milliseconds(2500), latest: true, scheduler: MainScheduler.instance)
//   .subscribe { print(currentTimeString(), $0) }
//   .disposed(by: disposeBag)


Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
   .debug()
   .take(10)
   .throttle(.milliseconds(2500), latest: false, scheduler: MainScheduler.instance)
   .subscribe { print(currentTimeString(), $0) }
   .disposed(by: disposeBag)
