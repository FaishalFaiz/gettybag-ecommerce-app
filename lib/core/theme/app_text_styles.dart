
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// GettyBag Design System — Typography Tokens
/// Based on DESIGN.md hierarchy, using Google Fonts "Nunito" as the
/// primary typeface (closest open-source substitute for Airbnb Cereal VF).
class AppTextStyles {
  AppTextStyles._();

  // ── Display ────────────────────────────────────────────────────────────
  /// 28px / 700 — Page hero headlines (e.g., "Temukan Buku Favoritmu")
  static TextStyle displayXl({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.43,
        color: color,
      );

  /// 22px / 600 — Section titles, screen titles
  static TextStyle displayLg({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.18,
        letterSpacing: -0.44,
        color: color,
      );

  /// 21px / 700 — Sub-section headings
  static TextStyle displayMd({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 21,
        fontWeight: FontWeight.w700,
        height: 1.43,
        color: color,
      );

  /// 20px / 600 — Card titles, featured labels
  static TextStyle displaySm({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.18,
        color: color,
      );

  // ── Title ──────────────────────────────────────────────────────────────
  /// 16px / 600 — Book card title, store name
  static TextStyle titleMd({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: color,
      );

  /// 16px / 500 — Secondary titles, tab labels
  static TextStyle titleSm({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: color,
      );

  // ── Body ───────────────────────────────────────────────────────────────
  /// 16px / 400 — Default running text, descriptions
  static TextStyle bodyMd({Color color = AppColors.body}) =>
      GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: color,
      );

  /// 14px / 400 — Card meta lines, prices, dates
  static TextStyle bodySm({Color color = AppColors.muted}) =>
      GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
        color: color,
      );

  // ── Caption ────────────────────────────────────────────────────────────
  /// 14px / 500 — Field labels, segment labels
  static TextStyle caption({Color color = AppColors.muted}) =>
      GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.29,
        color: color,
      );

  /// 13px / 400 — Legal text, timestamps, fine print
  static TextStyle captionSm({Color color = AppColors.mutedSoft}) =>
      GoogleFonts.nunito(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.23,
        color: color,
      );

  // ── Badge & Micro ──────────────────────────────────────────────────────
  /// 11px / 700 — Badge labels ("Terlaris", "Baru")
  static TextStyle badge({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        height: 1.18,
        color: color,
      );

  /// 12px / 700 — Micro labels, stat numbers
  static TextStyle microLabel({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.33,
        color: color,
      );

  /// 8px / 700 uppercase — "NEW" tags, uppercase labels
  static TextStyle uppercaseTag({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 8,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: 0.32,
        color: color,
      ).copyWith(
        // Flutter doesn't have textTransform, handle at widget level
      );

  // ── Buttons ────────────────────────────────────────────────────────────
  /// 16px / 600 — Primary button labels
  static TextStyle buttonMd({Color color = AppColors.onPrimary}) =>
      GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: color,
      );

  /// 14px / 500 — Small button / pill button labels
  static TextStyle buttonSm({Color color = AppColors.onPrimary}) =>
      GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.29,
        color: color,
      );

  // ── Navigation ─────────────────────────────────────────────────────────
  /// 16px / 600 — Bottom nav labels
  static TextStyle navLink({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: color,
      );

  // ── Rating ─────────────────────────────────────────────────────────────
  /// 64px / 700 — Large rating display (detail page)
  static TextStyle ratingDisplay({Color color = AppColors.ink}) =>
      GoogleFonts.nunito(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -1,
        color: color,
      );
}
