$(function() {
    $('.rating').barrating({
        theme: 'fontawesome-stars',
        onSelect: function(value, text, event) {
            alert('SUPER!');
        }
    });
});
