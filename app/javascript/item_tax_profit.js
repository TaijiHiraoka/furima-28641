function calculate (){
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const taxOutput = document.getElementById("add-tax-price");
    const profitOutput = document.getElementById("profit");
    const priceVal = priceInput.value;
    const taxVal = Math.floor(priceVal * 0.1);
    const profitVal = Math.floor(priceVal - taxVal);
    taxOutput.innerHTML = `${taxVal.toLocaleString()}`;
    profitOutput.innerHTML = `${profitVal.toLocaleString()}`;
  });
}

window.addEventListener("load", calculate);