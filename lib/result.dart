///Result class lets you handle the result of any async operation in a better way
///for example Api calls, Database calls, etc
///
///Usage:
///```dart
///Result<Course, Exception> result = Result<Course, Exception>();
///result.compute(() async => await _dataRepository.getCourse(courseId));
///if(result.isOk){
///  //do something with result.ok
///  //result.ok is of type Course
///} else if(result.isError){
///  //do something with result.error
///  //result.error is of type Exception
///} else if(result.isLoading){
///  //show loading indicator
///}
///```
class Result<T, E extends Exception> {
  T? _ok;
  E? _error;
  bool _isLoading = false;

  T? get ok => _ok;

  E? get error => _error;

  bool get isOk => _ok != null;

  bool get isError => _error != null;

  bool get isLoading => _isLoading;

  Future<Result<T, E>> compute(Future<T> Function() asyncComputation) async {
    _isLoading = true;
    try {
      _ok = await asyncComputation();
    } on E catch (e) {
      _error = e;
    } finally {
      _isLoading = false;
    }
    return this;
  }
}
