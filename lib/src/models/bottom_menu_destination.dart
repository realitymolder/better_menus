import 'package:flutter/widgets.dart';


class BottomPageMenuDestination {
  final IconData icon;
  final String label;
  final String route;

  BottomPageMenuDestination({
    required this.icon,
    required this.label,
    required this.route,
  });

  BottomPageMenuDestination copyWith({
    IconData? icon,
    String? label,
    String? route,
  }) {
    return BottomPageMenuDestination(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      route: route ?? this.route,
    );
  }

  @override
  String toString() =>
      'BottomPageMenuDestination(icon: $icon, label: $label, Route: $route)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BottomPageMenuDestination &&
        other.icon == icon &&
        other.label == label &&
        other.route == route;
  }

  @override
  int get hashCode => icon.hashCode ^ label.hashCode ^ route.hashCode;
}
