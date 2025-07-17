<?php

//Pembatasan Akses, Leader & Operator Tidak Bisa Masuk Halaman CRUD Service
if (strtolower($rowLevel['level_name']) == 'leader' || strtolower($rowLevel['level_name']) == 'operator') {
    header("location:home.php?access=denied");
    exit;
}

//Adakah Data Yang Di-Edit?
if (isset($_GET['edit'])) {
    $edit = $_GET['edit'];
    $query = mysqli_query($config, "SELECT * FROM type_of_service WHERE id='$edit'");
    $row = mysqli_fetch_assoc($query);

    //Cegah akses id_service yang tidak ada di DB
    if (mysqli_num_rows($query) == 0) {
        header("location:?page=services&data=notfound");
        exit();
    }

    // Jika Ada, UPDATE
    if (isset($_POST['save'])) {
        $name = $_POST['service_name'];
        $price = $_POST['price'];
        $description = $_POST['description'];

        mysqli_query($config, "UPDATE type_of_service SET service_name='$name', price='$price', description='$description' WHERE id='$edit'");
        header("location:?page=services&change=success");
    }
} else {

    //Jika Tidak Ada, TAMBAH DATA BARU
    if (isset($_POST['save'])) {
        $name = $_POST['service_name'];
        $price = $_POST['price'];
        $description = $_POST['description'];

        mysqli_query($config, "INSERT INTO type_of_service (service_name, price, description) VALUES ('$name', '$price', '$description')");
        header("location:?page=services&add=success");
    }
}
?>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><?php echo isset($_GET['edit']) ? 'Edit' : 'Add' ?> Type Of Service</h5>
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="" class="form-label">Service Name*</label>
                            <input name="service_name" type="text" class="form-control"
                                value="<?php echo isset($_GET['edit']) ? $row['service_name'] : '' ?>"
                                placeholder="Enter your name service" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Price (/Kg)*</label>
                            <input name="price" type="text" class="form-control"
                                value="<?php echo isset($_GET['edit']) ? $row['price'] : '' ?>" placeholder="Enter your price" required>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Description</label>
                            <textarea name="description" id="" cols="30" rows="5"
                                class="form-control"><?php echo isset($_GET['edit']) ? $row['description'] : '' ?></textarea>
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