import 'package:common_services_domain/common_services_domain.dart';
import 'package:widget_gallery/helpers/loading_hud/loading_bloc.dart';

import '${mf_snake_case}_translations/${mf_snake_case}_translations.dart';

class DataLayerNotificationHandler {
  static void handle(DataNotification dataNotification, LoadingBloc loadingBloc) {
    if (dataNotification.apiCallingState != null) {
      if (dataNotification.apiCallingState == ApiCalling.started) {
        loadingBloc.add(LoadingStartedEvent());
      } else if (dataNotification.apiCallingState == ApiCalling.completed) {
        loadingBloc.add(LoadingCompletedEvent());
      }
    }

    if (dataNotification.error != null) {
      if (dataNotification.error!.errorType == ErrorType.apiResponseError) {
        String errorMessage = (${mf_camel_case}Translations.currentLanguage == 'bn'
                ? dataNotification.error!.messageBn
                : dataNotification.error!.messageEn) ??
            '';
        if (errorMessage.isEmpty) errorMessage = ${mf_camel_case}Translations.text('${mf_camel_case}.anErrorOccurred');
        loadingBloc.add(LoadingFailedEvent(errorMessage: errorMessage));
      } else if (dataNotification.error!.errorType == ErrorType.generic) {
        loadingBloc.add(LoadingFailedEvent(errorMessage: ${mf_camel_case}Translations.text('${mf_camel_case}.anErrorOccurred')));
      } else if (dataNotification.error!.errorType == ErrorType.networkConnectivityError) {
        loadingBloc.add(LoadingFailedEvent(errorMessage: ${mf_camel_case}Translations.text('${mf_camel_case}.networkConnectivityError')));
      } else if (dataNotification.error!.errorType == ErrorType.noOrSlowInternet) {
        loadingBloc.add(LoadingFailedEvent(errorMessage: ${mf_camel_case}Translations.text('${mf_camel_case}.noOrSlowInternetConnection')));
      }
    }
  }
}
