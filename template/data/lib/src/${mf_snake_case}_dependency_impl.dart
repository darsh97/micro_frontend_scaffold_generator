import 'package:${mf_snake_case}/${mf_snake_case}.dart';

import 'config/service_locator.dart';

class ${mf_pascal_case}DependencyImpl implements ${mf_pascal_case}Dependency {
  @override
  ${mf_pascal_case}Repository get ${mf_camel_case}Repository => sl.get<${mf_pascal_case}Repository>();
}
