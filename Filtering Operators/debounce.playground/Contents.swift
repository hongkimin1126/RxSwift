import UIKit
import RxSwift

/*:
 # debounce: 지정한 시간 안에 방출되는 것들은 전부 버리고 지나면 이전값중 마지막값 방출한다.
 */
//사용 예시: 검색기능. 문자열을 입력할때마다 검색을 하지 않고 문자열을 다 입력한 시점에 검색을 실행할수 있도록 사용.
//지정한 시간 안에 방출되는 것들은 전부 버리고 지나면 이전값중 마지막값 방출한다.

let disposeBag = DisposeBag()

let buttonTap = Observable<String>.create { observer in
   DispatchQueue.global().async {
      for i in 1...10 {
         observer.onNext("Tap \(i)")
         Thread.sleep(forTimeInterval: 0.3) //방출되고나며면 시간 누적이아니라 초기화된다.
      }
      
      Thread.sleep(forTimeInterval: 1)
      
      for i in 11...20 {
         observer.onNext("Tap \(i)")
         Thread.sleep(forTimeInterval: 0.5)
      }
      
      observer.onCompleted()
   }
   
   return Disposables.create {
      
   }
}

buttonTap
    .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)//milliseconds(1000): 1초 안에 방출되는 것들은 다 버린고 지나면 이전값중 마지막값 방출한다. --> 10,20 이 방출된다.
   .subscribe { print($0) }
   .disposed(by: disposeBag)
