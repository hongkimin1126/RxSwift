 import UIKit
 import RxSwift

 /*:
  # map
  */


 //map: xcode map와는 전혀 다름!!! forEach와 같은기능

 let disposeBag = DisposeBag()
 let skills = ["Swift", "SwiftUI", "RxSwift"]


 Observable
     .from(skills)
     .map{"Hello, \($0)"}//forEach와 같은기능 --> next(Hello, Swift), next(Hello, SwiftUI), next(Hello, RxSwift) 하나씩 방출됨!
     .subscribe{print($0)}
     .disposed(by: disposeBag)
