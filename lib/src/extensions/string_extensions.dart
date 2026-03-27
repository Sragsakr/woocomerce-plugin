extension StringErrorExtension on String {
  /// Removes the "Exception:" prefix and HTML tags from error strings
  String get cleanErrorMessage {
    // First remove "Exception:" prefix
    String cleaned = replaceFirst(RegExp(r'^Exception:\s*'), '');

    // Remove HTML tags (e.g., <strong>, <a href="...">, </strong>, etc.)
    cleaned = cleaned.replaceAll(RegExp(r'<[^>]*>'), '');

    // Decode HTML entities if needed
    cleaned = _decodeHtmlEntities(cleaned);

    // Trim extra whitespace
    cleaned = cleaned.trim();

    return cleaned;
  }

  /// Decodes common HTML entities
  String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#039;', "'")
        .replaceAll('&nbsp;', ' ');
  }
}
