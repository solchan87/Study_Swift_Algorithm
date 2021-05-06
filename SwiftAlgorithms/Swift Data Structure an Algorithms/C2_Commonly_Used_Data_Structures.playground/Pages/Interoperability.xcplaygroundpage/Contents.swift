import Foundation

var postalCode:NSString = NSString(format: "%d-%d", 32259, 1234)
var len = postalCode.length

@objc(ObjCMovieList)
class MovieList : NSObject {
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

if let url =  NSURLComponents(string: "http://[www].google.com") {
    
}
else {
    
}

import UIKit

public struct BadParticle {
    fileprivate var name: String
    fileprivate var symbol: String
    fileprivate var statistics: String
    fileprivate var image: UIImage
}

extension BadParticle{
    // Initializers
    init?(name: String, symbol: String, statistics: String, imageName: String){
        
        self.name = name
        self.symbol = symbol
        self.statistics = statistics
        if let image = UIImage(named: imageName){
            print("initialization succeeded")
            self.image = image
        }
        else {
            print("initialization failed")
            return nil
        }
    }
}


var badQuarkParticle = BadParticle(name: "Quark", symbol: "q", statistics: "Fermionic", imageName: "QuarkImage.tiff")


public struct Particle {
    private var name: String
    private var symbol: String
    private var statistics: String
    fileprivate var image: UIImage
    
    public init(name: String, symbol: String, statistics: String, image: UIImage){
        self.name = name
        self.symbol = symbol
        self.statistics = statistics
        self.image = image
    }
}

extension Particle{
    public func particalAsImage() -> UIImage {
        return self.image
    }
}

var aURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Quark_structure_pion.svg/2000px-Quark_structure_pion.svg.png")
let anImage = UIImage(contentsOf: aURL! as URL)

var quarkParticle = Particle(name: "Quark", symbol: "q", statistics: "Fermionic", image: anImage!)
let quarkImage = quarkParticle.particalAsImage()
