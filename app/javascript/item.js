window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    const addProfitDom = document.getElementById("profit")
    addProfitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1))
  })
});