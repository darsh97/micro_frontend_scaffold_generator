import '../${mf_snake_case}_data.dart';
import 'config/service_locator.dart';

class ${mf_pascal_case}Data {
  final RequiredDataPropsFromApp requiredDataPropsFromApp;

  const ${mf_pascal_case}Data(this.requiredDataPropsFromApp);

  Future<void> init() async {
    await _initServiceLocators();
  }

  Future<void> _initServiceLocators() async {
    await setUpServiceLocators(
      requiredDataPropsFromApp.baseUrl,
      requiredDataPropsFromApp.commonApiHeaders,
      requiredDataPropsFromApp.dataNotificationStreamController,
      requiredDataPropsFromApp.shouldLogApi,
    );

    await sl.allReady();
  }
}
