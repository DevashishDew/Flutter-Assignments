class BaseErrorResponse{
  final int status;
  final String message;

  BaseErrorResponse(this.status, this.message);

  BaseErrorResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'];
}