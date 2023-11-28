//
//  UIView+Animation.swift
//  WZLY
//
//  Created by qiuqixiang on 2021/7/31.
//  Copyright © 2021 我主良缘. All rights reserved.
//

import Foundation
import pop


/// MARK -  extension  动画
public extension WZAnimationWrappable where Base: UIView {
    
    enum AnimationType {
        case viewFrame(from: CGRect, to: CGRect)
        case viewScaleXY(from: CGPoint, to: CGPoint)
        case viewAlpha(from: CGFloat, to: CGFloat)
        case layerPositionY(from: CGFloat, to: CGFloat)
        
        var value: String {
            switch self {
            case .viewFrame: return kPOPViewFrame
            case .viewScaleXY: return kPOPViewScaleXY
            case .viewAlpha: return kPOPViewAlpha
            case .layerPositionY: return kPOPLayerPositionY
            }
        }
    }
    
    /// 基础动画
    func basicAnimation(type: AnimationType, duration: Double = 0.5, beginTime: CFTimeInterval = 0, comple: (()-> Void)? = nil) {
        let animation = POPBasicAnimation(propertyNamed: type.value)
        animation?.beginTime = CACurrentMediaTime() + beginTime
        animation?.duration = duration
        animation?.completionBlock = { _, _ in
            comple?()
        }
        add(animation, type: type)
    }
    
    /// 弹簧动画
    func springAnimation(type: AnimationType, springBounciness: CGFloat = 15, springSpeed: CGFloat = 15, beginTime: CFTimeInterval = 0, comple: (()-> Void)? = nil) {
        let animation = POPSpringAnimation(propertyNamed: type.value)
        animation?.beginTime = CACurrentMediaTime() + beginTime
        animation?.springBounciness = springBounciness
        animation?.springSpeed = springSpeed
        animation?.completionBlock = { _, _ in
            comple?()
        }
        add(animation, type: type)
    }
    
    /// 添加动画
    private func add(_ animation: POPPropertyAnimation?, type: AnimationType) {
        
        switch type {
        case let .viewFrame(from, to):
            animation?.fromValue =  NSValue(cgRect: from)
            animation?.toValue =  NSValue(cgRect: to)
            base.pop_add(animation, forKey: "POPSpringAnimation_\(type.value)")
        case let .viewScaleXY(from, to):
            animation?.fromValue =  NSValue(cgPoint: from)
            animation?.toValue =  NSValue(cgPoint: to)
            base.pop_add(animation, forKey: "POPSpringAnimation_\(type.value)")
        case let .layerPositionY(from, to):
            animation?.fromValue = from
            animation?.toValue = to
            base.layer.pop_add(animation, forKey: "POPSpringAnimation_\(type.value)")
        case .viewAlpha(from: let from, to: let to):
            animation?.fromValue = from
            animation?.toValue = to
            base.pop_add(animation, forKey: "POPSpringAnimation_\(type.value)")
        }
    }
}
