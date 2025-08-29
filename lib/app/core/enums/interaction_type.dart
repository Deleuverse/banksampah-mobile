enum InteractionType {
  fan(4),
  attend(5),
  follow(6);

  final int value;
  const InteractionType(this.value);

  /// Convert int to InteractionType
  static InteractionType fromInt(int value) {
    return InteractionType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid interaction type: $value'),
    );
  }
}
