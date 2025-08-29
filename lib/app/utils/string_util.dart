class StringUtil {
  static String toTitleCaseUnderscore(String text) {
    return text
        .toLowerCase()
        .split('_')
        .map((word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
        .join(' ');
  }
}
