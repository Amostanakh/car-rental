import 'package:async_redux/async_redux.dart';
import 'package:dashkai/store/actions/counter_action.dart';
import 'package:dashkai/store/app_store.dart';
import 'package:dashkai/store/connectors/home_page_connector.dart';
import 'package:dashkai/store/view_models/counter_view_model.dart';

/// Factory that creates a view-model for the StoreConnector.
class Factory extends VmFactory<AppState, MyHomePageConnector, ViewModel> {
  Factory(connector) : super(connector);

  @override
  ViewModel fromStore() => ViewModel(
        counter: state.counter,
        onIncrement: () => dispatch(IncrementAction(amount: 1)),
      );
}
