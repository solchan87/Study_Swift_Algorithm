import Foundation

public struct Stopwatch {
    public init() { }
    private var startTime: TimeInterval = 0.0;
    private var endTime: TimeInterval = 0.0;
    
    public mutating func start() {
        startTime = NSDate().timeIntervalSince1970;
    }
    
    public mutating func stop() -> TimeInterval {
        endTime = NSDate().timeIntervalSince1970;
        return endTime - startTime
    }
    
}
