import 'dart:async';

import 'package:common_services_domain/common_services_domain.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

import '../${mf_snake_case}_dependency.dart';
import '../src/domain/entities/app_status.dart';

class RequiredPropsFromApp {
  final Function? getAccessToken;
  final String userIdentityNumber;
  final String simSerial;
  final String userFingerPrintId;
  final String baseUrl;
  final String currentLanguageCode;
  final VoidCallback? keepAliveCallback;
  final ${mf_pascal_case}Dependency ${mf_camel_case}Dependency;
  final AppStatus appStatus;
  final String userName;
  final String profileImageUrl;
  final Map<String, dynamic>? commonApiHeaders;
  final StreamController<DataNotification> dataLayerNotificationStreamController;
  final VoidCallback navigateToInformationUpdate;
  final BehaviorSubject<String> titleChangeBehaviorSubject;
  final bool Function() shouldLogApi;

  const RequiredPropsFromApp({
    required this.userIdentityNumber,
    required this.simSerial,
    required this.userFingerPrintId,
    required this.baseUrl,
    required this.${mf_camel_case}Dependency,
    required this.appStatus,
    required this.dataLayerNotificationStreamController,
    required this.navigateToInformationUpdate,
    required this.titleChangeBehaviorSubject,
    required this.shouldLogApi,
    this.currentLanguageCode = 'en',
    this.getAccessToken,
    this.keepAliveCallback,
    this.userName = '',
    this.profileImageUrl = '',
    this.commonApiHeaders,
  });
}
