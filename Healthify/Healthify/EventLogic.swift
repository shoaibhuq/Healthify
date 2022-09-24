//
//  EventLogic.swift
//  Healthify
//
//  Created by Shoaib Huq on 9/24/22.
//

import Foundation
import ARKit
import RealityKit

struct EventLogic{
    
    func shoulderRotation(_ bodyAnchor: ARBodyAnchor) -> Int{
        let startingLowerYBound:Float = -0.1
        let startingUpperYBound:Float = 0.1
        
        let finLowerYBound:Float = 0.80
        
        let rightJointTransform = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: "right_hand_joint"))
        let rightJointYValue = simd_make_float3((rightJointTransform!.columns.3)).y
        
        let leftJointTransform = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: "left_hand_joint"))
        let leftJointYValue = simd_make_float3((leftJointTransform!.columns.3)).y
        
        
        if ((rightJointYValue > startingLowerYBound && rightJointYValue < startingUpperYBound)
            && (leftJointYValue > startingLowerYBound && leftJointYValue < startingUpperYBound)
        ){
            //print("DEBUG:: STARTING POSITION HAS BEEN REACHED")
            return 0
        }
        
        if (rightJointYValue > finLowerYBound && leftJointYValue > finLowerYBound){
            //print("DEBUG:: FINAL POSITION HAS BEEN REACHED")
            return 1
        }
        
        return -1
    }
    
    //legs
    func squat(_ bodyAnchor: ARBodyAnchor) -> Int{
        
        //for raising your arms at the start
        let lowerZBound:Float = 0.45
        let upperZBound:Float = 0.55
        
        //Right Hand Joint
        let rightJointTransform = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: "right_hand_joint"))
        let rightJointZValue = simd_make_float3((rightJointTransform!.columns.3)).z
        
        //Right Hand Joint
        let leftJointTransform = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: "left_hand_joint"))
        let leftJointZValue = simd_make_float3((leftJointTransform!.columns.3)).z
        
        //Hips Joint
        let hipJointTransform = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: "hips_joint"))
        let hipJointYValue = simd_make_float3(hipJointTransform!.columns.3).y
        
        let lowerYBound:Float = hipJointYValue - 0.25
        let upperYBound:Float = hipJointYValue + 0.25
        
        //Left Leg Joint
        let leftJointTransform1 = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: "left_leg_joint"))
        let leftJointYValue = simd_make_float3((leftJointTransform1!.columns.3)).y
        
        //Right Leg Joint
        let rightJointTransform1 = bodyAnchor.skeleton.modelTransform(for: ARSkeleton.JointName(rawValue: "right_leg_joint"))
        let rightJointYValue = simd_make_float3((rightJointTransform1!.columns.3)).y
        
        //Comparisons
        
        //starting comparison for arm raising
        if ((leftJointZValue > lowerZBound && leftJointZValue < upperZBound)
            && (rightJointZValue > lowerZBound && rightJointZValue < upperZBound)
        ){
            //print("DEBUG:: STARTING POSITION HAS BEEN REACHED")
            return 0
        }
        
        //comparison for leg in line with hip joints
        if ((leftJointYValue > lowerYBound && leftJointYValue < upperYBound)
            && (rightJointYValue > lowerYBound && rightJointYValue < upperYBound)
        ){
            //print("DEBUG:: FINAL POSITION HAS BEEN REACHED")
            return 1
        }
        
        return -1
    }
}
