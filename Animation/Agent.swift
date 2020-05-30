//
//  Agent.swift
//  Animation
//
//  Created by Russell Gordon on 2020-05-25.
//  Copyright © 2020 Royal St. George's College. All rights reserved.
//

import Foundation
import CanvasGraphics

class Agent {

    // Agent properties
    var centre: Point
    let radius: Int
    var velocity: Vector
    
    // Canvas the agent will be drawn upon
    var c: Canvas

    // Initialize the agent
    init(centre: Point, radius: Int, velocity: Vector, drawsUpon: Canvas) {
        
        self.centre = centre
        self.radius = radius
        self.velocity = velocity
        self.c = drawsUpon
        
    }
    
    // Update position of agent
    func update() {
        
        // Move the circle
        centre = Point(x: centre.x + velocity.x,
                       y: centre.y + velocity.y)
        
        // Bounce at edges
        bounceAtEdge()
        
        // Draw a circle at this point
        c.drawEllipse(at: centre, width: radius * 2, height: radius * 2)
        
    }
    
    // Bounce the agent when it hit's an edge
    func bounceAtEdge() {
        
        // Bounce at "circle" edges
        if centre.x + CGFloat(radius) > CGFloat((c.width / 2) + 350) || centre.x - CGFloat(radius) < CGFloat((c.width / 2) - 350) {
            centre.x = CGFloat(c.width / 2)
        }
        
        // Bounce at "circle" edges
        if centre.y + CGFloat(radius) > CGFloat((c.height / 2) + 350) || centre.y - CGFloat(radius) < CGFloat((c.height / 2) - 350) {
            centre.y = CGFloat(c.height / 2)
        }

        
    }
    
    
}
