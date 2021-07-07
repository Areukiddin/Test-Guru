class InlineEditor {
  static toggleEditBtnClick = (e) => {
    e.preventDefault();

    const testId = e.target.dataset.testId;

    this.toggleFormInline(testId);
  };

  static toggleFormInline = (testId) => {
    const link = document.querySelector(
      '.form-inline-link[data-test-id="' + testId + '"]'
    );
    const testTitle = document.querySelector(
      '.test-title[data-test-id="' + testId + '"]'
    );
    const formInline = document.querySelector(
      '.form-inline[data-test-id="' + testId + '"]'
    );

    if (formInline?.classList.contains("hide")) {
      testTitle?.classList.add("hide");
      formInline?.classList.remove("hide");
      link ? (link.textContent = "Cancel") : null;
    } else {
      testTitle?.classList.remove("hide");
      formInline?.classList.add("hide");
      link ? (link.textContent = "Edit") : null;
    }
  };
}
