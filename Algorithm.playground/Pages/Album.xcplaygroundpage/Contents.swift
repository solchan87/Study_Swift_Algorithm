func solution3(_ genres:[String], _ plays:[Int]) -> [Int] {
  var genreList = Dictionary(zip(genres, plays.enumerated()), uniquingKeysWith: { return $0.element > $1.element ? $0: $1 }).sorted(by: { $0.value.element > $1.value.element }).compactMap { $0.value.offset }
  return genreList
}

solution3(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])
