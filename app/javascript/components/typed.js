import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Pika Pika", "<b>Gonna catch them aaaaaall</b>"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };