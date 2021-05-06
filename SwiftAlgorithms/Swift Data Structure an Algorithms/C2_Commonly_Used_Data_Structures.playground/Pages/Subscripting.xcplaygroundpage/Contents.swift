import Foundation

class MovieList {
  private var tracks = ["The Godfather", "The Dark Knight", "Pulp Fiction"]
  
  subscript(index: Int) -> String {
    
    get {
      return self.tracks[index]
    }
    
    set {
      self.tracks[index] = newValue
    }
  }
}

var movieList = MovieList()

var aMovie = movieList[0]

movieList[1] = "Forest Gump"
aMovie = movieList[1]
