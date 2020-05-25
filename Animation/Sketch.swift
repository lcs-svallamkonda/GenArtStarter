import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas: Canvas
    
    // Create an agent
    var someAgent: Agent
        
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // No fill on canvas
        canvas.drawShapesWithFill = false
        
        // Define properties of the agent
        someAgent = Agent(centre: Point(x: canvas.width / 2, y: canvas.height / 2),
                          radius: 20,
                          velocity: Vector(x: Double.random(in: -2...2),
                                           y: Double.random(in: -2...2)),
                          drawsUpon: canvas)
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Clear the canvas
        clearCanvas()
        
        // Update the position of the agent
        someAgent.update()
        
    }
    
    // Clear the canvas
    func clearCanvas() {
        
        // "Clear" the canvas after each draw
        canvas.drawShapesWithBorders = false
        canvas.drawShapesWithFill = true
        canvas.fillColor = .white
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height)
        canvas.drawShapesWithFill = false
        canvas.drawShapesWithBorders = true
        
    }
    
}
