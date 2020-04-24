enum OrderByChild { author, content, createdAt }

extension OrderByChildExtension on OrderByChild {
  String toEnumString() {
    return this.toString().split('.').last;
  }
}
