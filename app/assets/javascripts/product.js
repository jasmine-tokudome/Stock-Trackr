$(document).ready(function () {
    $("p").text("jQuery稼働テスト(稼働中)");
});

$(function () {
    $('#product-shipments').on('change', 'input[type="checkbox"]', function () {
        var formData = $('form').serialize();
        var productShipments = $('#product-shipments').data('product-shipments');
        var id = productShipments["id"];
        $.ajax({
            url: "https://api.shop-pro.jp/v1/products/" + id + ".json",
            type: "PUT",
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
