import Alpine from 'alpinejs';

window.Alpine = Alpine;

const existingModules = [ 'home', 'faqs', 'contact', 'our-services' ];

async function loadPageModule(moduleName) {
    try {
        const module = await import(`./pages/${moduleName}.js`);
        console.log(`${moduleName} module loaded`);
        module.initAlpine();
    } catch (err) {
        console.error(`Failed to load ${moduleName} module`, err);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const page = document.body.dataset.page;
    if (page && existingModules.find(module => module === page)) {
        loadPageModule(page);
    }
});
