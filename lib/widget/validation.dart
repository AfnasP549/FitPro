String? validatorFunction({
  String? url,
  String? name,
  String? description,
  String? duration,
}) {
  if (url != null) {
    // URL validation
    if (url.isEmpty) {
      return 'Please enter a URL';
    }
    const urlPattern = r'^(http|https):\/\/[\w\-_]+(\.[\w\-_]+)+[/#?]?.*$';
    if (!RegExp(urlPattern, caseSensitive: false).hasMatch(url)) {
      return 'Please enter a valid URL';
    }
  }

  if (name != null) {
    // Name validation
    if (name.isEmpty) {
      return 'Please enter your name';
    }
    String cleanedName = name.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (RegExp(r'[0-9]').hasMatch(cleanedName)) {
      return 'Name should not contain numbers';
    }
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(cleanedName)) {
      return 'Name should not contain special characters';
    }
    if (cleanedName != name) {
      return 'Please avoid continuous spaces in the name';
    }
  }

  if (description != null) {
    // Description validation
    if (description.isEmpty) {
      return 'Please enter a description';
    }
    String cleanedDescription = description.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (cleanedDescription.length < 10) {
      return 'Description must be at least 10 characters long';
    }
    if (cleanedDescription != description) {
      return 'Please avoid continuous spaces in the description';
    }
  }

  if (duration != null) {
    // Duration validation
    if (duration.isEmpty) {
      return 'Please enter your duration';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(duration)) {
      return 'Please enter numeric characters only for duration';
    }
    if (int.tryParse(duration) == 0) {
      return 'Duration cannot be zero';
    }
  }


  return null;
}
