import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_gallery/helpers/loading_hud/loading_bloc.dart';
import 'package:widget_gallery/widget_gallery.dart';

class ${mf_pascal_case}Container extends StatefulWidget {
  final Widget child;

  const ${mf_pascal_case}Container({Key? key, required this.child}) : super(key: key);

  @override
  State<${mf_pascal_case}Container> createState() => _${mf_pascal_case}ContainerState();
}

class _${mf_pascal_case}ContainerState extends State<${mf_pascal_case}Container> {
  late LoadingBloc _loadingBloc;

  @override
  void initState() {
    super.initState();
    _loadingBloc = LoadingBloc();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleLoadingHud(
      loadingBloc: _loadingBloc,
      child: BlocProvider.value(
        value: _loadingBloc,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _loadingBloc.close();
    super.dispose();
  }
}
