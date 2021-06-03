
const navbarToggle = () => {
  const chk = document.getElementById('checkbox');
  const dashboard = document.querySelector('.dashboard');
  const giftRequest = document.querySelector('.gift_request');

  chk.addEventListener('change', () => {
    // if (chk.hasAttribute('checked')){

    //  dashboard.classList.remove('d-none');
    //   giftRequest.classList.add('d-none');
    // }else {


       giftRequest.classList.toggle('d-none');
       dashboard.classList.toggle('d-none');

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

