//
//  ARViewContainer.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import Foundation
import ARKit
import RealityKit
import SwiftUI
import Combine

var character: BodyTrackedEntity?
let characterAnchor = AnchorEntity()
let characterOffset: SIMD3<Float> = [-1.0, 0, 0] // Offset the character by one meter to the left

struct ARViewContainer: UIViewRepresentable {

    typealias UIViewType = ARView

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        arView.setupForBodyTracking()
//        arView.scene.addAnchor(bodySkeletonAnchor)
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
    }

}

extension ARView: ARSessionDelegate {
    func setupForBodyTracking() {
        self.session.delegate = self
        let configuration = ARBodyTrackingConfiguration()
        self.session.run(configuration)
        self.scene.addAnchor(characterAnchor)

//                 Asynchronously load the 3D character.
        var cancellable: AnyCancellable? = nil
        cancellable = Entity.loadBodyTrackedAsync(named: "character/robot").sink(
            receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error: Unable to load model: \(error.localizedDescription)")
                }
                cancellable?.cancel()
        }, receiveValue: { (currentCharacter: Entity) in
            if let currentCharacter = currentCharacter as? BodyTrackedEntity {
                // Scale the character to human size
                currentCharacter.scale = [1.0, 1.0, 1.0]
                character = currentCharacter
                cancellable?.cancel()
            } else {
                print("Error: Unable to load model as BodyTrackedEntity")
            }
        })
    }

    public func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let bodyAnchor = anchor as? ARBodyAnchor else { continue }

            // Update the position of the character anchor's position.
            let bodyPosition = simd_make_float3(bodyAnchor.transform.columns.3)
            characterAnchor.position = bodyPosition + characterOffset
            // Also copy over the rotation of the body anchor, because the skeleton's pose
            // in the world is relative to the body anchor's rotation.
            characterAnchor.orientation = Transform(matrix: bodyAnchor.transform).rotation

            if let character = character, character.parent == nil {
                // Attach the character to its anchor as soon as
                // 1. the body anchor was detected and
                // 2. the character was loaded.
                characterAnchor.addChild(character)
            }
        }
    }
}





//import SwiftUI
//import RealityKit
//import ARKit
//
//private var bodySkeleton: BodySkeleton?
//private let bodySkeletonAnchor = AnchorEntity()
//
//// Wraps UIKit-based ARView to be used in SwiftUI View
//struct ARViewContainer: UIViewRepresentable {
//    typealias UIViewType = ARView
//
//    func makeUIView(context: UIViewRepresentableContext<ARViewContainer>) -> ARView {
//        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
//
//        arView.setupForBodyTracking()
//
//        // Add bodySkeletonAnchor to scene
//        arView.scene.addAnchor(bodySkeletonAnchor)
//
//        return arView
//    }
//
//    func updateUIView(_ uiView: ARView, context: UIViewRepresentableContext<ARViewContainer>) {
//
//    }
//}
//
//// Extend ARView to implement body tracking functionality
//extension ARView: ARSessionDelegate {
//    // Configure ARView for body tracking
//    func setupForBodyTracking() {
//        let configuration = ARBodyTrackingConfiguration()
//        self.session.run(configuration)
//
//        self.session.delegate = self
//    }
//
//    // Implement ARSession didUpdate anchors delegate method
//    public func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
//        for anchor in anchors {
//            if let bodyAnchor = anchor as? ARBodyAnchor {
//                // Create or update bodySkeleton
//                if let skeleton = bodySkeleton {
//                    // BodySkeleton already exists, update pose of all joints
//                    skeleton.update(with: bodyAnchor)
//                } else {
//                    // BodySkeleton doesn't exist yet. This means human body detected for the first time.
//                    // Create a bodySkeleton entity and add it to the bodySkeletonAnchor
//                    bodySkeleton = BodySkeleton(for: bodyAnchor)
//                    bodySkeletonAnchor.addChild(bodySkeleton!)
//                }
//            }
//        }
//    }
//}
