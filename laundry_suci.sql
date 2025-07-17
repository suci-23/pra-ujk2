-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jul 2025 pada 11.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_suci`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `phone`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, 'Mas Integrate', '082185462187', 'Manggarai', '2025-07-16 04:56:01', NULL, NULL),
(19, 'Pak Ustadz', '08543249871', 'Kemayoran', '2025-07-16 04:56:19', NULL, NULL),
(20, 'Mpok Yanti', '08526397415', 'Buncit Raya', '2025-07-16 04:57:33', NULL, NULL),
(21, 'Master Fian', '082026419216', 'Tangerang', '2025-07-16 04:57:49', NULL, NULL),
(22, 'Aa Hamijah', '088568741569', 'Cinere', '2025-07-16 04:58:01', NULL, NULL),
(23, 'Bwank Adbul', '08852064485', 'Pasar Rebo', '2025-07-16 04:58:19', NULL, NULL),
(24, 'Masgra', '089317442195', 'Depok', '2025-07-16 04:58:37', NULL, NULL),
(25, 'Non Intan', '08652115799', 'Jl. Tambak', '2025-07-16 04:59:03', NULL, NULL),
(26, 'Kang Sidiq', '054987454984', 'Pasar Rebo', '2025-07-16 04:59:55', NULL, NULL),
(27, 'Mas Yoyo', '0821654935863', 'Cikarang', '2025-07-16 05:00:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`id`, `level_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrator', '2025-06-13 16:22:42', '2025-06-15 01:48:17', NULL),
(2, 'Operator', '2025-06-15 01:46:06', '2025-06-15 01:47:39', NULL),
(3, 'Leader', '2025-06-26 02:17:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id`, `address`, `email`, `name`, `phone`, `create_at`, `update_at`) VALUES
(1, 'Cilandak Barat, Jakarta Selatan', 'laundryasucay@hotmail.com', 'Laundry Suci', '082114816010', '2025-06-22 07:28:46', '2025-07-16 04:50:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_laundry_pickup`
--

CREATE TABLE `trans_laundry_pickup` (
  `id` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `pickup_date` datetime NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_laundry_pickup`
--

INSERT INTO `trans_laundry_pickup` (`id`, `id_order`, `id_customer`, `pickup_date`, `notes`, `created_at`, `updated_at`) VALUES
(20, 43, 24, '2025-07-16 08:26:26', '', '2025-07-16 06:26:26', NULL),
(21, 34, 27, '2025-07-16 08:26:45', '', '2025-07-16 06:26:45', NULL),
(22, 44, 21, '2025-07-16 08:26:59', '', '2025-07-16 06:26:59', NULL),
(23, 46, 23, '2025-07-16 09:44:05', '', '2025-07-16 07:44:05', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_order`
--

CREATE TABLE `trans_order` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `order_code` varchar(50) NOT NULL,
  `order_date` date NOT NULL,
  `order_end_date` date NOT NULL,
  `order_status` tinyint(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `order_pay` int(11) NOT NULL,
  `order_change` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_order`
--

INSERT INTO `trans_order` (`id`, `id_customer`, `order_code`, `order_date`, `order_end_date`, `order_status`, `created_at`, `updated_at`, `deleted_at`, `order_pay`, `order_change`, `total`) VALUES
(31, 0, 'INV-160725-001', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:19:37', '2025-07-16 05:27:47', '2025-07-16 07:27:47', 0, 0, 0),
(32, 0, 'INV-160725-001', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:24:05', '2025-07-16 05:27:46', '2025-07-16 07:27:46', 0, 0, 0),
(33, 0, 'INV-160725-001', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:24:15', '2025-07-16 05:27:27', '2025-07-16 07:27:27', 0, 0, 0),
(34, 27, 'INV-160725-034', '2025-07-17', '2025-07-19', 1, '2025-07-16 05:25:57', '2025-07-16 06:26:45', NULL, 10000, 3000, 7000),
(35, 0, 'INV-160725-035', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:27:56', '2025-07-16 05:29:21', '2025-07-16 07:29:21', 0, 0, 0),
(36, 0, 'INV-160725-036', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:28:03', '2025-07-16 05:29:20', '2025-07-16 07:29:20', 0, 0, 0),
(37, 0, 'INV-160725-037', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:28:04', '2025-07-16 05:29:20', '2025-07-16 07:29:20', 0, 0, 0),
(38, 0, 'INV-160725-038', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:28:04', '2025-07-16 05:29:19', '2025-07-16 07:29:19', 0, 0, 0),
(39, 0, 'INV-160725-039', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:28:04', '2025-07-16 05:29:19', '2025-07-16 07:29:19', 0, 0, 0),
(40, 0, 'INV-160725-040', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:29:24', '2025-07-16 05:29:28', '2025-07-16 07:29:28', 0, 0, 0),
(41, 0, 'INV-160725-041', '0000-00-00', '0000-00-00', 0, '2025-07-16 05:29:58', '2025-07-16 05:30:06', '2025-07-16 07:30:06', 0, 0, 0),
(42, 26, 'INV-160725-042', '2025-07-16', '2025-07-18', 0, '2025-07-16 05:31:45', NULL, NULL, 0, 0, 43000),
(43, 24, 'INV-160725-043', '2025-07-16', '2025-07-18', 1, '2025-07-16 05:36:02', '2025-07-16 06:26:26', NULL, 10000, 5000, 5000),
(44, 21, 'INV-160725-044', '2025-07-16', '2025-07-18', 1, '2025-07-16 05:43:54', '2025-07-16 06:26:59', NULL, 20000, 15000, 5000),
(45, 21, 'INV-160725-045', '2025-07-16', '2025-07-19', 0, '2025-07-16 05:44:23', NULL, NULL, 0, 0, 35000),
(46, 23, 'INV-160725-046', '2025-07-16', '2025-07-18', 1, '2025-07-16 07:38:00', '2025-07-16 07:44:05', NULL, 120000, 8000, 112000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_order_detail`
--

CREATE TABLE `trans_order_detail` (
  `id` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` double(20,2) NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_order_detail`
--

INSERT INTO `trans_order_detail` (`id`, `id_order`, `id_service`, `qty`, `subtotal`, `notes`, `created_at`, `updated_at`) VALUES
(32, 34, 11, 1000, 7000.00, '', '2025-07-16 05:25:57', NULL),
(33, 42, 10, 3000, 15000.00, '', '2025-07-16 05:31:45', NULL),
(34, 42, 11, 4000, 28000.00, '', '2025-07-16 05:31:45', NULL),
(35, 43, 10, 1000, 5000.00, '', '2025-07-16 05:36:02', NULL),
(36, 44, 8, 1000, 5000.00, '', '2025-07-16 05:43:54', NULL),
(37, 45, 11, 5000, 35000.00, '', '2025-07-16 05:44:23', NULL),
(38, 46, 11, 10000, 70000.00, '', '2025-07-16 07:38:00', NULL),
(39, 46, 8, 3000, 15000.00, '', '2025-07-16 07:38:00', NULL),
(40, 46, 9, 6000, 27000.00, '', '2025-07-16 07:38:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `type_of_service`
--

CREATE TABLE `type_of_service` (
  `id` int(11) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `type_of_service`
--

INSERT INTO `type_of_service` (`id`, `service_name`, `price`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'Cuci dan Gosok', 5000, 'Cuci, Gosok, Lipat', '2025-07-16 04:53:46', NULL, NULL),
(9, 'Hanya Cuci', 4500, 'Hanya Cuci Lipat (Tanpa Gosok)', '2025-07-16 04:54:03', NULL, NULL),
(10, 'Hanya Gosok', 5000, 'Menerima gosok pakaian harian maupun pakaian untuk acara penting', '2025-07-16 04:54:21', NULL, NULL),
(11, 'Laundry Besar', 7000, 'Seperti: Selimut, Karpet, Mantel dan Sprei My Love', '2025-07-16 04:54:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `id_level`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'Min Cay', 'admin@hotmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-13 16:30:48', '2025-07-15 14:42:47'),
(5, 2, 'Nana', 'nanacsh@hotmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-24 01:20:55', '2025-07-15 14:46:41'),
(8, 3, 'BigBoss', 'leaderboss@hotmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-26 02:18:31', '2025-07-15 14:47:14');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order_to_order_id` (`id_order`),
  ADD KEY `customer_id_to_id_customer` (`id_customer`);

--
-- Indeks untuk tabel `trans_order`
--
ALTER TABLE `trans_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer_to_customer_id` (`id_customer`);

--
-- Indeks untuk tabel `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id_to_id_order` (`id_order`),
  ADD KEY `id_service_to_service_id` (`id_service`);

--
-- Indeks untuk tabel `type_of_service`
--
ALTER TABLE `type_of_service`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_level_to_ilevel_id` (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `trans_order`
--
ALTER TABLE `trans_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `type_of_service`
--
ALTER TABLE `type_of_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  ADD CONSTRAINT `customer_id_to_id_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `id_order_to_order_id` FOREIGN KEY (`id_order`) REFERENCES `trans_order` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  ADD CONSTRAINT `id_service_to_service_id` FOREIGN KEY (`id_service`) REFERENCES `type_of_service` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_id_to_id_order` FOREIGN KEY (`id_order`) REFERENCES `trans_order` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `id_level_to_ilevel_id` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
