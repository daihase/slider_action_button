# Slider Action Button
[![pub.dev](https://img.shields.io/pub/v/slider_action_button.svg?style=flat?logo=dart)](https://pub.dev/packages/slider_action_button)
[![github](https://img.shields.io/static/v1?label=platform&message=flutter&color=1ebbfd)](https://github.com/SplashByte/action_slider)

## Example
![slider_action_button](https://user-images.githubusercontent.com/19318060/204414692-cdb985a1-7192-4cd7-b937-4702c70d461d.gif)


## How to use

```dart
import 'package:slider_action_button/slider_action_button.dart';

```

```dart
SliderActionButton(
        icon: Icon(
          Icons.chevron_right,
        ),
        label: Text(
          'Slide to play',
        ),
        action: () {
          // do something...
        },
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        sliderColor: Colors.white,
        sliderDoneColor: Color(0xFFBBDEFB),
        iconColor: Colors.blue,
        padding: 4,
      ),

```
