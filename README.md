# http_logger
Simple HTTP traffic logger written in Dart, cross-platform easy to use.

You can either run it like this:

```
dart .\bin\http_logger.dart
```

Or compile it into a single executable for your platform, following the [official documentation of Dart](https://dart.dev/tools/dart-compile).

You can set the following parameters:

* *ip* The IP to listen on, default is 127.0.0.1

```
dart .\bin\http_logger.dart ip=127.0.0.1
```

* *port* The default port to listen on, default is 8088
```
dart .\bin\http_logger.dart port=1234
```

*Important*
If you set localhost or 127.0.0.1 as IP only local traffic can reach the logger!

