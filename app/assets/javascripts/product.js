$(document).ready(function () {
    $("p").text("jQuery稼働テスト(稼働中)");
});

$(function () {
    $('#product-shipments').on('change', 'input[type="checkbox"]', function () {
        var formData = $('form').serialize();
        var productShipments = $('#product-shipments').data('product-shipments');
        $.ajax({
            url: "https://api.shop-pro.jp/v1/products/" + window.productID + ".json",
            data: formData,
            success: function (response) {
                console.log("Data successfully updated");
            },
            error: function (xhr) {
                console.log("Error updating data");
            }
        });
    });
});
