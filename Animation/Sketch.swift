import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Tortoise to draw with
    let turtle : Tortoise
    
    // Total polygons to draw
    let polygonCount: Int = 50
    
    // Initial radius of pentagon
    let startingRadius: CGFloat = 60
    
    // Parameters to control spread of sine wave used to rotate polygons
    let amplitude: CGFloat = 10
    let horizontalScaling: CGFloat = 0.5
    
    // A bit of randomness so that each time the drawing is made, it looks a bit different
    let noiseFactor = CGFloat.random(in: -100...100) / 10.0

    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Create turtle to draw with
        turtle = Tortoise(drawingUpon: canvas)
                
        // Animate slowly
        canvas.framesPerSecond = 1
        

    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Required to bring canvas into same orientation and origin position as last run of draw() function
        turtle.restoreStateOnCanvas()
        
        // Only draw a polygon in the first 50 frames
        if canvas.frameCount < polygonCount {

            // Grow the radius a bit each time, so the next pentagon is a bit bigger
            let currentRadius = startingRadius + CGFloat(canvas.frameCount) * 6.0

            // Now actually draw the polygon
            drawPolygonWith(sideCount: 5, centrePoint: Point(x: 250, y: 250), radius: currentRadius, rotation: 0)

        }

        
    }
    
    // Draws a polygon centred at the indicated point with the given radius and number of sides.
    func drawPolygonWith(sideCount: Int, centrePoint: Point, radius: CGFloat, rotation: Degrees) {
        
        // Pick up pen to go to outside edge of polygon
        turtle.penUp()
        
        // Draw each side of the polygon
        for n in 0...sideCount {
            
            // NOTE: Based on details provided here https://stackoverflow.com/questions/7198144/how-to-draw-a-n-sided-regular-polygon-in-cartesian-coordinates#7198179
            let xPartial: CGFloat = cos(2 * CGFloat.pi * CGFloat(n) / CGFloat(sideCount) + rotation)
            let yPartial: CGFloat = sin(2 * CGFloat.pi * CGFloat(n) / CGFloat(sideCount) + rotation)
            
            let nextX = radius * xPartial + centrePoint.x
            let nextY = radius * yPartial + centrePoint.y

            let nextVertex = Point(x: nextX,
                                   y: nextY)
            
            turtle.setPosition(to: nextVertex)
            
            // Put the pen down to start drawing vertices
            turtle.penDown()
            
        }
        
        
    }
}
