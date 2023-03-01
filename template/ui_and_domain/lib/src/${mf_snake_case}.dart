import 'package:widget_gallery/utility/translations.dart';

import 'required_props_from_app.dart';
import 'utils/${mf_snake_case}_translations/${mf_snake_case}_bengali_text.dart';
import 'utils/${mf_snake_case}_translations/${mf_snake_case}_english_text.dart';
import 'utils/${mf_snake_case}_translations/${mf_snake_case}_translations.dart';

class ${mf_pascal_case} {
  final RequiredPropsFromApp requiredPropsFromApp;

  const ${mf_pascal_case}(this.requiredPropsFromApp);

  void setNewLanguage(String language) {
    ${mf_camel_case}Translations.setNewLanguage(language);
  }

  void init() {
    _init${mf_pascal_case}Translation();
  }

  void _init${mf_pascal_case}Translation() {
    ${mf_camel_case}Translations = Translations(bengaliTexts: ${mf_pascal_case}BengaliText().get(), englishTexts: ${mf_pascal_case}EnglishText().get());
    ${mf_camel_case}Translations.init(requiredPropsFromApp.currentLanguageCode);
  }
}
