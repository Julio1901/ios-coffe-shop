#if os(macOS)
import Cocoa

extension Snapshotting where Value == CALayer, Format == NSImage {
  /// A snapshot strategy for comparing layers based on pixel equality.
  public static var imageView: Snapshotting {
    return .imageView(precision: 1)
  }

  /// A snapshot strategy for comparing layers based on pixel equality.
  ///
  /// - Parameter precision: The percentage of pixels that must match.
  public static func imageView(precision: Float) -> Snapshotting {
    return SimplySnapshotting.imageView(precision: precision).pullback { layer in
      let imageView = NSImage(size: layer.bounds.size)
      imageView.lockFocus()
      let context = NSGraphicsContext.current!.cgContext
      layer.setNeedsLayout()
      layer.layoutIfNeeded()
      layer.render(in: context)
      imageView.unlockFocus()
      return imageView
    }
  }
}
#elseif os(iOS) || os(tvOS)
import UIKit

extension Snapshotting where Value == CALayer, Format == UIImage {
  /// A snapshot strategy for comparing layers based on pixel equality.
  public static var imageView: Snapshotting {
    return .imageView()
  }

  /// A snapshot strategy for comparing layers based on pixel equality.
  ///
  /// - Parameter precision: The percentage of pixels that must match.
  public static func imageView(precision: Float = 1, traits: UITraitCollection = .init())
    -> Snapshotting {
      return SimplySnapshotting.imageView(precision: precision, scale: traits.displayScale).pullback { layer in
        renderer(bounds: layer.bounds, for: traits).imageView { ctx in
          layer.setNeedsLayout()
          layer.layoutIfNeeded()
          layer.render(in: ctx.cgContext)
        }
      }
  }
}
#endif
