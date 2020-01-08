//
//  LayoutConstraints.swift
//  Healthy
//
//  Created by Lipadat Evgeniy on 01/01/2020.
//  Copyright © 2020 Lipadat Evgeniy. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {

    static func activate(_ constraints: NSLayoutConstraint...) {
        activate(constraints)
    }

    static func deactivate(_ constraints: NSLayoutConstraint...) {
        deactivate(constraints)
    }
}

public struct ConstraintExpression<AnchorType: AnyObject> {
    let anchor: NSLayoutAnchor<AnchorType>
    let constant: CGFloat
}

public func == <AnchorType: AnyObject>(lhs: NSLayoutAnchor<AnchorType>, rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs)
}

public func == <AnchorType: AnyObject>(lhs: NSLayoutAnchor<AnchorType>, rhs: ConstraintExpression<AnchorType>) -> NSLayoutConstraint {
    return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
}

public func == (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(equalToConstant: rhs)
}

public func >= <AnchorType: AnyObject>(lhs: NSLayoutAnchor<AnchorType>, rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs)
}

public func >= <AnchorType: AnyObject>(lhs: NSLayoutAnchor<AnchorType>, rhs: ConstraintExpression<AnchorType>) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
}

public func >= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(greaterThanOrEqualToConstant: rhs)
}

public func <= <AnchorType: AnyObject>(lhs: NSLayoutAnchor<AnchorType>, rhs: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs)
}

public func <= <AnchorType: AnyObject>(lhs: NSLayoutAnchor<AnchorType>, rhs: ConstraintExpression<AnchorType>) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
}

public func <= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constraint(lessThanOrEqualToConstant: rhs)
}

public func + <AnchorType: AnyObject>(lhs: NSLayoutAnchor<AnchorType>, rhs: CGFloat) -> ConstraintExpression<AnchorType> {
    return ConstraintExpression(anchor: lhs, constant: rhs)
}

public func - <AnchorType: AnyObject>(lhs: NSLayoutAnchor<AnchorType>, rhs: CGFloat) -> ConstraintExpression<AnchorType> {
    return ConstraintExpression(anchor: lhs, constant: -rhs)
}
