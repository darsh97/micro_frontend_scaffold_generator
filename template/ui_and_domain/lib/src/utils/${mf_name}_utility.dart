enum SupportedLocales { en, bn }

Map<SupportedLocales, String> localeValueMapping = {
  SupportedLocales.en: 'en',
  SupportedLocales.bn: 'bn',
};

Map<String, SupportedLocales> valueLocaleMapping = {
  'en': SupportedLocales.en,
  'bn': SupportedLocales.bn,
};

class ${mf_pascal_case}Utility {}
