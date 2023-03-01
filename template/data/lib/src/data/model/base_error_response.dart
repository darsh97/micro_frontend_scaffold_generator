part of models;

class BaseErrorResponse extends BaseError {
  ErrorResponse? errorResponse;

  @override
  void generateError(dynamic data) {
    try {
      errorResponse = ErrorResponse.fromJson(data);
    } catch (_) {
      errorResponse = _getDefaultErrorResponse();
    }
  }

  @override
  String getMessage({required String lang}) => errorResponse?.getLocalizedMessage(lang) ?? '';

  ErrorData toEntity() => errorResponse?.toEntity() ?? _getDefaultErrorResponse().toEntity();

  ErrorResponse _getDefaultErrorResponse() {
    return ErrorResponse(
      DateTime.now(),
      [
        const LocalizationMessageResponse('en', 'An error occurred. Please try again'),
        const LocalizationMessageResponse('bn', 'একটি সমস্যা হয়েছে। অনুগ্রহ করে আবার চেষ্টা করুন'),
      ],
      '',
    );
  }
}
