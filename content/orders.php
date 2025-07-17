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
                            <a href="?page=manage-order" class="btn btn-primary">New Order</a>
                        </div>
                        <table class="table table-bordered">
                            <thead align="center">
                                <tr>
                                    <th>No. Order</th>
                                    <th>Name</th>
                                    <th>Start Order</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($rowOrder as $order): ?>
                                    <tr>
                                        <td align="center"><a
                                                href="?page=manage-order&detail=<?php echo $order['id'] ?>"><?php echo $order['order_code'] ?></a>
                                        </td>
                                        <td><?php echo $order['customer_name'] ?></td>
                                        <td align="center"><?php echo $order['order_date'] ?></td>
                                        <td align="center">
                                            <?php echo $order['order_status'] == 0 ? '<strong class="text-warning">Process</stong>' : '<strong class="text-success">Picked Up</stong>' ?>
                                        </td>
                                        <td align="center">
                                            <a href="print.php?id=<?php echo $order['id'] ?>" class="btn btn-success">Print</a>
                                            <!-- <a href="?page=orders&delete=<?php echo $order['id'] ?>" class="btn btn-danger">Delete</a> -->
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