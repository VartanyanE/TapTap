//
//  GameScene.swift
//  TapTap
//
//  Created by Emanuil Vartanyan on 3/23/23.
//

import SpriteKit

class GameScene: SKScene {
    
    let penguin = SKSpriteNode(imageNamed: "penguin")
    let snake = SKSpriteNode(imageNamed: "snake")
    let background = SKSpriteNode(imageNamed: "backgroundColorGrass")
    
   


    
    override func didMove(to view: SKView) {
        
       layoutScene()
       setupPhysics()
                                            
        }
    
    func setupPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -4.0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame.inset(by: UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)))

        physicsWorld.contactDelegate = self
    }
    
    func layoutScene(){
        
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1
        background.size = CGSize(width: 800, height: 2600)
        addChild(background)
        spawnCharecters()
    }
    
    func spawnCharecters() {
        penguin.position = CGPoint(x: frame.midX, y: frame.midY)
        penguin.size = CGSize(width: 30, height: 30)
        penguin.physicsBody = SKPhysicsBody(circleOfRadius: penguin.size.width/2)
        penguin.physicsBody?.categoryBitMask = PhysicsCategories.penguinCategory
        penguin.physicsBody?.contactTestBitMask = PhysicsCategories.snakeCategory
//        ball.physicsBody?.collisionBitMask = PhysicsCategories.none

        snake.position = CGPoint(x: frame.midX, y: 600)
        snake.size = CGSize(width: 50, height: 50)

        
        snake.physicsBody = SKPhysicsBody(circleOfRadius: snake.size.width/2)
        snake.physicsBody?.isDynamic = false
        snake.physicsBody?.categoryBitMask = PhysicsCategories.snakeCategory

      
       


        addChild(snake)
        addChild(penguin)
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
//
            
            if penguin.contains(location) {
                let moveAction = SKAction.move(to: CGPoint(x: frame.midX, y: 590), duration: 1.0)
                penguin.run(moveAction)
//                ball.removeFromParent()

            }
        }
   }
  
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == PhysicsCategories.penguinCategory | PhysicsCategories.snakeCategory {
           
            penguin.removeFromParent()
            
        }
    }
    
}
