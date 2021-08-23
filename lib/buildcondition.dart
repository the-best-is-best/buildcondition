library buildcondition;

/// A Calculator.
import 'package:flutter/material.dart';

/// Runs a [WidgetBuilder]'s result if the [condition] is true.
///
/// When [condition] is true the [builder] is run. If false
/// and [fallback] is not null, [fallback] is run. If [fallback] is null and
/// [condition] is false, an empty [Container] is rendered.
///
/// Example:
///
/// ```dart
/// BuildCondition(
///  condition: true,
/// builder: (context) {
///    return Text('This gets rendered');
///  },
/// )
///
/// BuildCondition(
///  condition: false,
///  builder: (context) {
///    return Text('This does not get rendered, an empty Container will be rendered');
///  },
/// )
///
/// BuildCondition(
///  condition: false,
///  builder: (context) {
///    return Text('This does not get rendered, as fallback is not null, it is used to render the fallback widget.');
///  },
///  fallback: (context) {
///    return Text('This gets rendered');
///  }
/// )
/// ```
class BuildCondition extends StatelessWidget {
  /// Condition to control what gets rendered.
  final bool? condition;

  /// Run if [condition] is true.
  final WidgetBuilder? builder;

  /// Run if [condition] is false and it is not null.
  final WidgetBuilder? fallback;

  const BuildCondition({
    Key? key,
    this.condition,
    this.builder,
    this.fallback,
  })  : assert(condition != null),
        assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => condition != null && condition == true
      ? builder!(context)
      : fallback != null
          ? fallback!(context)
          : Container();
}
