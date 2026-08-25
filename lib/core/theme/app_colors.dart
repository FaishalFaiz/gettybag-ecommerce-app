import 'package:flutter/material.dart';

/// GettyBag Design System — Color Tokens
/// Adapted from DESIGN.md (Airbnb-inspired) for a literary book marketplace.
class AppColors {
  AppColors._();

  // ── Brand ──────────────────────────────────────────────────────────────
  /// Primary brand color — Deep Navy Blue. Used for primary CTAs, headers,
  /// active nav icons, and key interactive elements.
  static const Color primary = Color(0xFF1A2E5A);

  /// Press/active state of primary — slightly darker navy.
  static const Color primaryActive = Color(0xFF0F1E3D);

  /// Disabled state of primary — pale navy tint.
  static const Color primaryDisabled = Color(0xFFA8BCE0);

  /// Gold accent — used for star ratings, highlight badges, and discount tags.
  static const Color accent = Color(0xFFE8C547);

  /// Accent active state (darker gold).
  static const Color accentActive = Color(0xFFD4AF37);

  // ── Surface ────────────────────────────────────────────────────────────
  /// Default page background — pure white canvas.
  static const Color canvas = Color(0xFFFFFFFF);

  /// Light surface fill for disabled fields, subtle backgrounds.
  static const Color surfaceSoft = Color(0xFFF7F8FC);

  /// Slightly stronger surface — used for icon button backgrounds.
  static const Color surfaceStrong = Color(0xFFEEF0F8);

  /// Card background — same as canvas.
  static const Color surfaceCard = Color(0xFFFFFFFF);

  // ── Text ───────────────────────────────────────────────────────────────
  /// Dominant text color — deep near-black for headlines and body.
  static const Color ink = Color(0xFF1C1C2E);

  /// Secondary running text — slightly lighter than ink.
  static const Color body = Color(0xFF3F3F5C);

  /// Muted text — subtitles, placeholders, inactive labels.
  static const Color muted = Color(0xFF6A6A8A);

  /// Softer muted — for disabled link text.
  static const Color mutedSoft = Color(0xFF929299);

  /// Text on primary/dark surfaces — white.
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Text on dark surfaces — white.
  static const Color onDark = Color(0xFFFFFFFF);

  // ── Borders & Dividers ─────────────────────────────────────────────────
  /// Default 1px divider color.
  static const Color hairline = Color(0xFFE0E0F0);

  /// Lighter divider for long-scrolling separators.
  static const Color hairlineSoft = Color(0xFFEBEBF5);

  /// Heavier border for focused input outlines.
  static const Color borderStrong = Color(0xFFC1C1D8);

  // ── Semantic ───────────────────────────────────────────────────────────
  /// Star rating color — warm gold.
  static const Color starRating = Color(0xFFF5A623);

  /// Error text color.
  static const Color error = Color(0xFFD93025);

  /// Success color.
  static const Color success = Color(0xFF2D6A4F);

  /// Unread badge / notification color.
  static const Color badge = Color(0xFFFF3B30);

  // ── Scrim ──────────────────────────────────────────────────────────────
  /// Modal backdrop — use at 50% opacity.
  static const Color scrim = Color(0xFF000000);

  // ── Gradient Presets ───────────────────────────────────────────────────
  /// Primary header gradient (navy dark → navy).
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0F1E3D), Color(0xFF1A2E5A)],
  );

  /// Splash screen gradient (navy → slightly lighter navy).
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0F1E3D), Color(0xFF1A2E5A), Color(0xFF243E73)],
    stops: [0.0, 0.6, 1.0],
  );

  /// Card overlay gradient — for book cover overlays.
  static const LinearGradient cardOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Color(0xCC1C1C2E)],
  );
}
