import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:dotenv/dotenv.dart' as dotenv;
import 'package:dart_postgres_example/api.dart';

abstract class Server {
	
	static JsonDecoder _decoder = const JsonDecoder();
	static JsonEncoder _encoder = const JsonEncoder();

	static dynamic _decode(request) async => _decoder.convert(await request.readAsString());
	static dynamic _encode(dynamic data) => _encoder.convert(data);

	static Future<Response> _get(Request request) async {

		switch (request.url.toString()) {
			
			case 'items':
				return Response.ok(_encode(await API.index()));
			
			default:
				return Response.notFound('Not Found');
		}
	}

	static Future<Response> _post(Request request) async {

		switch (request.url.toString()) {
			
			case 'item':
				try { 
					dynamic data = await _decode(request);
					return Response.ok(_encode(await API.addItem(data))); 
				}
				catch(e) { return Response(400); }
				break;

			default:
				return Response.notFound('Not Found');
		}
	}

	static Future<Response> _handle(Request request) async {

		switch (request.method) {
			
			case 'GET':
				return _get(request);

			case 'POST':
				return _post(request);
			
			default:
				return Response.notFound('Not Found');
		}
	}

	static Future<void> start() async {

		String filename = (await File.fromUri(Uri.parse('.env')).exists()) ? '.env' : '.env.example';
		dotenv.load(filename);

		await API.init(dotenv.env);

		dynamic handler = const Pipeline()
			.addMiddleware(logRequests())
			.addHandler(_handle);

		int port = int.parse(dotenv.env['PORT']);
		HttpServer server = await io.serve(handler, 'localhost', port);
		print('Serving at http://${server.address.host}:${server.port}');
	}
}

main(List<String> args) async => Server.start();