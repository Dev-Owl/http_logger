import 'dart:io';

import 'package:intl/intl.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

/*
To make sure you can reach the logger from the outside use your IP.
Using localhost or 127.0.0.1 will only listen for requests from localhost.
Ensure your firewall is not blocking the application
*/

void main(List<String> arguments) async {
  var port = 8088;
  var ip = "172.16.200.22";
  if (arguments.any((e) => e.startsWith('port='))) {
    final rawArgument =
        arguments.where((element) => element.startsWith('port=')).first;
    port = int.parse(rawArgument.replaceAll('port=', ''));
  }
  if (arguments.any((e) => e.startsWith('ip='))) {
    final rawArgument =
        arguments.where((element) => element.startsWith('ip=')).first;
    ip = rawArgument.replaceAll('ip=', '');
  }

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);

  var server = await shelf_io.serve(handler, ip, port);

  // Enable content compression
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

Future<Response> _echoRequest(Request request) async {
  final content = await request.readAsString();
  final now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd-HH-mm-ss');
  final String formatted = formatter.format(now);
  await File('$formatted.txt').writeAsString(content);
  return Response.ok(null);
}
