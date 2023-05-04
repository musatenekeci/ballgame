//
//  GameScene.swift
//  ballGame
//
//  Created by Musa Tenekeci on 03.05.2023
//

import SpriteKit



  

class GameScene: SKScene , SKPhysicsContactDelegate {
    
    
   
   
    
    
    var nodeSayac = 0;
    
    
    
    let myfirstnode = SKNode();
    let myfirstSpriteNode = SKSpriteNode(imageNamed: "baskethoop");
    let myfirstPhotoNode = SKSpriteNode(imageNamed: "kizgin")
    var beklemeSuresi = 4;
   
    let kizginTopCategory:UInt32  = 0x1 << 0 // 1
    let groundCategory:UInt32   = 0x1 << 2 // 4
    
    let sNodesCategory:UInt32 = 0x1<<4 //16
    
let sNode = SKSpriteNode(color : UIColor.systemRed,size: CGSize(width: 50, height: 50));
    
    var levelTimerLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    let restartLabel = SKLabelNode(text: "Tekrar Oyna")
    


    //Immediately after leveTimerValue variable is set, update label's text
    var levelTimerValue: Int = 31 {
        didSet {
            
            
           
                levelTimerLabel.text = "Kalan Süre: \(levelTimerValue-1)"
            if(levelTimerValue != 0){
                createHit()
            }
            
            
        }
    }
    
    
    
    var scoreLabel = SKLabelNode(fontNamed: "Chalkduster");
    var scoreValue: Int = 0 {
        didSet {
            
           scoreLabel.text = "Score : \(scoreValue)"
        }
    }


    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self//
        
        levelTimerLabel.fontColor = SKColor.white
        levelTimerLabel.fontSize = 40
        levelTimerLabel.position = CGPoint(x: frame.midX, y: frame.maxY-100)
        levelTimerLabel.text = "Time left: \(levelTimerValue-1)"
        addChild(levelTimerLabel)
        
        
     
      
       
        scoreLabel.fontColor = SKColor.white
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.minX+80)
        scoreLabel.text = "Score : \(scoreValue)"
        addChild(scoreLabel)
        
        
     

        
        
        var i = 5 ;
        i = i + 1 ;
        print(i);
        physicsWorld.gravity = CGVector(dx:0, dy: 0)
        
       
        
        
        myfirstPhotoNode.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
       
        
        
        
        myfirstPhotoNode.position = CGPoint(x: frame.midX ,y: frame.midY-100)
        //addChild(myfirstPhotoNode)
        addChild(myfirstnode);
        myfirstPhotoNode.size = CGSize(width:40 , height: 40)
        myfirstPhotoNode.physicsBody = SKPhysicsBody(circleOfRadius: 20);
        myfirstPhotoNode.name = "ismail"
     
        print("tamamdır")
        
      
        
        //myfirstPhotoNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100));
        
      /* myfirstPhotoNode.physicsBody?.affectedByGravity = true
        myfirstPhotoNode.physicsBody?.isDynamic = true;*/
        
        
        
        myfirstSpriteNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 2));
        myfirstSpriteNode.size = CGSize(width:100 , height: 100)
        myfirstSpriteNode.physicsBody?.affectedByGravity = true
        myfirstSpriteNode.physicsBody?.isDynamic = false;
        myfirstSpriteNode.position = CGPoint(x: 185, y: 150)
        myfirstSpriteNode.name = "terrain"
        let corners : UIRectCorner = [UIRectCorner.topLeft,UIRectCorner.topRight]
    
        addChild(myfirstSpriteNode);
    
        
        
        
        
        
        
        var konumX = 20;
        var konumY = 400;
        var kutuSayisi = 1;
       
        let colors = ["green","white","black","blue","red","gray","purple","cyan","orange","brown","yellow","pink"]
  
        /*for i in 1...kutuSayisi{
            
            let randomIndex = Int.random(in:0...5);
            let kutular = SKSpriteNode(imageNamed: streets[randomIndex]);
            kutular.size = CGSize(width: 50, height: 50)
            kutular.position = CGPoint(x: konumX, y: konumY);
            kutular.physicsBody = SKPhysicsBody(circleOfRadius: 25)
          
            ƒ
            konumX = konumX+(380/kutuSayisi);
            addChild(kutular)
           
        }*/
        
        //380 max x
        
        myfirstPhotoNode.physicsBody?.categoryBitMask = kizginTopCategory
        myfirstPhotoNode.physicsBody?.contactTestBitMask = groundCategory
        
        
        myfirstSpriteNode.physicsBody?.categoryBitMask = groundCategory
        myfirstSpriteNode.physicsBody?.contactTestBitMask = sNodesCategory
        
        
        
        sNode.physicsBody?.categoryBitMask = sNodesCategory;
        sNode.physicsBody?.contactTestBitMask = groundCategory;
    
        
       
        
        let wait = SKAction.wait(forDuration: 1) //change countdown speed here
        let block = SKAction.run({
                [unowned self] in
                
                if self.levelTimerValue != 0{
                    
                   
                    self.levelTimerValue = self.levelTimerValue - 1
                    
                    print(levelTimerValue)
                    print(beklemeSuresi)
                    
                    beklemeSuresi = beklemeSuresi - 1
                    
                }else{
                    self.removeAction(forKey: "countdown")
                }
            
            
            })
            let sequence = SKAction.sequence([wait,block])

        run(SKAction.repeatForever(sequence), withKey: "countdown")
    }
    
    
   
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      for t in touches {
        let node = self.atPoint(t.location(in :self))
          
          
          
      
        if (node.name == "ismail") {
            myfirstPhotoNode.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 70))
        }
          
          
          if(node.name == "Restart"){
           
              print("slakjsalkj")
              
              
          }
          
        
          
          
          
      }
  
    }
    
    
    var ballSpeed = 9.5;
    
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
      
        let collision:UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
       
       
       
        
        //topla nenseler çarğıştığınd açlaışır !
        if collision == groundCategory | sNodesCategory{
           /* let randomY = Float.random(in: -10 ..< 20)
            let randomX = Float.random(in: -10..<10)
           
            
            
            myfirstPhotoNode.physicsBody?.applyImpulse(CGVector(dx: CGFloat(randomX),dy: CGFloat(randomY)))*/
            print("collision !")
            scoreValue = scoreValue + 1
           
            contact.bodyB.node?.removeFromParent();
        }
        
        
       
        
    }
    
    func swipedRight(sender: UISwipeGestureRecognizer) {

       print("Object has been swiped")

     }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            myfirstSpriteNode.position.x = location.x;
            myfirstSpriteNode.run(SKAction.moveTo(x: location.x, duration: 0.1))
          
        }
        
            
        
    
        
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        for node in children {
            if node.name == "sNode" && node.position.y < 100 {
                node.removeFromParent()
                node.physicsBody = nil
                if(levelTimerValue != 0){
                    createHit()
                }
            }
        }
        
        
        if(scoreValue == 30){
            if(levelTimerValue == 0){
                levelTimerLabel.text = "Tebrikler..."
                self.backgroundColor = UIColor.systemGreen
                restartLabel.alpha = 1
                }
            
             }
    else{
        if(levelTimerValue == 0){
            levelTimerLabel.text = "Kaybettin..."
            self.backgroundColor = UIColor.red
            restartLabel.alpha = 1
            }
    }

    }
    
  
    
    func createHit(){
        let randomInt = Float.random(in: 0..<360)
        nodeSayac = nodeSayac + 1
      //  let emojiRandom = Int.random(in: 0..<5)
        
        //let streets = ["kalpli", "tacli", "hedikalp", "parali", "poo", "saskin"]
    
        let sNode = SKSpriteNode(imageNamed: "ball");
        sNode.position = CGPoint(x: CGFloat(randomInt),y: frame.midY+200)
        addChild(sNode)
        
        sNode.size = CGSize(width:30 , height: 30)
        sNode.physicsBody = SKPhysicsBody(circleOfRadius: 15);
        sNode.name = "sNode"
        sNode.zPosition = 10
        
        sNode.physicsBody?.categoryBitMask = sNodesCategory
        sNode.physicsBody?.contactTestBitMask = groundCategory
        
        let randomY = -20
        let randomX = Float.random(in: -20..<20)
        
        sNode.physicsBody?.applyImpulse(CGVector(dx: CGFloat(randomX),dy:CGFloat(randomY)))
    }
    
    
    
    
   
    
    
    
    

}
