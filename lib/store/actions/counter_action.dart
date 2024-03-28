import 'package:async_redux/async_redux.dart';
import 'package:dashkai/store/app_store.dart';

/// This action increments the counter by [amount]].
class IncrementAction extends ReduxAction<AppState> {
  final int amount;

  IncrementAction({required this.amount});

  @override
  AppState reduce() {
    var counterAdded = state.counter + amount;
    var newState = AppState(counter: counterAdded, productsResponse: {});
    return newState;
  }
}
