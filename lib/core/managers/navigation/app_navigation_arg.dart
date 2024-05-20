class BaseNavigationArg {
  BaseNavigationArg({this.navigationType, this.data});

  final NavigationType? navigationType;
  final Object? data;

  // Convert your object to a map
  Map<String, dynamic> toJson() {
    return {
      'navigationType': navigationType.toString(),
      'data': data.toString(),
    };
  }

  // Construct your object from a map
  BaseNavigationArg.fromJson(Map<String, dynamic> json)
      : navigationType = NavigationType.values
            .firstWhere((e) => e.toString() == json['navigationType']),
        data = json['data'];
}

enum NavigationType {
  /// this just applied to two pages
  slideHorizontalLeft,
  slideHorizontalRight,
  slideVertical,
  // scale,
  fade,

  /// this just applied to the new screen
  fadeScale,
  fadeThrough,
  sharedAxisTransition,
}
