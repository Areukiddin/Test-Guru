document.addEventListener("turbolinks:load", () => {
  // Sort table
  const sortedCell = document.querySelector(".sort-by-title");

  const sorter = new SorterUtil("table");

  sortedCell?.addEventListener("click", sorter.sortByTitle);

  // Confirm password
  const passwordUtil = new PasswordUtil(
    "user_password",
    "user_password_confirmation"
  );

  passwordUtil.toggleConfirmation();
});
