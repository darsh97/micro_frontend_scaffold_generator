part of models;

@JsonSerializable(createToJson: false)
class ErrorResponse extends BaseModel<ErrorResponse> {
  @JsonKey(fromJson: fromJsonToDateTime, toJson: toJsonFromDateTime)
  final DateTime? updateTime;
  final List<LocalizationMessageResponse?> errorMessage;
  final String errorCode;

  const ErrorResponse(this.updateTime, this.errorMessage, this.errorCode);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => {};

  String getLocalizedMessage(String lang) =>
      errorMessage.firstWhere((e) => e?.language == lang, orElse: () => null)?.value ?? '';

  ErrorData toEntity() => ErrorData(
        updateTime: updateTime,
        errorMessage: errorMessage.map((msg) => msg?.toEntity()).toList(),
        errorCode: errorCode,
      );
}
