import 'package:flutter/widgets.dart';
// if you use flutter for web change the previous import with this
// import 'package:flutter_web/widgets.dart';

class Value<T> {
  T $;

  Value([this.$]);
}

abstract class Component extends StatefulWidget {
  final Value<ComponentState> _state = Value();

  @override
  ComponentState createState() {
    _state.$ = ComponentState();
    return _state.$;
  }

  ComponentState get state => _state.$;

  Widget render(BuildContext context);

  void refresh() => _state.$.refresh();

  void onInit() {}

  void onResume() {}

  void onInactive() {}

  void onPause() {}

  void onSuspend() {}

  void onDispose() {}
}

class ComponentState extends State<Component>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController animationController;
  Animation animation;

  void refresh() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.onInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      widget.onResume();
    } else if (state == AppLifecycleState.inactive) {
      widget.onInactive();
    } else if (state == AppLifecycleState.paused) {
      widget.onPause();
    } else if (state == AppLifecycleState.suspending) {
      widget.onSuspend();
    }
  }

  @override
  void dispose() {
    widget.onDispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.render(context);
}
