# Kiss Typography

A simple, clean Flutter typography package that provides semantic text widgets following the KISS (Keep It Simple, Stupid) principle.

Created and maintained by [First Mobile Digital Group SL](https://www.wearemobilefirst.com).

## Features

- Semantic HTML-like heading components (H1-H6)
- Body text components with different sizes
- Title text components
- All components respect Flutter's theme typography
- Support for text alignment, colors, and overflow handling
- Follows Material Design text hierarchy

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  kiss_typography: ^1.0.0
```

## Usage

Import the package:

```dart
import 'package:kiss_typography/kiss_typography.dart';
```

### Headings

Use semantic heading components similar to HTML:

```dart
H1('Large Headline'), // Same as HeadlineLarge
H2('Medium Headline'), // Same as HeadlineMedium
H3('Small Headline'), // Same as HeadlineSmall
H4('Large Title'), // Same as TitleLarge
H5('Medium Title'), // Same as TitleMedium
H6('Small Title'), // Same as TitleSmall
Body('Default body text'), // Same as BodyMedium
```

Or Material Design:

```dart
HeadlineLarge('Large Headline'), 
HeadlineMedium('Medium Headline'),
HeadlineSmall('Small Headline'),
TitleLarge('Large Title'), 
TitleMedium('Medium Title'), 
TitleSmall('Small Title'), 
BodyMedium('Default body text'),
BodyLarge('Larger body text'),
BodySmall('Smaller body text'),
```

### Customization

All components support customization through common parameters:

```dart
BodyLarge(
  'Customized text',
  color: Colors.blue,
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

### Theme Integration

The package automatically uses your app's theme typography settings. Text styles are pulled from the current theme:

```dart
Theme(
  data: ThemeData(
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16.0),
      // ... other text styles
    ),
  ),
  child: BodyLarge('This text will use the theme's bodyLarge style'),
)
```

### Responsive Headlines

`HeadlineLarge` is responsive by default — on screens narrower than 600px, it automatically renders using the `headlineMedium` style to prevent titles from breaking mid-word on mobile devices. This behavior is automatic and requires no configuration at call sites.

## Class Reference

### Heading Classes
- `HeadlineLarge` (H1)
- `HeadlineMedium` (H2)
- `HeadlineSmall` (H3)
- `TitleLarge` (H4)
- `TitleMedium` (H5)
- `TitleSmall` (H6)

### Body Text Classes
- `BodyLarge`
- `BodyMedium` (Body)
- `BodySmall`

## Properties

Each component accepts the following properties:

- `text` (required): The text content to display
- `color`: Optional text color
- `textAlign`: Optional text alignment
- `overflow`: Optional text overflow behavior (Title and Body components)
- `maxLines`: Optional maximum number of lines (Body components only)

## License

Copyright (c) 2025 First Mobile Digital Group SL

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.