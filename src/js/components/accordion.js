export default function accordion() {
    document.addEventListener('alpine:init', () => {
        Alpine.data('accordion', () => ({
            openItemIndex: null,
            toggle(index) {
                this.openItemIndex = this.openItemIndex !== index ? index : null;
                this.updateHeight(index);
            },
            isOpen(index) {
                return this.openItemIndex === index;
            },
            updateHeight(index) {
                this.$nextTick(() => {
                    const content = this.$refs[`itemContent${index}`];
                    content.style.maxHeight = this.isOpen(index) ? content.scrollHeight + 'px' : '0px';
                });
            },
        }));
    });
}