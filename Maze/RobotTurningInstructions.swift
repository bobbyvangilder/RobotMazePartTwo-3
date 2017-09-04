//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(_ robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        //print("randomlyRotateRightOrLeft: \(randomNumber)")
        // You may want to paste your Part 1 implementation of randomlyRotateRightOrLeft(robot: ComplexRobotObject) here.
        if randomNumber == 0 {
            robot.rotateRight()
        } else if randomNumber == 1 {
            robot.rotateLeft()
        }
    }
    
    func continueStraightOrRotate(_ robot: ComplexRobotObject, _ wallInfo:(up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        let randomNumber = arc4random() % 2
        //print("continueStraightOrRotate: \(randomNumber)")
        // You may want to paste your Part 1 implementation of continueStraightOrRotate(robot: ComplexRobotObject) here.
        if randomNumber == 0 {
            robot.move()
        } else if randomNumber == 1 {
            //print("TURNING TOWARD CLEAR PATH!")
            turnTowardClearPath(robot, (wallInfo.up, wallInfo.right, wallInfo.down, wallInfo.left, wallInfo.numberOfWalls))
        }
        
        // Step 3.2
        // TODO: Instead of calling randomlyRotateRightOrLeft() call turnTowardClearPath() when the robot has randomly chosen to rotate.
    }

    func turnTowardClearPath(_ robot: ComplexRobotObject, _ wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        
        // Step 3.1
        // TODO: Tell the robot which way to turn toward the clear path. There are four cases where the robot should rotate to the right (the first two have been done for you--uncomment the code below). Write the remaining two cases where the robot should rotate to the right. For all other cases, the robot should rotate to the left.
        if robot.direction == .left && wallInfo.down {
            //print("CLEAR PATH(wall down) - ROTATING RIGHT")
            robot.rotateRight()
        } else if robot.direction == .up && wallInfo.left {
            //print("CLEAR PATH(wall left) - ROTATING RIGHT")
            robot.rotateRight()
        } else if robot.direction == .right && wallInfo.up {
            //print("CLEAR PATH(wall up) - ROTATING RIGHT")
            robot.rotateRight()
        } else if robot.direction == .down && wallInfo.right {
            //print("CLEAR PATH(wall right) - ROTATING RIGHT")
            robot.rotateRight()
        }
        else {
            robot.rotateLeft()
        }
    }

}
