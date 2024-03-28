import 'package:async_redux/async_redux.dart';
import 'package:dashkai/screens/home_screen.dart';
import 'package:dashkai/store/app_store.dart';
import 'package:dashkai/store/factory/counter_factory.dart';
import 'package:dashkai/store/view_models/counter_view_model.dart';
import 'package:flutter/material.dart';

/// This widget is a connector.
/// It connects the store to [MyHomePage] (the dumb-widget).
/// Each time the state changes, it creates a view-model, and compares it
/// with the view-model created with the previous state.
/// Only if the view-model changed, the connector rebuilds.
class MyHomePageConnector extends StatelessWidget {
  MyHomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => HomeScreen(
        // counter: vm.counter,
        // onIncrement: vm.onIncrement,
      ),
    );
  }
}
