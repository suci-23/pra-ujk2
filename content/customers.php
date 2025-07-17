<?php
//Pembatasan Akses, Leader Tidak Bisa Masuk Halaman Customer
if (strtolower($rowLevel['level_name']) == 'leader') {
    header("location:home.php?access=denied");
    exit;
}

//SOFT DELETE QUERY
$queryCustomer = mysqli_query($config, "SELECT * FROM customer
                                WHERE deleted_at IS NULL ORDER BY id ASC");
$rowCustomer = mysqli_fetch_all($queryCustomer, MYSQLI_ASSOC);

if (isset($_GET['delete'])) {
    $id_customer = $_GET['delete'];
    $now = date('Y-m-d H:i:s');
    mysqli_query($config, "UPDATE customer SET deleted_at = '$now' WHERE id='$id_customer'");
    header("location:?page=customers&removed=success");
}
?>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Data Customers</h5>
                    <div class="table-responsive">
                        <div class="mb-3" align="right">
                            <a href="?page=manage-customer" class="btn btn-primary">New Customer</a>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Customer Name</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($rowCustomer as $key => $customer): ?>
                                    <tr>
                                        <td><?php echo $key += 1 ?></td>
                                        <td><?php echo $customer['customer_name'] ?></td>
                                        <td><?php echo $customer['phone'] ?></td>
                                        <td><?php echo $customer['address'] ?></td>
                                        <td>
                                            <!-- <a href="?page=tambah-order&id_customer=<?php echo $customer['id'] ?>" class="btn btn-secondary">Order</a> -->
                                            <a href="?page=manage-customer&edit=<?php echo $customer['id'] ?>" class="btn btn-warning">Edit</a>
                                            <a href="?page=customers&delete=<?php echo $customer['id'] ?>" class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>