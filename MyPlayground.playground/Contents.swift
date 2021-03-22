import Foundation

func solution(_ clothes:[[String]]) -> Int {
  var combinations: Int = 1
  var clothesCount: [String: Int] = .init()
  
  clothes.forEach {
    if let cc = clothesCount[$0[1]] {
      clothesCount[$0[1]] = cc + 1
    }else {
      clothesCount[$0[1]] = 1
    }
  }
  
  clothesCount.forEach {
    combinations *= ($0.value + 1)
  }
  return combinations - 1
}

solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
