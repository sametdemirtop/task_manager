class AddTaskFormValidation {
  checkIsValid(String? title, String desc, String dueDate, String url) {
    if (title!.isNotEmpty &&
        desc.isNotEmpty &&
        dueDate.isNotEmpty &&
        url.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
