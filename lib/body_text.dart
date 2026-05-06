import 'package:flutter/material.dart' hide Typography;
import 'package:kiss_typography/typography.dart';

abstract class BodyText extends StatelessWidget {
  const BodyText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  TextStyle? getTextStyle(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style;
    final themeStyle = getTextStyle(context);
    final effectiveStyle =
        themeStyle == null ? defaultStyle : defaultStyle.merge(themeStyle);

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: color != null
          ? effectiveStyle.copyWith(color: color)
          : effectiveStyle,
    );
  }
}

class BodySmall extends BodyText {
  const BodySmall(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;
    final fontSize = Typography.maybeOf(context)?.bodySmall;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}

class BodyMedium extends BodyText {
  const BodyMedium(
    super.text, {
    super.key,
    super.color,
    super.maxLines,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;
    final fontSize = Typography.maybeOf(context)?.bodyMedium;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}

class BodyLarge extends BodyText {
  const BodyLarge(
    super.text, {
    super.key,
    super.maxLines,
    super.color,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    final fontSize = Typography.maybeOf(context)?.bodyLarge;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}
