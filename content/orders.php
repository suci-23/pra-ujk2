<?php
//Pembatasan Akses, Leader Tidak Bisa Masuk Halaman Order
if (strtolower($rowLevel['level_name']) == 'leader') {
    header("location:home.php?access=denied");
    exit;
}

//Relasi Trans_Order Dengan Customer
$queryOrder = mysqli_query($config, "SELECT trans_order.*, customer.customer_name
                            FROM trans_order LEFT JOIN customer
                            ON trans_order.id_customer = customer.id
                            WHERE trans_order.deleted_at IS NULL ORDER BY id DESC");
$rowOrder = mysqli_fetch_all($queryOrder, MYSQLI_ASSOC);

//SOFT DELETE QUERY
if (isset($_GET['delete'])) {
    $id_user = $_GET['delete'];
    $now = date('Y-m-d H:i:s');
    mysqli_query($config, "UPDATE trans_order SET deleted_at = '$now' WHERE id='$id_user'");
    header("location:?page=orders&removed=success");
}
?>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Data Orders</h5>
                    <div class="table-responsive">
                        <div class="mb-3" align="right">
                            <a href="?page=tambah-order" class="btn btn-primary">New Order</a>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No. Order</th>
                                    <th>Name</th>
                                    <th>Order</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($rowOrder as $order): ?>
                                    <tr>
                                        <td><a href="?page=manage-order&detail=<?php echo $order['id'] ?>"><?php echo $order['order_code'] ?></a></td>
                                        <td><?php echo $order['customer_name'] ?></td>
                                        <td><?php echo $order['order_date'] ?></td>
                                        <td><?php echo $order['order_status'] == 0 ? 'Process' : 'Pickup' ?></td>
                                        <td>
                                            <a href="print.php?id=<?php echo $order['id'] ?>" class="btn btn-warning">Print</a>
                                            <a href="?page=order&delete=<?php echo $order['id'] ?>" class="btn btn-danger">Delete</a>
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