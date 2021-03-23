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

func solution2(_ clothes:[[String]]) -> Int {
  
  let typeCounts = Set(clothes.compactMap { $0.last }).map { type in
    return clothes.filter({$0.last == type}).count + 1
  }
  
  return typeCounts.reduce(1, {$0 * $1}) - 1
}

//solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
//solution2([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
func solution3(_ genres:[String], _ plays:[Int]) -> [Int] {
  var genreList = Dictionary(zip(genres, plays.enumerated()), uniquingKeysWith: { return $0.element > $1.element ? $0: $1 }).sorted(by: { $0.value.element > $1.value.element }).compactMap { $0.value.offset }
  return genreList
}

solution3(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])
