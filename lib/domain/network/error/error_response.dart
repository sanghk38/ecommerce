class ErrorResponse {
  final int? code;
  final String? message;

  ErrorResponse({
    this.code,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['status'] as int,
      message: json['message'] as String,
    );
  }
}
