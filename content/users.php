<?php
//Pembatasan Akses, Leader Tidak Bisa Masuk Halaman User
if (strtolower($rowLevel['level_name']) != 'administrator') {
    header("location:home.php?access=denied");
    exit;
}

//Relasi User Dengan Level
$queryUser = mysqli_query($config, "SELECT user.*, level_name FROM user
                            LEFT JOIN level ON user.id_level = level.id
                            ORDER BY user.id DESC");
$rowUser = mysqli_fetch_all($queryUser, MYSQLI_ASSOC);

//HAPUS DATA USER
if (isset($_GET['delete'])) {
    $id_user = $_GET['delete'];
    $now = date('Y-m-d H:i:s');
    mysqli_query($config, "DELETE FROM user WHERE id = '$id_user'");
    header("location:?page=users&removed=success");
}
?>
<section class="section">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Data Users</h5>
                    <div class="table-responsive">
                        <div class="mb-3" align="right">
                            <a href="?page=manage-user" class="btn btn-primary">Add User</a>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Level</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($rowUser as $key => $user): ?>
                                    <tr>
                                        <td><?php echo $key += 1 ?></td>
                                        <td><?php echo $user['name'] ?></td>
                                        <td><?php echo $user['email'] ?></td>
                                        <td><?php echo $user['level_name'] ?></td>
                                        <td>
                                            <a href="?page=manage-user&edit=<?php echo $user['id'] ?>" class="btn btn-warning">Edit</a>
                                            <a href="?page=users&delete=<?php echo $user['id'] ?>" class="btn btn-danger">Delete</a>
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