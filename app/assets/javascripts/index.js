document.addEventListener("turbolinks:load", () => {
  // init constants
  const sortedCell = document.querySelector(".sort-by-title");

  const sorter = new SorterUtil("table");
  const passwordUtil = new PasswordUtil(
    "user_password",
    "user_password_confirmation"
  );
  const forms = document.querySelectorAll(".form-inline-link");
  const errors = document.querySelector(".error-message");
  // Sort table

  sortedCell?.addEventListener("click", sorter.sortByTitle);
  // Confirm password

  passwordUtil.toggleConfirmation();
  // Inline editor

  forms?.forEach((f) =>
    f.addEventListener("click", InlineEditor.toggleEditBtnClick)
  );

  if (errors) {
    const errorId = errors.dataset.resourceId;

    InlineEditor.toggleFormInline(errorId);
  }
  // Progress bar

  ProgressBar.fillBarHandler();
});
