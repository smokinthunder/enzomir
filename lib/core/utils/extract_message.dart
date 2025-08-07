String extractMessage(String input) {
  final regex = RegExp(r'message:\s*(.*?)(,|$)');
  final match = regex.firstMatch(input);
  if (match != null) {
    return match.group(1)?.trim() ?? '';
  }
  return "Unexpected error occured";
}