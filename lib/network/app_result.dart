enum Status { SUCCESS, FAILURE }

class AppResult<T> {
  Status? status;
  String? message;
  List<T>? data;

  AppResult.success([this.data]) : status = Status.SUCCESS;

  AppResult.failure([this.message]) : status = Status.FAILURE;
}