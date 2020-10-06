//
//  ViewController.swift
//  ARDicee
//
//  Created by Veronika Babii on 06.10.2020.
//  Copyright © 2020 vb. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        // dice
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) { // safely unwrap
            
            diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
            sceneView.scene.rootNode.addChildNode(diceNode)
        }
        
        sceneView.autoenablesDefaultLighting = true
        
        // cube or sphere
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//        // chamferRadius - roundness of the corners
//
//        let sphere = SCNSphere(radius: 0.1)
//
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
//        sphere.materials = [material]
//
//        // node - point in 3D space
//        let node = SCNNode()
//        node.position = SCNVector3(x: 0, y: 0.4, z: -0.5)
//
//        // position cube on that point
//        node.geometry = sphere
//
//        // add node to the scene
//        sceneView.scene.rootNode.addChildNode(node)
//
//        sceneView.autoenablesDefaultLighting = true // add objects' highlights and shadows
        
        // ship
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
