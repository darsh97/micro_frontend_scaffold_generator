// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$BaseRequestToJson(BaseRequest instance) =>
    <String, dynamic>{
      'userIdentityNumber': instance.userIdentityNumber,
      'simSerial': instance.simSerial,
      'userFingerPrintId': instance.userFingerPrintId,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      fromJsonToDateTime(json['updateTime'] as String?),
      (json['errorMessage'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : LocalizationMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as String,
    );

LocalizationMessageResponse _$LocalizationMessageResponseFromJson(
        Map<String, dynamic> json) =>
    LocalizationMessageResponse(
      json['language'] as String,
      json['value'] as String,
    );
