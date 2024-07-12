document.addEventListener("DOMContentLoaded", function() {
    const items = document.querySelectorAll(".item, .battle");
    const quantityInput = document.getElementById("quantity");
    const buyNowButton = document.getElementById("buy-now");
    let selectedItem, selectedPrice = 0;

    // Memilih item
    items.forEach(item => {
        item.addEventListener("click", function(event) {
            event.preventDefault();
            items.forEach(i => i.classList.remove("selected"));
            item.classList.add("selected");
            selectedItem = item.querySelector(".item-info p").innerText;
            selectedPrice = parseInt(item.getAttribute("data-price"), 10); // Pastikan harga di-parse dengan benar
            resetQuantity();
            calculatePayment();
        });
    });

    // Reset jumlah ke 1 saat memilih item
    function resetQuantity() {
        quantityInput.value = 1;
    }

    // Menghitung total pembayaran
    function calculatePayment() {
        const quantity = parseInt(quantityInput.value, 10);
        const totalPayment = quantity * selectedPrice;
        const paymentText = isNaN(totalPayment) ? "Rp. 0" : new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR', minimumFractionDigits: 0 }).format(totalPayment);
        
        document.getElementById("totalPayment1").textContent = paymentText;
        document.getElementById("totalPayment2").textContent = paymentText;
        document.getElementById("totalPayment3").textContent = paymentText;
        document.getElementById("totalPayment4").textContent = paymentText;
    }

    // Mengupdate total pembayaran saat jumlah diubah
    quantityInput.addEventListener("input", calculatePayment);

    // Validasi input jumlah
    function validateInput() {
        let value = parseInt(quantityInput.value, 10);
        if (isNaN(value) || value < 1) {
            quantityInput.value = 1;
        } else if (value > 100) {
            quantityInput.value = 100;
        }
    }

    // Memilih metode pembayaran
    const methods = document.querySelectorAll(".methode");
    methods.forEach(method => {
        method.addEventListener("click", function() {
            methods.forEach(m => m.classList.remove("selected"));
            method.classList.add("selected");

            // Ambil nilai alt dari gambar yang dipilih
            const altValue = method.querySelector("img").alt;

            // Set nilai method_payment ke hidden input
            document.getElementById("hidden-method-payment").value = altValue;
        });
    });

    quantityInput.addEventListener("input", validateInput);
    quantityInput.addEventListener("input", calculatePayment);

    // Klik tombol Beli Sekarang
    if (buyNowButton) {
        buyNowButton.addEventListener("click", function() {
            const UID = document.getElementById("riot-id-input").value;
            const serverSelect = document.getElementById("server");
            const server = serverSelect.options[serverSelect.selectedIndex].value;
            const quantity = parseInt(quantityInput.value, 10);
            const methodPayment = document.getElementById("hidden-method-payment").value; // Ambil nilai method_payment dari hidden input
            const price = selectedPrice * quantity;

            if (!UID) {
                alert("Silakan masukkan UID Anda.");
                document.getElementById("riot-id-input").classList.add("error");
                document.getElementById("riot-id-input").scrollIntoView({ behavior: 'smooth', block: 'center' });
                return;
            }
            if (server === "Pilih Server") {
                alert("Silakan pilih server.");
                document.getElementById("server").classList.add("error");
                document.getElementById("server").scrollIntoView({ behavior: 'smooth', block: 'center' });
                return;
            }
            if (!selectedItem) {
                alert("Pilih Item");
                document.querySelector(".items-container").scrollIntoView({ behavior: 'smooth', block: 'center' });
                return;
            }
            if (!methodPayment) {
                alert("Pilih Methode Pembayaran");
                document.querySelector(".items-container").scrollIntoView({ behavior: 'smooth', block: 'center' });
                return;
            }

            document.getElementById("popup-riot-id").textContent = UID;
            document.getElementById("popup-server").textContent = server;
            document.getElementById("popup-amount").textContent = `Rp. ${price.toLocaleString('id-ID')}`;
            // Tidak perlu mengatur gambar di sini karena sudah diatur sebelumnya

            document.getElementById("hidden-UID").value = UID;
            document.getElementById("hidden-server").value = server;
            document.getElementById("hidden-item").value = selectedItem;
            document.getElementById("hidden-quantity").value = quantity;
            document.getElementById("hidden-price").value = price;
            document.getElementById("hidden-method-payment").value = methodPayment;

            openPopup();
        });
    }

    // Fungsi untuk menampilkan popup
    function openPopup() {
        document.getElementById("popup-modal").style.display = "flex"; // Menggunakan flexbox untuk menampilkan di tengah
    }

    // Menyembunyikan popup
    function closePopup() {
        document.getElementById("popup-modal").style.display = "none";
    }

    // Konfirmasi pembelian
    function confirmPurchase() {
        closePopup(); // Menyembunyikan popup setelah konfirmasi
        showSuccessPopup(); // Menampilkan modal sukses
    }

// Menyembunyikan modal sukses dan mengarahkan ke halaman utama
// Menyembunyikan modal sukses dan mengarahkan ke halaman utama
function closeSuccessPopup() {
    const successModal = document.getElementById("success-modal");
    successModal.style.display = "none";
    redirectToHome();
}


// Memastikan modal ditutup jika klik di luar area modal
window.onclick = function(event) {
    const modal = document.getElementById("popup-modal");
    const successModal = document.getElementById("success-modal");
    if (event.target === modal) {
        modal.style.display = "none";
    }
};



    document.querySelector(".close").addEventListener("click", closePopup);
    document.querySelector(".Close").addEventListener("click", closeSuccessPopup);
});




/*---------------------------------*/
$(document).ready(function() {
    $(".battle").hide();
    $("#pass").hide();
    $('[data-category="starlight"]').click(function(){
        $('.item').hide();
         $("#ini").hide();
        $('.battle').show();
         $("#pass").show();
    });
    $('[data-category="diamonds"]').click(function(){
        $('.item').show();
         $("#pass").hide();
          $("#ini").show();
        $('.battle').hide();
    });
});