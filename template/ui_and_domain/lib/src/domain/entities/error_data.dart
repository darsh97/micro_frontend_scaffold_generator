import 'localization_message.dart';

class ErrorData {
  final DateTime? updateTime;
  final List<LocalizationMessage?>? errorMessage;
  final String? errorCode;

  const ErrorData({this.updateTime, this.errorMessage, this.errorCode});
}
