import Alpine from 'alpinejs';
import accordion from '../components/accordion';

export function initAlpine() {
    accordion();
    Alpine.start();
}