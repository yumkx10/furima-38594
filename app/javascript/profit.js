function profit (){
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxPrice = Math.floor(inputValue * 0.1);
    const saleProfit = inputValue - taxPrice;

    addTaxDom.innerHTML = taxPrice;
    profitPrice.innerHTML = saleProfit;
  });
};
window.addEventListener('load', profit);

