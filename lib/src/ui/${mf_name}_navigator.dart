import 'dart:async';

import 'package:common_services_data/common_services_data.dart';
import 'package:common_services_domain/common_services_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_gallery/helpers/loading_hud/loading_bloc.dart';

import '../required_props_from_app.dart';
import '../utils/data_layer_notification_handler.dart';
import '${mf_snake_case}_data_container.dart';

class ${mf_pascal_case}Navigator extends StatefulWidget {
  final RequiredPropsFromApp requiredPropsFromApp;

  const ${mf_pascal_case}Navigator({Key? key, required this.requiredPropsFromApp}) : super(key: key);

  @override
  State<${mf_pascal_case}Navigator> createState() => _${mf_pascal_case}NavigatorState();
}

class _${mf_pascal_case}NavigatorState extends State<${mf_pascal_case}Navigator> {
  late final GlobalKey<NavigatorState> _navigatorKey;
  late final LoadingBloc _loadingBloc;
  late final CommonServicesData _commonServicesData;
  late final StreamSubscription<DataNotification> _dataNotificationSubscription;

  @override
  void initState() {
    super.initState();
    _navigatorKey = GlobalKey();

    _loadingBloc = context.read<LoadingBloc>();

    _commonServicesData = CommonServicesData(commonApiHeaders: widget.requiredPropsFromApp.commonApiHeaders);
    _commonServicesData.init(widget.requiredPropsFromApp.baseUrl, widget.requiredPropsFromApp.shouldLogApi());

    _dataNotificationSubscription =
        widget.requiredPropsFromApp.dataLayerNotificationStreamController.stream.listen(_onDataNotification);
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ${mf_pascal_case}DataContainer(requiredPropsFromApp: widget.requiredPropsFromApp),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Navigator(
          key: _navigatorKey,
          initialRoute: null,
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }

  void _onDataNotification(DataNotification dataNotification) {
    DataLayerNotificationHandler.handle(dataNotification, _loadingBloc);
  }

  Future<bool> _onWillPop() async {
    if (_loadingBloc.state is LoadingFailedState || _loadingBloc.state is LoadingCompletedState) {
      _loadingBloc.add(LoadingResetEvent());

      return Future(() => false);
    } else if (_loadingBloc.state is LoadingStartedState) {
      return Future(() => false);
    } else {
      return !await _didPopRoute();
    }
  }

  Future<bool> _didPopRoute() async {
    final NavigatorState? navigator = _navigatorKey.currentState;
    assert(navigator != null);

    return await navigator!.maybePop();
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case "/":
        builder = (_) => const Center(child: Text('Hello world from ${mf_pascal_case} Navigator'));
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }

  @override
  void dispose() {
    _loadingBloc.close();
    _dataNotificationSubscription.cancel();
    super.dispose();
  }
}
