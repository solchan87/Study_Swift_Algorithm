import Foundation

/*
 코드의 실행시간을 측정하기 위해 스톱워치를 사용하는 방법
 
 */

// 타이머 초기화
var timer = Stopwatch()

timer.start()

for counter:Int in 1...1000 {
    let a = counter
}

// 경과시간 프린트
print("Elapsed time \(timer.stop())")
