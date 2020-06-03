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
        for _ in 1...50 {
            
            let anotherAgent = Agent(centre: Point(x: canvas.width / 2, y: canvas.height / 2),
                                     radius: Int.random(in: 35...55),
                                     velocity: Vector(x: Double.random(in: -2...2),
                                                      y: Double.random(in: -2...2)),
                                     drawsUpon: canvas)
            
            agents.append(anotherAgent)
            
        }
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
       
        // Clear the canvas
        //clearCanvas()
        
        // Update the position of the agent
        for agent in agents {
            agent.update(drawingBoundary: false)
        }
        
//        //Manually check for overlap between the two circles
//        if agents[0].isOverlapping(this: agents[1]) {
//            canvas.drawLine(from: agents[0].centre, to: agents[1].centre)
//        }
//        if agents[0].isOverlapping(this: agents[2]) {
//            canvas.drawLine(from: agents[0].centre, to: agents[2].centre)
//        }
//        if agents[0].isOverlapping(this: agents[3]) {
//            canvas.drawLine(from: agents[0].centre, to: agents[3].centre)
//        }
//        if agents[1].isOverlapping(this: agents[2]) {
//            canvas.drawLine(from: agents[1].centre, to: agents[2].centre)
//        }
//        if agents[1].isOverlapping(this: agents[3]) {
//            canvas.drawLine(from: agents[1].centre, to: agents[3].centre)
//        }
//        if agents[2].isOverlapping(this: agents[3]) {
//            canvas.drawLine(from: agents[2].centre, to: agents[3].centre)
//        }
      
        //Left side (agent checking)
        for i in 0...agents.count - 2 {
            
            //Right side (agent being checked)
            for j in (i + 1)...agents.count - 1 {
                
//                let a = distanceBetween(a: agents[i].centre, b: agents[j].centre)
//                print(a)
                //let a = Int.random(in: 1...400)
                let distance = map(value: Double(distanceBetween(a: agents[i].centre, b: agents[j].centre)), fromLower: 0, fromUpper: 110, toLower: 0, toUpper: 100)
                canvas.lineColor = Color.init(hue: 210, saturation: 0, brightness: Int(distance), alpha: 3)
                if agents[i].isOverlapping(this: agents[j]) {
                    canvas.drawLine(from: agents[i].centre, to: agents[j].centre)
                }
            }
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
    
    //get the distance between one point and another point
    func distanceBetween(a: Point, b: Point) -> CGFloat {
        
        //length of a line segment formula
        return sqrt( pow(b.x - a.x, 2) + pow(b.y - a.y, 2) )
    }
   
}
