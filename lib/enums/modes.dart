// Define an enum class called 'Mode'
enum Mode {
  select,
  edit,
  upload,
}

extension ExtensionMode on Mode {
  String get description {
    switch (this) {
      case Mode.select:
        return 'select';
      case Mode.edit:
        return 'edit';
      case Mode.upload:
        return 'upload';
      default:
        return 'select';
    }
  }
}
