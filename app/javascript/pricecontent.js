function calculation (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const countVal = itemPrice.value - itemPrice.value*0.1;
    const addtaxPrice = document.getElementById("profit");
    addtaxPrice.innerHTML = Math.ceil(`${countVal}`);
  });
};

window.addEventListener('load', calculation);