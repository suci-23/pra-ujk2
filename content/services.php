<?php
//Pembatasan Akses, Leader Tidak Bisa Masuk Halaman Service
if (strtolower($rowLevel['level_name']) == 'leader') {
    header("location:home.php?access=denied");
    exit;
}

//SOFT DELETE QUERY
$showService = mysqli_query($config, "SELECT * FROM type_of_service
                                WHERE deleted_at IS NULL ORDER BY id DESC");
$rowService = mysqli_fetch_all($showService, MYSQLI_ASSOC);

if (isset($_GET['delete'])) {
    $delete = $_GET['delete'];
    $now = date('Y-m-d H:i:s');
    mysqli_query($config, "UPDATE type_of_service SET deleted_at = '$now' WHERE id='$delete'");
    header("location:?page=services&removed=success");
}
?>

<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Type Of Services</h5>
                    <div class="table-responsive">

                        <!-- NEW SERVICE Hanya Dikelola Administrator -->
                        <?php if ($_SESSION['ID_LEVEL'] == 1): ?>
                            <div class="mb-3" align="right">
                                <a href="?page=manage-service" class="btn btn-primary">New Service</a>
                            </div>
                        <?php endif ?>
                        <table class="table table-bordered">
                            <thead align="center">
                                <tr>
                                    <th>No</th>
                                    <th>Service Name</th>
                                    <th>Price (/Kg)</th>
                                    <th>Description</th>

                                    <!-- Action Hanya Dikelola Administrator -->
                                    <?php if ($_SESSION['ID_LEVEL'] == 1): ?>
                                        <th>Actions</th>
                                    <?php endif ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($rowService as $index => $service): ?>
                                    <tr>
                                        <td><?php echo $index += 1 ?></td>
                                        <td><?php echo $service['service_name'] ?></td>
                                        <td><?php echo $service['price'] ?></td>
                                        <td><?php echo $service['description'] ?></td>

                                        <!-- Action Hanya Dikelola Administrator -->
                                        <?php if ($_SESSION['ID_LEVEL'] == 1): ?>
                                            <td>
                                                <a href="?page=manage-service&edit=<?php echo $service['id'] ?>" class="btn btn-warning">Edit</a>
                                                <a href="?page=services&delete=<?php echo $service['id'] ?>" class="btn btn-danger">Delete</a>
                                            </td>
                                        <?php endif ?>
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