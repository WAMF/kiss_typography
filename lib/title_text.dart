import 'package:flutter/material.dart' hide Typography;
import 'package:kiss_typography/typography.dart';

abstract class TitleText extends StatelessWidget {
  const TitleText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
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
      overflow: overflow,
      textAlign: textAlign,
      style: color != null
          ? effectiveStyle.copyWith(color: color)
          : effectiveStyle,
    );
  }
}

class TitleLarge extends TitleText {
  const TitleLarge(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;
    final fontSize = Typography.maybeOf(context)?.titleLarge;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}

class TitleMedium extends TitleText {
  const TitleMedium(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;
    final fontSize = Typography.maybeOf(context)?.titleMedium;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}

class TitleSmall extends TitleText {
  const TitleSmall(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.titleSmall;
    final fontSize = Typography.maybeOf(context)?.titleSmall;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}
