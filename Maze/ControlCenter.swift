//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
        let robotIsBlocked: Bool = isFacingWall(myRobot, direction: myRobot.direction)
        
        let myWallInfo = checkWalls(myRobot)
        //print("My Wall Info: \(myWallInfo)")

        let isThreeWayJunction: Bool = (myWallInfo.numberOfWalls == 1)
        if isThreeWayJunction {
            //print("3-way Junction reached")
        }

        let isTwoWayPath: Bool = (myWallInfo.numberOfWalls == 2)
        if isTwoWayPath {
            //print("Reached a 2-way path")
        }
        
        let isDeadEnd: Bool = (myWallInfo.numberOfWalls == 3)
        if isDeadEnd {
            //print("Dead End!  Turn around.")
        }
        
        // Dead End
        if isDeadEnd {
            if !robotIsBlocked {
                myRobot.move()
            } else if robotIsBlocked {
                myRobot.rotateRight()
            }
        }
        
        // Step 3.2
        // Two-way Path - else-if statements
        
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should turn in the direction of the clear path.
        if isTwoWayPath && !robotIsBlocked {
            continueStraightOrRotate(myRobot, myWallInfo)
        } else if isTwoWayPath && robotIsBlocked {
            turnTowardClearPath(myRobot, (myWallInfo.up, myWallInfo.right, myWallInfo.down, myWallInfo.left, myWallInfo.numberOfWalls))
        }
        
        // Three-way Junction
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot, (myWallInfo.up, myWallInfo.right, myWallInfo.down, myWallInfo.left, myWallInfo.numberOfWalls))
        }
        

        
    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}
