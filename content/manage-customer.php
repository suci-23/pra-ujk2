<?php
//Pembatasan Akses, Leader Tidak Bisa Masuk Halaman Customer
if (strtolower($rowLevel['level_name']) == 'leader') {
    header("location:home.php?access=denied");
    exit;
}

//Adakah Data Yang Di-Edit?
if (isset($_GET['edit'])) {
    $edit = $_GET['edit'];
    $query = mysqli_query($config, "SELECT * FROM customer WHERE id='$edit'");
    $row = mysqli_fetch_assoc($query);

    //Cegah akses id_customer yang tidak ada di DB
    if (mysqli_num_rows($query) == 0) {
        header("location:?page=customers&data=notfound");
        exit();
    }

    // Jika Ada, UPDATE
    if (isset($_POST['save'])) {
        $name = $_POST['customer_name'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];

        mysqli_query($config, "UPDATE customer SET customer_name='$name', phone='$phone', address='$address' WHERE id='$edit'");
        header("location:?page=customers&change=success");
    }
} else {

    //Jika Tidak Ada, TAMBAH DATA BARU
    if (isset($_POST['save'])) {
        $name = $_POST['customer_name'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];

        mysqli_query($config, "INSERT INTO customer (customer_name, phone, address) VALUES ('$name', '$phone', '$address')");
        header("location:?page=customers&add=success");
    }
}
?>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><?php echo isset($_GET['edit']) ? 'Edit' : 'Add' ?> Customer</h5>
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="" class="form-label">Customer Name*</label>
                            <input name="customer_name" type="text" class="form-control"
                                value="<?php echo isset($_GET['edit']) ? $row['customer_name'] : '' ?>" placeholder="Enter your name"
                                required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Phone*</label>
                            <input name="phone" type="text" class="form-control"
                                value="<?php echo isset($_GET['edit']) ? $row['phone'] : '' ?>" placeholder="Enter your phone number"
                                required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Address*</label>
                            <textarea name="address" id="" cols="30" rows="5" class="form-control"
                                required><?php echo isset($_GET['edit']) ? $row['address'] : '' ?></textarea>
                        </div>
                        <div class="mb-3">
                            <button name="save" type="submit" class="btn btn-success">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>