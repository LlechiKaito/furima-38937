function post (){

  const priceData = document.getElementById("item-price");
  const addTaxData = document.getElementById('add-tax-price');
  const profitData = document.getElementById('profit');

  priceData.addEventListener("input", (e) => {
    e.preventDefault();
    const price = Number(priceData.value);
    const add_tax = parseInt(price / 10, 10);
    const profit = price - add_tax;
    addTaxData.innerHTML = add_tax;
    profitData.innerHTML = profit;
  });
};
 
window.addEventListener('load', post);