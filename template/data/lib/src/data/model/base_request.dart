part of models;

@JsonSerializable(createFactory: false)
class BaseRequest extends BaseModel<BaseRequest> {
  final String userIdentityNumber;
  final String simSerial;
  final String userFingerPrintId;

  const BaseRequest(this.userIdentityNumber, this.simSerial, this.userFingerPrintId);

  @override
  Map<String, dynamic> toJson() => _$BaseRequestToJson(this);
}
