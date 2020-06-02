import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas: Canvas
    
    // Create an array of many agents
    var agents: [Agent] = []
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 700, height: 700)
        
        // No fill on canvas
        canvas.drawShapesWithFill = false
        
        // Create many instances of the Agent structure
        for _ in 1...2 {
            
            let anotherAgent = Agent(centre: Point(x: canvas.width / 2, y: canvas.height / 2),
                                     radius: Int.random(in: 25...50),
                                     velocity: Vector(x: Double.random(in: -2...2),
                                                      y: Double.random(in: -2...2)),
                                     drawsUpon: canvas)
            
            agents.append(anotherAgent)
            
        }
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
       
        // Clear the canvas
       // clearCanvas()
        
        // Update the position of the agent
        for agent in agents {
            agent.update(drawingBoundary: false)
        }
        
        //Manually check for overlap between the two circles
        if agents[0].isOverlapping(this: agents[1]) {
            canvas.drawLine(from: agents[0].centre, to: agents[1].centre)
        }
        
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
