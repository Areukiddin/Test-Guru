const compareRowsAsc = (row1, row2) => {
  const title1 = row1.querySelector("td").textContent;
  const title2 = row2.querySelector("td").textContent;

  if (title1 < title2) return -1;
  if (title1 > title2) return 1;

  return 0;
};

const compareRowsDesc = (row1, row2) => {
  const title1 = row1.querySelector("td").textContent;
  const title2 = row2.querySelector("td").textContent;

  if (title1 < title2) return 1;
  if (title1 > title2) return -1;

  return 0;
};

const sortByTitle = () => {
  const table = document.querySelector("table");

  const rows = table.querySelectorAll("tr");

  const sortedRows = [];
  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }

  const arrowUp = table.querySelector(".octicon-arrow-up");
  const arrowDown = table.querySelector(".octicon-arrow-down");

  if (arrowUp.classList.contains("hide")) {
    sortedRows.sort(compareRowsAsc);
    arrowUp.classList.remove("hide");
    arrowDown.classList.add("hide");
  } else {
    sortedRows.sort(compareRowsDesc);
    arrowUp.classList.add("hide");
    arrowDown.classList.remove("hide");
  }

  const sortedtable = document.createElement("table");

  sortedtable.classList.add("table");
  sortedtable.appendChild(rows[0]);

  for (let i = 0; i < sortedRows.length; i++) {
    sortedtable.appendChild(sortedRows[i]);
  }

  table.parentNode.replaceChild(sortedtable, table);
};

document.addEventListener("turbolinks:load", () => {
  const sortedCell = document.querySelector(".sort-by-title");
  sortedCell?.addEventListener("click", sortByTitle);
});
