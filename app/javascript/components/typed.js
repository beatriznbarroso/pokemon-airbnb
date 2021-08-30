import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Pokemon", "Gonna catch them aaaaaall"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };