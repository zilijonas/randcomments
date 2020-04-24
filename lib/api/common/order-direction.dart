enum OrderDirection { asc, desc }

extension OrderDirectionExtension on OrderDirection {
  String toEnumString() {
    return this.toString().split('.').last;
  }

  OrderDirection switchDirection() {
    if (this == OrderDirection.asc) {
      return OrderDirection.desc;
    } else {
      return OrderDirection.asc;
    }
  }
}
