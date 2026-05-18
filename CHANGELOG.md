# Changelog

All notable changes to the Kiss Typography package will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.0]

- Added `Typography` widget for width-scoped font-size overrides with responsive breakpoints.
- Added `TypographyData` model with value equality support.

## [0.6.0]

- Added label text widgets: `LabelLarge`, `LabelMedium`, `LabelSmall`.

## [0.5.0]

### Added
- Initial release of Kiss Typography package
- Abstract base classes for typography hierarchy:
  - `TitleText`
  - `HeadlineText`
  - `BodyText`
- Semantic heading components (H1-H6):
  - `HeadlineLarge` (H1)
  - `HeadlineMedium` (H2)
  - `HeadlineSmall` (H3)
  - `TitleLarge` (H4)
  - `TitleMedium` (H5)
  - `TitleSmall` (H6)
- Body text components:
  - `BodyLarge`
  - `BodyMedium` (Body)
  - `BodySmall`
- Support for customization:
  - Text color
  - Text alignment
  - Overflow handling
  - Maximum lines (Body components)
- Full integration with Flutter's ThemeData and TextTheme
- Type aliases for semantic HTML-like usage

## [0.5.1]

### Fixed
- Corrected README.md
