class AppState {
  final int counter;
  final Map<dynamic, dynamic> productsResponse;

  AppState({
    required this.counter,
    required this.productsResponse,
  });

  AppState copy({
    int? counter,
    Map<dynamic, dynamic>? productsResponse,
  }) {
    return AppState(
        counter: counter ?? this.counter,
        productsResponse: productsResponse ?? this.productsResponse);
  }

  static AppState initialState() => AppState(counter: 0, productsResponse: {});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          counter == other.counter &&
          productsResponse == other.productsResponse;
  @override
  int get hashCode => counter.hashCode;
}
