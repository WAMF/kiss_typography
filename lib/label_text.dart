import 'package:flutter/material.dart' hide Typography;
import 'package:kiss_typography/typography.dart';

abstract class LabelText extends StatelessWidget {
  const LabelText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

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

class LabelLarge extends LabelText {
  const LabelLarge(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.labelLarge;
    final fontSize = Typography.maybeOf(context)?.labelLarge;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}

class LabelMedium extends LabelText {
  const LabelMedium(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.labelMedium;
    final fontSize = Typography.maybeOf(context)?.labelMedium;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}

class LabelSmall extends LabelText {
  const LabelSmall(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.labelSmall;
    final fontSize = Typography.maybeOf(context)?.labelSmall;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}
