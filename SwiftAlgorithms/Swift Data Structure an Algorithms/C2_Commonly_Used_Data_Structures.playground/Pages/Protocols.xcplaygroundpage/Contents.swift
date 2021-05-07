import UIKit

protocol MyProtocol {
    var name: String { get }
    
    func convertToImage() -> UIImage
}


struct Particle {
    var name: String
    var symbol: String
    var statistics: String
}

struct PatricleList: ExpressibleByArrayLiteral {
    
    private let items: [Particle]
    
    init(arrayLiteral: Particle...) {
        self.items = arrayLiteral
    }
}

var p1 = Particle(name: "Quark", symbol: "q", statistics: "Fermionic")
var p2 = Particle(name: "Lepton", symbol: "l", statistics: "Fermionic")
var p3 = Particle(name: "Photon", symbol: "Y", statistics: "Bosonic")

var particleList = [p1, p2, p3]
