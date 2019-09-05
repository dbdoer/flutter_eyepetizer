import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ProviderWidget 封装
class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Widget child;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelInitial;

  ProviderWidget({
    Key key,
    this.model,
    this.child,
    this.builder,
    this.onModelInitial,
  });

  @override
  ProviderWidgetState<T> createState() => ProviderWidgetState<T>();
}

class ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  T model;

  @override
  void initState() {
    super.initState();
    this.model = widget.model;
    if (widget.onModelInitial != null) {
      widget.onModelInitial(this.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => this.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}