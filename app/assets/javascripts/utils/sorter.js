class SorterUtil {
  constructor(className) {
    this.className = className;
    this.sortedRows = [];
  }

  compareRowsAsc = (row1, row2) => {
    const title1 = row1.querySelector("td").textContent;
    const title2 = row2.querySelector("td").textContent;

    if (title1 < title2) return -1;
    if (title1 > title2) return 1;

    return 0;
  };

  compareRowsDesc = (row1, row2) => {
    const title1 = row1.querySelector("td").textContent;
    const title2 = row2.querySelector("td").textContent;

    if (title1 < title2) return 1;
    if (title1 > title2) return -1;

    return 0;
  };

  sortByTitle = () => {
    const table = document.querySelector(this.className);

    const rows = table.querySelectorAll("tr");

    for (let i = 1; i < rows.length; i++) {
      this.sortedRows.push(rows[i]);
    }

    const arrowUp = table.querySelector(".octicon-arrow-up");
    const arrowDown = table.querySelector(".octicon-arrow-down");

    if (arrowUp.classList.contains("hide")) {
      this.sortedRows.sort(this.compareRowsAsc);
      arrowUp.classList.remove("hide");
      arrowDown.classList.add("hide");
    } else {
      this.sortedRows.sort(this.compareRowsDesc);
      arrowUp.classList.add("hide");
      arrowDown.classList.remove("hide");
    }

    const sortedtable = document.createElement("table");

    sortedtable.classList.add("table");
    sortedtable.appendChild(rows[0]);

    for (let i = 0; i < this.sortedRows.length; i++) {
      sortedtable.appendChild(this.sortedRows[i]);
    }

    table.parentNode.replaceChild(sortedtable, table);
  };
}
