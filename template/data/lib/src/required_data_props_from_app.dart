import 'dart:async';

class RequiredDataPropsFromApp {
  final String userIdentityNumber;
  final String simSerial;
  final String userFingerPrintId;
  final String baseUrl;
  final StreamController<Object> dataNotificationStreamController;
  final bool Function() shouldLogApi;
  final Function? getAccessToken;
  final Map<String, dynamic>? commonApiHeaders;

  const RequiredDataPropsFromApp({
    required this.userIdentityNumber,
    required this.simSerial,
    required this.userFingerPrintId,
    required this.baseUrl,
    required this.dataNotificationStreamController,
    required this.shouldLogApi,
    this.getAccessToken,
    this.commonApiHeaders,
  });
}
