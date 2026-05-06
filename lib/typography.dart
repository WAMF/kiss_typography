import 'package:flutter/widgets.dart';

/// Per-style font-size overrides for [Typography].
///
/// Every field is nullable: a `null` field means *no override* — the text
/// widget falls back to the value defined in `Theme.of(context).textTheme`.
/// Non-null fields replace the corresponding theme size.
class TypographyData {
  final double? headlineLarge;
  final double? headlineMedium;
  final double? headlineSmall;
  final double? titleLarge;
  final double? titleMedium;
  final double? titleSmall;
  final double? bodyLarge;
  final double? bodyMedium;
  final double? bodySmall;
  final double? labelLarge;
  final double? labelMedium;
  final double? labelSmall;

  const TypographyData({
    this.headlineLarge,
    this.headlineMedium,
    this.headlineSmall,
    this.titleLarge,
    this.titleMedium,
    this.titleSmall,
    this.bodyLarge,
    this.bodyMedium,
    this.bodySmall,
    this.labelLarge,
    this.labelMedium,
    this.labelSmall,
  });

  TypographyData merge(TypographyData other) {
    return TypographyData(
      headlineLarge: other.headlineLarge ?? headlineLarge,
      headlineMedium: other.headlineMedium ?? headlineMedium,
      headlineSmall: other.headlineSmall ?? headlineSmall,
      titleLarge: other.titleLarge ?? titleLarge,
      titleMedium: other.titleMedium ?? titleMedium,
      titleSmall: other.titleSmall ?? titleSmall,
      bodyLarge: other.bodyLarge ?? bodyLarge,
      bodyMedium: other.bodyMedium ?? bodyMedium,
      bodySmall: other.bodySmall ?? bodySmall,
      labelLarge: other.labelLarge ?? labelLarge,
      labelMedium: other.labelMedium ?? labelMedium,
      labelSmall: other.labelSmall ?? labelSmall,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypographyData &&
          headlineLarge == other.headlineLarge &&
          headlineMedium == other.headlineMedium &&
          headlineSmall == other.headlineSmall &&
          titleLarge == other.titleLarge &&
          titleMedium == other.titleMedium &&
          titleSmall == other.titleSmall &&
          bodyLarge == other.bodyLarge &&
          bodyMedium == other.bodyMedium &&
          bodySmall == other.bodySmall &&
          labelLarge == other.labelLarge &&
          labelMedium == other.labelMedium &&
          labelSmall == other.labelSmall;

  @override
  int get hashCode => Object.hash(
        headlineLarge,
        headlineMedium,
        headlineSmall,
        titleLarge,
        titleMedium,
        titleSmall,
        bodyLarge,
        bodyMedium,
        bodySmall,
        labelLarge,
        labelMedium,
        labelSmall,
      );
}

class TypographyBreakpoint {
  final double minWidth;
  final double maxWidth;
  final TypographyData overrides;

  const TypographyBreakpoint({
    required this.overrides,
    this.minWidth = 0,
    this.maxWidth = double.infinity,
  });
}

class Typography extends StatelessWidget {
  const Typography({
    required this.child,
    this.data = const TypographyData(),
    this.breakpoints = const <TypographyBreakpoint>[],
    super.key,
  });

  final Widget child;
  final TypographyData data;
  final List<TypographyBreakpoint> breakpoints;

  static TypographyData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_TypographyScope>()
        ?.data;
  }

  @override
  Widget build(BuildContext context) {
    if (breakpoints.isEmpty) {
      return _TypographyScope(data: data, child: child);
    }

    final width = MediaQuery.sizeOf(context).width;
    var resolved = data;
    for (final bp in breakpoints) {
      if (width >= bp.minWidth && width < bp.maxWidth) {
        resolved = resolved.merge(bp.overrides);
      }
    }
    return _TypographyScope(data: resolved, child: child);
  }
}

class _TypographyScope extends InheritedWidget {
  final TypographyData data;

  const _TypographyScope({
    required this.data,
    required super.child,
  });

  @override
  bool updateShouldNotify(_TypographyScope oldWidget) =>
      data != oldWidget.data;
}
