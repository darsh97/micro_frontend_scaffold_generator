import 'package:${mf_snake_case}/${mf_snake_case}.dart';

import '../../config/service_locator.dart';
import '${mf_snake_case}_remote_data_source.dart';

class ${mf_pascal_case}RepositoryImpl extends ${mf_pascal_case}Repository {
  late final ${mf_pascal_case}RemoteDataSource _${mf_camel_case}RemoteDataSource;

  ${mf_pascal_case}RepositoryImpl() {
    _${mf_camel_case}RemoteDataSource = sl.get<${mf_pascal_case}RemoteDataSource>();
  }
}
