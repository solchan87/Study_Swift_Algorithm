import Foundation

// 제곱 연산을 사용하기 위해 infix 연산자를 추가한다.
precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
  return Int(pow(Double(radix), Double(power)))
}

public class StringSearch {
  // 문자열 배열을 활용한 브루트 포스 구현
  public static func bruteForce(search pattern:[Character], in text:[Character]) {
    // m과 n을 추출함
    let m = pattern.count - 1
    let n = text.count - 1
    // 텍스트에서 패턴을 검색
    for index in 0...n - m {
      let substringToMatch = text[index...index+m]
      print(substringToMatch)
      if substringToMatch == pattern[0...m] {
        print("Pattern found")
      }
    }
  }
  
  // 스트링을 활용한 브루트 포스 구현
  public static func bruteForce(search pattern:String, in text:String) {
    // m과 n을 추출함
    let m = pattern.count
    let n = text.count
    
    // 텍스트 내 패턴 검색
    for index in 0...n - m {
      let start = text.index(text.startIndex, offsetBy: index)
      let end = text.index(text.startIndex, offsetBy: index + m - 1)
      let substringToMatch = text[start...end]
      print(substringToMatch)
      
      if substringToMatch == pattern {
        print("Pattern found")
      }
    }
  }
  
  
  // 라빈카프 알고리즘
  public static func rabinKarpNumbers(search pattern:String, in text:String, modulo:Int, base:Int) {
    // 1. 초기화
    
    // Put the pattern and the text into arrays of strings ->
    // So "123" will be ["1","2","3"]
    let patternArray = pattern.map { String($0) }
    let textArray = text.map { String($0) }
    
    let n = textArray.count
    let m = patternArray.count
    let h = (base ^^ (m-1)) % modulo
    var patternModulo = 0
    var lastTextModulo = 0
    
    // 2. 패턴 modulo와 텍스트의 첫 번째 자릿수의 modulo를 계산한다.
    for i in 0...m-1 {
      guard let nextPatternDigit = Int(patternArray[i]),
            let nextTextDigit = Int(textArray[i]) else {
        print("Error")
        return
      }
      patternModulo = (base * patternModulo + nextPatternDigit) % modulo
      lastTextModulo = (base * lastTextModulo + nextTextDigit) % modulo
    }
    
    // 3. 동등 여부를 확인하고, 다음 자릿수의 modulo를 계산한다.
    for s in 0...n - m - 1 {
      // 패턴 모듈로를 이용해서 마지막 모듈로를 계산한다.
      if patternModulo == lastTextModulo {
        // 동등한 모듈로를 찾았다. 이제 이들 숫자 조합의 모든 자리수도 같은지 확인한다.
        // 자릿수가 일부 달라도 모듈로는 같은 수 있으므로 확인 작업이 필요하다.
        let substringToMatch = textArray[s...s + m - 1].joined(separator: "")
        if pattern == substringToMatch {
          print("Pattern occurs at shift: " + "\(s)")
        }else {
          print("Same modulo but not same pattern: " + "\(s)")
        }
      }
      // 다음 숫자 그룹의 모듈로를 계산한다.
      if s < n - m {
        guard let highOrderDigit = Int(textArray[s]),
              let lowOrderDigit = Int(textArray[s + m]) else {
          print("Error")
          return
        }
        // 다음 모듈로를 계산하려면 숫자 그룹 왼쪽에 위치한 높은 단위의 모듈로를 빼고, 다음 단계에서 낮은 단위의 모듈로를 더한다.
        
        //1. 높은 단위 자릿수의 모듈로를 뺀다.
        var substractedHighOrderDigit = (base*(lastTextModulo - highOrderDigit * h)) % modulo
        if substractedHighOrderDigit < 0 {
          // 모듈로가 음수인 경우, 이를 양수로 바꾼다.
          // (스위프트 % 연산자는 나머지 연산자이지 modulo의 연산자가 아니기 때문)
          substractedHighOrderDigit = substractedHighOrderDigit + modulo
        }
        
        //2. 새로운 낮은 단위 자릿수를 더한다.
        var next = (substractedHighOrderDigit + lowOrderDigit) % modulo;
        if (next < 0) {
          // 모듈로가 음수인 경우, 이를 양수로 바꾼다
          // (스위프트의 % 연산자는 나머지 연산자이지 modulo의 연산자가 아니기 때문)
          next = (next + modulo);
        }
        
        lastTextModulo = next
      }
    }
  }
}
