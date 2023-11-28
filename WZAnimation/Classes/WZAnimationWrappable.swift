//
//  WZAnimationWrappable.swift
//  Created by ___ORGANIZATIONNAME___ on 2023/11/28
//  Description <#文件描述#>
//  PD <#产品文档地址#>
//  Design <#设计文档地址#>
//  Copyright © 2023. All rights reserved.
//  @author qiuqixiang(739140860@qq.com)   
//

import Foundation
public struct WZAnimationWrappable<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}
public protocol WZAnimationCompatible: AnyObject { }
public protocol WZAnimationCompatibleValue {}

extension WZAnimationCompatible {
    public var wz: WZAnimationWrappable<Self> {
        get { return WZAnimationWrappable(self) }
        set { }
    }
    
    public static var wz: WZAnimationWrappable<Self>.Type {
        return WZAnimationWrappable<Self>.self
    }
}

/// 值类型
extension WZAnimationCompatibleValue {
    public var wz: WZAnimationWrappable<Self> {
        get { return WZAnimationWrappable(self) }
        set { }
    }
    
    public static var wz: WZAnimationWrappable<Self>.Type {
            return WZAnimationWrappable<Self>.self
    }
}
