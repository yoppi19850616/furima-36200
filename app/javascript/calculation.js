function calculation (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const countVal = itemPrice.value*0.1;
    const addtaxPrice = document.getElementById("add-tax-price");
    addtaxPrice.innerHTML = Math.trunc(`${countVal}`);
  });
};

window.addEventListener('load', calculation);