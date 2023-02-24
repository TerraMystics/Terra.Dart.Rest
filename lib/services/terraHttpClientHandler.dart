import 'dart:convert';

import 'package:http/http.dart' as global;
import 'package:http/retry.dart' as http;

class TerraHttpClientHandler {
  http.RetryClient? httpClient;

  void prepareHttpClient() {
    httpClient = http.RetryClient(global.Client());
  }

  Future<global.Response> deleteAsync(String requestUri) async {
    return await httpClient!.delete(Uri.parse(requestUri));
  }

  Future<global.Response> getAsync(String requestUri) async {
    return await httpClient!.get(Uri.parse(requestUri));
  }

  Future<global.Response> postAsync(String requestUri, String data) async {
    return await httpClient!.post(Uri.parse(requestUri),
        headers: {"Content-Type": "application/json"}, body: data);
  }

  Future<global.Response> putAsync(String requestUri, String data) async {
    return await httpClient!.put(Uri.parse(requestUri),
        headers: {"Content-Type": "application/json"}, body: data);
  }

  void forceDisconnectAllClients() {
    httpClient!.close();
  }
}
