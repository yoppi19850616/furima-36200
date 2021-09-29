const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyers_address[number]"),
      cvc: formData.get("buyers_address[cvc]"),
      exp_month: formData.get("buyers_address[exp_month]"),
      exp_year: `20${formData.get("buyers_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden" >`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("buyers_address_number").removeAttribute("name");
      document.getElementById("buyers_address_cvc").removeAttribute("name");
      document.getElementById("buyers_address_exp_month").removeAttribute("name");
      document.getElementById("buyers_address_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);