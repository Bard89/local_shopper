
const navbarToggle = () => {
  const chk = document.getElementById('checkbox');
  const dashboard = document.querySelector('.dashboard');
  const giftRequest = document.querySelector('.gift_request');

  if (sessionStorage.getItem("role")=="requester"){
    dashboard.classList.remove('d-none');
  }else if (sessionStorage.getItem("role")=="shopper"){
    giftRequest.classList.remove('d-none');
  }else{
    sessionStorage.setItem("role", "requester");
    dashboard.classList.remove('d-none');
  }

  if (!chk.checked && sessionStorage.getItem("role")=="shopper"){
    chk.click()
//    giftRequest.classList.remove('d-none');
//    dashboard.classList.add('d-none');

//  }else {
//    giftRequest.classList.remove('d-none');
//    dashboard.classList.remove('d-none');
  }

  chk.addEventListener('change', () => {
    // Store
    if (chk.checked){
      sessionStorage.setItem("role", "shopper");
      giftRequest.classList.remove('d-none');
      dashboard.classList.add('d-none');
    }else {
      sessionStorage.setItem("role", "requester");
      giftRequest.classList.add('d-none');
      dashboard.classList.remove('d-none');
    }
    // if (chk.hasAttribute('checked')){

    //  dashboard.classList.remove('d-none');
    //   giftRequest.classList.add('d-none');
    // }else {




    // }

//   if (window.location.pathname == "/gift_requests"){
//     window.location.href = '/dashboard';

//     window.location.reload(false).href
    // }
    // else {
    //  window.location.href = "/gift_requests";


    // }
  });
}

export {navbarToggle};

