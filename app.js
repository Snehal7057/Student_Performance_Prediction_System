let inp = document.getElementById("Input");
let out = document.getElementById("output");
let clear = document.getElementById("clear");
let submit = document.getElementById("submit");

submit.addEventListener("click", () => {
  let num = parseInt(inp.value);
  if (isNaN(num) || num < 1) {
    out.value = "Enter the valid number";
    return;
  }
  let fact = 1;
  for (let i = 1; i <= num; i++) {
    fact *= i;
  }
  out.value = fact;
});
clear.addEventListener("click", () => {
  inp.value = "";
  out.value = "";
  inp.focus();
});

// for sum
let f = document.getElementById("first-no");
let s = document.getElementById("second-no");
let sumout = document.getElementById("sum-out");
let sum = document.getElementById("sum");
sum.addEventListener("click", () => {
  let n1 = parseInt(f.value);
  let n2 = parseInt(s.value);
  if (isNaN(n1) || isNaN(n2) || n1 < 1 || n2 < 1) {
    sumout.value = "Enter the valid value";
  }
  sumout.value = n1 + n2;
});
