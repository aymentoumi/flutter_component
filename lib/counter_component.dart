import 'package:component/util/component.dart';
import 'package:flutter/material.dart';

class CounterComponent extends Component {
  final Value<int> _counter = Value(0);

  int get value => _counter.$;

  void incrementCounter() {
    state.animationController.forward().whenComplete(() {
      _counter.$++;
      state.animationController.reverse();
    });
  }

  @override
  void onInit() {
    super.onInit();
    state.animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: state)
          ..addListener(refresh);
    state.animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: state.animationController,
      curve: Curves.ease,
      reverseCurve: Curves.easeIn,
    ));
  }

  @override
  Widget render(BuildContext context) => Opacity(
      opacity: state.animation.value,
      child: Text(
        '${_counter.$}',
        style: Theme.of(context).textTheme.display1,
      ));
}