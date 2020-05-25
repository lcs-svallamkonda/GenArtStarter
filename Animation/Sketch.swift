import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Agent centre point
    let centre: Point
    let radius: Int
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // No fill on canvas
        canvas.drawShapesWithFill = false
        
        // Define properties of the agent
        centre = Point(x: canvas.width / 2, y: canvas.height / 2)
        radius = 20
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {

        // Draw a circle at this point
        canvas.drawEllipse(at: centre, width: radius * 2, height: radius * 2)
        
    }
    
}
