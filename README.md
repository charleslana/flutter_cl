# flutter_cl

A new Flutter project.

## flutter lint commands

```bash
flutter analyze
```

```bash
dart fix --apply
```

## Open emulator

```bash
emulator -list-avds
emulator -avd Pixel_API_30
```

## Abrir DevTools do Flutter

```bash
http://127.0.0.1:9100

url: Connecting to VM Service at ws://127.0.0.1:40523/gyYbwl6MGhg=/ws
```

## Gerar mockito

```bash
dart run build_runner build
```

## Executar tests

```bash
flutter test test/repositories/todo_repository_test.dart
```

## go router params

[Go router params](https://stackoverflow.com/questions/77092934/parameter-passing-causes-an-error-when-using-go-router)

## list view

[List view center](https://stackoverflow.com/questions/52991376/flutter-how-to-center-widget-inside-list-view)

## Migration

TextTheme

#

Package: flutter Supported by Flutter Fix: yes

Several TextStyle properties of TextTheme were deprecated in v3.1 to support new stylings from the Material Design specification. They are listed in the following table alongside the appropriate replacement in the new API.

Deprecation New API

| Antigo    | Novo           |
| --------- | -------------- |
| headline1 | displayLarge   |
| headline2 | displayMedium  |
| headline3 | displaySmall   |
| headline4 | headlineMedium |
| headline5 | headlineSmall  |
| headline6 | titleLarge     |
| subtitle1 | titleMedium    |
| subtitle2 | titleSmall     |
| bodyText1 | bodyLarge      |
| bodyText2 | bodyMedium     |
| caption   | bodySmall      |
| button    | labelLarge     |
| overline  | labelSmall     |
