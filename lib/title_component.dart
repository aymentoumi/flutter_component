import 'package:component/util/component.dart';
import 'package:flutter/material.dart';

class TitleComponent extends Component {
  final Value<String> _title = Value("Title");

  String get value => _title.$;

  set value(String title) {
    _title.$ = title;
    refresh();
  }

  @override
  Widget render(BuildContext context) => Text(value);

}