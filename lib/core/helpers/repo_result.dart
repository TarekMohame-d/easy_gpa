class RepoResult<T> {
  final T? data;
  final String? error;

  const RepoResult.success(this.data) : error = null;
  const RepoResult.failure(this.error) : data = null;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}
