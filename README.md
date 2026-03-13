# Slider Action Button

[![pub.dev](https://img.shields.io/pub/v/slider_action_button.svg?style=flat&logo=dart)](https://pub.dev/packages/slider_action_button)
[![license](https://img.shields.io/badge/license-BSD--3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![platform](https://img.shields.io/badge/platform-flutter-1ebbfd.svg)](https://flutter.dev)

A customizable **slide-to-action** button widget for Flutter. Perfect for confirmations like "Slide to pay", "Slide to unlock", or any action that benefits from an intentional swipe gesture to prevent accidental taps.

## Preview

<p align="center">
  <img src="https://user-images.githubusercontent.com/19318060/204414692-cdb985a1-7192-4cd7-b937-4702c70d461d.gif" alt="slider_action_button demo" width="300"/>
</p>

## Features

- Smooth slide animation with spring-back effect
- Fully customizable colors, icon, label, and dimensions
- Completion callback when the user slides past the threshold
- Lightweight — single file, zero external dependencies

## Getting Started

### Installation

Add `slider_action_button` to your `pubspec.yaml`:

```yaml
dependencies:
  slider_action_button: ^0.0.1
```

Then run:

```sh
flutter pub get
```

### Import

```dart
import 'package:slider_action_button/slider_action_button.dart';
```

## Usage

```dart
SliderActionButton(
  icon: Icon(Icons.chevron_right),
  label: Text('Slide to play'),
  action: () {
    // Called when the slider reaches the end
  },
  height: 48,
  margin: const EdgeInsets.symmetric(horizontal: 16),
  sliderColor: Colors.white,
  sliderDoneColor: Color(0xFFBBDEFB),
  iconColor: Colors.blue,
  padding: 4,
)
```

## Parameters

| Parameter | Type | Required | Default | Description |
|---|---|---|---|---|
| `icon` | `Widget` | Yes | - | The icon displayed on the draggable thumb |
| `action` | `VoidCallback` | Yes | - | Callback fired when the slide completes |
| `sliderColor` | `Color` | Yes | - | Background color of the slider track |
| `sliderDoneColor` | `Color` | Yes | - | Color that fills in as the user slides |
| `iconColor` | `Color` | Yes | - | Background color of the circular thumb |
| `height` | `double` | Yes | - | Height of the slider |
| `label` | `Text?` | No | `null` | Text displayed in the center of the track |
| `margin` | `EdgeInsetsGeometry` | No | `EdgeInsets.zero` | Outer margin around the slider |
| `padding` | `double` | No | `4` | Inner padding between the thumb and the track edge |
| `boxShadow` | `List<BoxShadow>?` | No | Subtle shadow | Box shadow applied to the track |

## License

BSD 3-Clause License. See [LICENSE](LICENSE) for details.
