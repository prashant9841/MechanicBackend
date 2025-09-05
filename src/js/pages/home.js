import Alpine from 'alpinejs';
import Swiper from 'swiper';
import { Navigation, Pagination } from 'swiper/modules';

Swiper.use([Navigation, Pagination]);

export function initAlpine() {
    document.addEventListener('alpine:init', () => {
        Alpine.data('initSwiper', () => ({
            init() {
                new Swiper('.swiper-container--banner', {
                    slidesPerView: 1,
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true,
                    },
                });
            },
        }));
    });
    
    Alpine.start();
}