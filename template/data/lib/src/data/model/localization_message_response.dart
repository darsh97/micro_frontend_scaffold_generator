part of models;

@JsonSerializable(createToJson: false)
class LocalizationMessageResponse extends BaseModel<LocalizationMessageResponse> {
  final String language;
  final String value;

  const LocalizationMessageResponse(this.language, this.value);

  factory LocalizationMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$LocalizationMessageResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => {};

  LocalizationMessage toEntity() => LocalizationMessage(language: language, value: value);

  LocalizationMessageResponse copyWith({String? language, String? value}) =>
      LocalizationMessageResponse(language ?? this.language, value ?? this.value);
}
