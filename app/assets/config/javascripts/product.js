// app/assets/javascripts/product.js

$(document).ready(function () {
    $("p").text("jQuery稼働テスト(稼働中)");
});


// $(function () {
//     $('form').on('submit', function (e) {
//         e.preventDefault();
//         var id = <%= @product_shipments["id"] %>;
//         var formData = $(this).serialize();
//         $.ajax({
//             url: "https://api.shop-pro.jp/v1/products/" + id + ".json",
//             type: "PUT",
//             data: formData,
//             success: function (response) {
//                 console.log("Data successfully updated");
//             },
//             error: function (xhr) {
//                 console.log("Error updating data");
//             }
//         });
//     });
// });