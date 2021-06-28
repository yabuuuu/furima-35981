const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_item_delivery[number]"),
      cvc: formData.get("user_item_delivery[cvc]"),
      exp_month: formData.get("user_item_delivery[exp_month]"),
      exp_year: `20${formData.get("user_item_delivery[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

      }

      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp-month").removeAttribute("name");
      document.getElementById("exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);