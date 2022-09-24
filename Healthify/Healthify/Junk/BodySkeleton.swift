//
//  BodySkeleton.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import Foundation
import RealityKit
import ARKit

class BodySkeleton: Entity {
    var joints: [String: Entity] = [:]
    var bones: [String: Entity] = [:]
    
    required init(for bodyAnchor: ARBodyAnchor) {
        super.init()
        
        for jointName in ARSkeletonDefinition.defaultBody3D.jointNames {
            var jointRadius: Float = 0.05
            var jointColor: UIColor = .green
        }
    }
    
    required init() {
        fatalError("init not implemented")
    }
    
    private func createJoint(radius: Float, color: UIColor = .white) -> Entity {
        let mesh = MeshResource.generateSphere(radius: radius)
        let material = SimpleMaterial(color: color, roughness: 0.8, isMetallic: false)
        let entity = ModelEntity(mesh: mesh, materials: [material])
        
        return entity
    }
    
    private func createSkeletonBone(bone: Bones, bodyAnchor: ARBodyAnchor) -> SkeletonBone? {
        guard let fromJointEntityTransform = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: bone.jointFromName)),
              let toJointEntityTransform = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: bone.jointToName))
        else {
            return nil
        }
        
        let rootPosition = simd_make_float3(bodyAnchor.transform.columns.3)
        
        let jointFromEntityOffsetFromRoot = simd_make_float3(fromJointEntityTransform.columns.3)
        
        let jointFromEntityPosition = jointFromEntityOffsetFromRoot + rootPosition
        
        let jointToEntityOffsetFromRoot = simd_make_float3(toJointEntityTransform.columns.3)
        
        let jointToEntityPosition = jointToEntityOffsetFromRoot + rootPosition
        
        
        let fromJoint = SkeletonJoint(name: bone.jointFromName, position: jointFromEntityPosition)
        let toJoint = SkeletonJoint(name: bone.jointToName, position: jointToEntityPosition)
        
        return SkeletonBone(fromJoint: fromJoint, toJoint: toJoint)
    }
    
    private func createBoneEntity(for skeletonBone: SkeletonBone, diameter: Float = 0.04, color: UIColor = .white) -> Entity {
        let mesh = MeshResource.generateBox(size: [diameter, diameter, skeletonBone.length], cornerRadius: diameter/2)
        let material = SimpleMaterial(color: color, roughness: 0.5, isMetallic: true)
        let entity = ModelEntity(mesh: mesh, materials: [material])
        
        return entity
    }
}
