import 'package:flutter_test/flutter_test.dart';
import 'package:full_movie_app/result.dart';

void main() {

  Future<int> dummyAsyncFunction() async {
    await Future.delayed(const Duration(seconds: 2));
    return 1;
  }

  Future<int> dummyAsyncFunctionWithError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Error');
  }

  test('Result class test - success', () async {
    Result<int, Exception> result = Result<int, Exception>();
    result = await result.compute(() async => await dummyAsyncFunction());
    expect(result.isOk, true);
    expect(result.isError, false);
    expect(result.isLoading, false);
    expect(result.ok, 1);
    expect(result.error, null);
  });

  test('Result class test - error', () async {
    Result<int, Exception> result = Result<int, Exception>();
    result = await result.compute(() async => await dummyAsyncFunctionWithError());
    expect(result.isOk, false);
    expect(result.isError, true);
    expect(result.isLoading, false);
    expect(result.ok, null);
    expect(result.error, isA<Exception>());
  });

  test('Result class test - loading works with success', () async {
    Result<int, Exception> result = Result<int, Exception>();
    var x = result.compute(() async => await dummyAsyncFunction());
    expect(result.isLoading, true);
    result = await x;
    expect(result.isLoading, false);
  });

  test('Result class test - loading works with error', () async {
    Result<int, Exception> result = Result<int, Exception>();
    var x = result.compute(() async => await dummyAsyncFunctionWithError());
    expect(result.isLoading, true);
    result = await x;
    expect(result.isLoading, false);
  });
}