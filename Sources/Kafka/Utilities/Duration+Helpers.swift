//===----------------------------------------------------------------------===//
//
// This source file is part of the swift-kafka-client open source project
//
// Copyright (c) 2023 Apple Inc. and the swift-kafka-client project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of swift-kafka-client project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

/// Simple type that can be used to express a duration in milliseconds
///
/// Apple's code uses the `Duration` type which is only available in macOS 13+.  Throughout the
/// code, the minimum precision is milliseconds.
///
/// This type represents a duration in milliseconds using an `UInt` for storage.
public struct MillisecondDuration: Sendable, Equatable, Hashable {
    public var inMilliseconds: UInt

    public static func milliseconds(_ value: UInt) -> Self {
        MillisecondDuration(inMilliseconds: value)
    }

    internal let canBeRepresentedAsMilliseconds: Bool = true

    /// This is here to support the backwards compatible `Task.sleep(nanoseconds:)` function
    internal var nanoseconds: UInt64 {
        UInt64(self.inMilliseconds * 1_000_000)
    }
}
