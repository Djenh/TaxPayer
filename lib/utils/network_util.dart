import 'package:dio/dio.dart';


class RetryItem {
  final RequestOptions options;
  final int retryCount;

  RetryItem(this.options, this.retryCount);
}

class CacheItem {
  final Response response;
  final DateTime expiryTime;

  CacheItem({required this.response, required this.expiryTime});
}
