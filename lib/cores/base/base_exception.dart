class BaseNetworkException implements Exception {
  String? message;
  String? code;
  BaseNetworkException(this.message, {this.code});
  @override
  String toString() {
    String messageSnackbar = message ?? 'Có lỗi xảy ra vui lòng thử lại';
    return messageSnackbar;
  }
}