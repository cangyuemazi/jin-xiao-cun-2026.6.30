import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      secondary: AppColors.accent,
      onSecondary: AppColors.textOnPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.ink,
      error: AppColors.danger,
      onError: AppColors.textOnPrimary,
      outline: AppColors.hairline,
      outlineVariant: AppColors.hairlineSoft,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.canvas,
      canvasColor: AppColors.canvas,
      fontFamily: AppTextStyles.fontFamily,
      textTheme: AppTextStyles.textTheme,
      dividerColor: AppColors.divider,
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 0,
      ),
      visualDensity: VisualDensity.standard,
      splashFactory: InkRipple.splashFactory,
      splashColor: AppColors.primarySoft,
      highlightColor: AppColors.overlay,
      appBarTheme: const AppBarThemeData(
        backgroundColor: AppColors.canvas,
        foregroundColor: AppColors.ink,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.sectionTitle,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceCard,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
          side: const BorderSide(color: AppColors.hairline),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.dialog,
          side: const BorderSide(color: AppColors.hairline),
        ),
        titleTextStyle: AppTextStyles.sectionTitle,
        contentTextStyle: AppTextStyles.body,
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: AppColors.canvas,
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.mutedSoft),
        labelStyle: AppTextStyles.label,
        floatingLabelStyle: AppTextStyles.label.copyWith(
          color: AppColors.primary,
        ),
        border: _inputBorder(AppColors.hairline),
        enabledBorder: _inputBorder(AppColors.hairline),
        focusedBorder: _inputBorder(AppColors.primary, width: 1.5),
        errorBorder: _inputBorder(AppColors.danger),
        focusedErrorBorder: _inputBorder(AppColors.danger, width: 1.5),
        errorStyle: AppTextStyles.caption.copyWith(
          color: AppColors.danger,
        ),
        helperStyle: AppTextStyles.caption,
        helperMaxLines: 2,
        errorMaxLines: 2,
      ),
      filledButtonTheme: FilledButtonThemeData(style: _filledButtonStyle()),
      elevatedButtonTheme: ElevatedButtonThemeData(style: _outlinedButtonStyle()),
      outlinedButtonTheme: OutlinedButtonThemeData(style: _outlinedButtonStyle()),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: const WidgetStatePropertyAll(AppTextStyles.button),
          foregroundColor: const WidgetStatePropertyAll(AppColors.ink),
          overlayColor: const WidgetStatePropertyAll(AppColors.overlay),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: AppRadius.button),
          ),
        ),
      ),
      dataTableTheme: DataTableThemeData(
        headingTextStyle: AppTextStyles.tableHeader,
        dataTextStyle: AppTextStyles.tableCell,
        headingRowColor: const WidgetStatePropertyAll(AppColors.surfaceAlt),
        dataRowColor: const WidgetStatePropertyAll(AppColors.surface),
        dividerThickness: 1,
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.hairline),
          borderRadius: AppRadius.table,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
      iconTheme: const IconThemeData(color: AppColors.muted, size: 20),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.muted,
        textColor: AppColors.ink,
        titleTextStyle: AppTextStyles.bodyLarge,
        subtitleTextStyle: AppTextStyles.bodySmall,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xs,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
          side: const BorderSide(color: AppColors.hairline),
        ),
        textStyle: AppTextStyles.body,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.ink,
        contentTextStyle: AppTextStyles.body.copyWith(
          color: AppColors.textOnPrimary,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.card),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.ink,
          borderRadius: AppRadius.borderMd,
        ),
        textStyle: AppTextStyles.caption.copyWith(
          color: AppColors.textOnPrimary,
        ),
      ),
    );
  }

  static ButtonStyle _filledButtonStyle() {
    return ButtonStyle(
      textStyle: const WidgetStatePropertyAll(AppTextStyles.button),
      backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
      foregroundColor: const WidgetStatePropertyAll(AppColors.textOnPrimary),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: const WidgetStatePropertyAll(0.0),
      overlayColor: const WidgetStatePropertyAll(AppColors.overlay),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      minimumSize: const WidgetStatePropertyAll(Size(0, 40)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
    );
  }

  static ButtonStyle _outlinedButtonStyle() {
    return ButtonStyle(
      textStyle: const WidgetStatePropertyAll(AppTextStyles.button),
      backgroundColor: const WidgetStatePropertyAll(AppColors.canvas),
      foregroundColor: const WidgetStatePropertyAll(AppColors.ink),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: const WidgetStatePropertyAll(0.0),
      overlayColor: const WidgetStatePropertyAll(AppColors.overlay),
      side: const WidgetStatePropertyAll(
        BorderSide(color: AppColors.hairline),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      minimumSize: const WidgetStatePropertyAll(Size(0, 40)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
    );
  }

  static OutlineInputBorder _inputBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: AppRadius.input,
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
