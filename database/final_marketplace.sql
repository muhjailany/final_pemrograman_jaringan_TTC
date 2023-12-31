-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2023 pada 04.00
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_marketplace`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Komputer'),
(2, 'Handphone'),
(3, 'Laptop'),
(4, 'Kamera'),
(5, 'Game');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(50) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `jk_pelanggan` enum('pria','wanita','','') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `foto_pelanggan` varchar(100) NOT NULL,
  `status` enum('pelanggan','penjual','','') NOT NULL DEFAULT 'pelanggan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `jk_pelanggan`, `tgl_lahir`, `alamat_pelanggan`, `telepon_pelanggan`, `foto_pelanggan`, `status`) VALUES
('cOmpOn2021A301h9530', 'jisa@gmail.com', 'a9c7e15e33db64a338e8d707e489195414ae521d', 'Sarjisa jau', 'wanita', '1998-02-20', 'Toraja', '08123456798', '', 'penjual'),
('cOmpOn2021D201o1030', 'winda@gmail.com', '3eac13765df7cba37cdd9c80224749904e441359', 'Winda', 'wanita', '1998-01-10', 'Toraja', '087965432109', '', 'penjual'),
('cOmpOn2021E1001s3431', 'jay@gmail.com', 'f4be4361fe52edb395725df356f983a2ebb534ec', 'muh jay', 'pria', '1997-11-08', 'Makale', '081956789012', '', 'pelanggan'),
('cOmpOn2021M901q5630', 'habel@gmail.com', '792f71cfbc7d63a202a6aa866f5545cbd264ded1', 'Habel', 'pria', '1997-12-19', 'Makale', '086543120987', '', 'pelanggan'),
('cOmpOn2021M901q56301', 'hardis@gmail.com', '792f71cfbc7d63a202a6aa866f5545cbd264ded1', 'Hardis', 'pria', '1997-12-19', 'Tagari', '086543120987', '', 'pelanggan'),
('cOmpOn2021N201l1630', 'iren@gmail.com', '3d049d1a60f9f9e43a33b855254a6b13d1e6af57', 'Iren', 'wanita', '2000-05-05', 'BTL', '08123456789', '', 'penjual'),
('cOmpOn2021N402y4204', 'ranggo@gmail.com', 'f4be4361fe52edb395725df356f983a2ebb534ec', 'ridwan Iwan', 'pria', '1997-11-08', 'Buntu Batu', '089012345678', '', 'pelanggan'),
('cOmpOn2021N801c7830', 'alvon@gmail.com', '4f2f9480158bfc2d9cb087fdd5cdb5b4a16eb03f', 'Alvon', 'pria', '1997-08-16', 'Botang', '081209876543', '', 'pelanggan'),
('cOmpOn2021R301f7930', 'arjun@gmail.com', '92c17fe43c5a92ac494aed593ae2f717ad49a2bd', 'Arjun', 'pria', '1999-06-11', 'Burake', '085671234901', '', 'pelanggan'),
('cOmpOn2021V302t1904', 'nugrah@gmail.com', '2938743b23c6176817dc92ca00a1f3a2a93c7c10', 'Nugrah', 'pria', '1997-11-08', 'Burake', '081234567890', '', 'penjual'),
('cOmpOn2023M206g1915', 'odan@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'odan', 'pria', '2023-02-21', 'pangli', '00', '20230615031312IMG_20210112_152308_027.jpg', 'penjual'),
('cOmpOn2023Y106f6915', 'muhjailany@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'muh_jailani', 'pria', '2001-03-25', 'makale', '082000000000', '202306150408241.png', 'penjual');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` enum('mandiri','bca','bri','bni') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL,
  `id_toko` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` varchar(30) NOT NULL,
  `id_toko` varchar(30) NOT NULL,
  `id_pengiriman` int(11) NOT NULL,
  `distrik_toko` varchar(50) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `resi_pengiriman` varchar(50) NOT NULL,
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_toko`, `id_pengiriman`, `distrik_toko`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `resi_pengiriman`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`) VALUES
(1, 'cOmpOn2021M901q5630', 'cOmpOn2021A301h9530', 0, '', '2023-06-01', 12008000, 'margonda jln. flamboyan no17', '', 0, 'Jawa Barat', 'Depok', 'Kota', '16416', 'tiki', 'ECO', 8000, '4'),
(2, 'cOmpOn2021E1001s3431', 'cOmpOn2021A301h9530', 1, '', '2023-06-01', 15016000, 'cawang', '', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'tiki', 'ECO', 16000, '4'),
(3, 'cOmpOn2021E1001s3431', 'cOmpOn2021N201l1630', 2, '', '2023-06-01', 20008000, 'cawang', 'RESI2021Z702f5604', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'tiki', 'ECO', 8000, '4'),
(4, 'cOmpOn2021R301f7930', 'cOmpOn2021A301h9530', 0, '', '2023-06-01', 15016000, 'Blok M', '', 0, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'tiki', 'ECO', 16000, '4'),
(5, 'cOmpOn2021E1001s3431', 'cOmpOn2021N201l1630', 2, '', '2023-06-01', 22009000, 'budhi asih', 'RESI2021G902f5304', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'jne', 'CTC', 9000, '1-2'),
(6, 'cOmpOn2021N201l1630', 'cOmpOn2021A301h9530', 0, '', '2023-06-01', 5008000, 'cawang', '', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'tiki', 'ECO', 8000, '4'),
(7, 'cOmpOn2021N801c7830', 'cOmpOn2021D201o1030', 0, '', '2023-06-01', 3009000, 'blok m', '', 0, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'jne', 'CTC', 9000, '1-2'),
(8, 'cOmpOn2021R301f7930', 'cOmpOn2021A301h9530', 1, '', '2023-06-01', 27008000, 'fatmawati', '', 0, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'tiki', 'ECO', 8000, '4'),
(9, 'cOmpOn2021N801c7830', 'cOmpOn2021A301h9530', 0, '', '2023-06-01', 32016000, 'rawalumbu', '', 0, 'Jawa Barat', 'Bekasi', 'Kota', '17121', 'tiki', 'ECO', 16000, '4'),
(10, 'cOmpOn2021N801c7830', 'cOmpOn2021A301h9530', 0, '', '2023-06-01', 5008000, 'margonda', '', 0, 'Jawa Barat', 'Depok', 'Kota', '16416', 'tiki', 'ECO', 8000, '4'),
(11, 'cOmpOn2021M901q5630', 'cOmpOn2021A301h9530', 0, '', '2023-06-01', 5007000, 'margonda', '', 0, 'Jawa Barat', 'Depok', 'Kota', '16416', 'pos', 'Paket Kilat Khusus', 7000, '2 HARI'),
(12, 'cOmpOn2021M901q5630', 'cOmpOn2021A301h9530', 2, '', '2023-06-01', 20016000, 'margonda', 'RESI2021B102i6404', 0, 'Jawa Barat', 'Depok', 'Kota', '16416', 'tiki', 'ECO', 16000, '4'),
(13, 'cOmpOn2021M901q5630', 'cOmpOn2021A301h9530', 2, '', '2021-02-04', 17008000, 'kalibata', 'RESI2021H502c3404', 0, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'tiki', 'ECO', 8000, '4'),
(14, 'cOmpOn2021N201l1630', 'cOmpOn2021A301h9530', 2, '', '2021-02-04', 5008000, 'harapan indah', 'RESI2021D202o9904', 0, 'Jawa Barat', 'Bekasi', 'Kota', '17121', 'tiki', 'ECO', 8000, '4'),
(15, 'cOmpOn2021A301h9530', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 5007000, 'fatmawati', '', 0, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'pos', 'Paket Kilat Khusus', 7000, '2 HARI'),
(16, 'cOmpOn2021A301h9530', 'cOmpOn2021N201l1630', 1, '', '2021-02-04', 8009000, 'blok m', '', 0, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'tiki', 'REG', 9000, '2'),
(17, 'cOmpOn2021A301h9530', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 20008000, 'tambora', '', 0, 'DKI Jakarta', 'Jakarta Barat', 'Kota', '11220', 'tiki', 'ECO', 8000, '4'),
(18, 'cOmpOn2021N801c7830', 'cOmpOn2021N201l1630', 1, '', '2021-02-04', 12007000, 'kalibata', '', 0, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'pos', 'Paket Kilat Khusus', 7000, '2 HARI'),
(19, 'cOmpOn2021N801c7830', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 10007000, 'kramatjati', '', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'pos', 'Paket Kilat Khusus', 7000, '2 HARI'),
(20, 'cOmpOn2021D201o1030', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 20008000, 'depok', '', 0, 'Jawa Barat', 'Depok', 'Kota', '16416', 'tiki', 'ECO', 8000, '4'),
(21, 'cOmpOn2021D201o1030', 'cOmpOn2021N201l1630', 2, '', '2021-02-04', 13008000, 'Bojong', 'RESI2021B702v7404', 0, 'Jawa Barat', 'Bogor', 'Kota', '16119', 'tiki', 'ECO', 8000, '4'),
(22, 'cOmpOn2021M901q5630', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 24008000, 'pondok gede', '', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'tiki', 'ECO', 8000, '4'),
(23, 'cOmpOn2021M901q5630', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 18016000, 'jatinegara', '', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'tiki', 'ECO', 16000, '4'),
(24, 'cOmpOn2021E1001s3431', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 12008000, 'tanah abang', '', 0, 'DKI Jakarta', 'Jakarta Pusat', 'Kota', '10540', 'tiki', 'ECO', 8000, '4'),
(25, 'cOmpOn2021R301f7930', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 8015000, 'anyer', '', 0, 'Banten', 'Lebak', 'Kabupaten', '42319', 'tiki', 'ECO', 15000, '5'),
(26, 'cOmpOn2021R301f7930', 'cOmpOn2021N201l1630', 1, '', '2021-02-04', 29009000, 'kalimalang', '', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'tiki', 'REG', 9000, '2'),
(27, 'cOmpOn2021N402y4204', 'cOmpOn2021N201l1630', 0, '', '2021-02-04', 37008000, 'cawang', '', 0, 'DKI Jakarta', 'Jakarta Selatan', 'Kota', '12230', 'tiki', 'ECO', 8000, '4'),
(28, 'cOmpOn2021V302t1904', 'cOmpOn2021N201l1630', 2, '', '2021-02-04', 16008000, 'cawang', 'RESI2021H802f5604', 0, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'tiki', 'ECO', 8000, '4'),
(29, 'cOmpOn2023M206g1915', 'cOmpOn2021N201l1630', 0, '', '2023-06-15', 5049500, 'adasda', '', 0, 'Kalimantan Tengah', 'Barito Selatan', 'Kabupaten', '73711', 'pos', 'Pos Reguler', 49500, '4 HARI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_toko` varchar(30) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `id_toko`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 7, 'cOmpOn2021A301h9530', 1, 'iphone 12 pro max', 12000000, 50, 50, 12000000),
(2, 2, 6, 'cOmpOn2021A301h9530', 1, 'Macbook Pro', 15000000, 2000, 2000, 15000000),
(3, 3, 10, 'cOmpOn2021N201l1630', 1, 'notebook s9 pro', 12000000, 200, 200, 12000000),
(4, 3, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 8000000, 300, 300, 8000000),
(5, 4, 6, 'cOmpOn2021A301h9530', 1, 'Macbook Pro', 15000000, 2000, 2000, 15000000),
(6, 5, 10, 'cOmpOn2021N201l1630', 1, 'notebook s9 pro', 12000000, 200, 200, 12000000),
(7, 5, 9, 'cOmpOn2021N201l1630', 2, 'Monitor qled90', 5000000, 500, 1000, 10000000),
(8, 6, 5, 'cOmpOn2021A301h9530', 1, 'Airpod Pro', 5000000, 10, 10, 5000000),
(9, 7, 3, 'cOmpOn2021D201o1030', 1, 'printer smart tank 616', 3000000, 1000, 1000, 3000000),
(10, 8, 5, 'cOmpOn2021A301h9530', 3, 'Airpod Pro', 5000000, 10, 30, 15000000),
(11, 8, 7, 'cOmpOn2021A301h9530', 1, 'iphone 12 pro max', 12000000, 50, 50, 12000000),
(12, 9, 5, 'cOmpOn2021A301h9530', 1, 'Airpod Pro', 5000000, 10, 10, 5000000),
(13, 9, 7, 'cOmpOn2021A301h9530', 1, 'iphone 12 pro max', 12000000, 50, 50, 12000000),
(14, 9, 6, 'cOmpOn2021A301h9530', 1, 'Macbook Pro', 15000000, 2000, 2000, 15000000),
(15, 10, 5, 'cOmpOn2021A301h9530', 1, 'Airpod Pro', 5000000, 10, 10, 5000000),
(16, 11, 5, 'cOmpOn2021A301h9530', 1, 'Airpod Pro', 5000000, 10, 10, 5000000),
(17, 12, 5, 'cOmpOn2021A301h9530', 1, 'Airpod Pro', 5000000, 10, 10, 5000000),
(18, 12, 6, 'cOmpOn2021A301h9530', 1, 'Macbook Pro', 15000000, 2000, 2000, 15000000),
(19, 13, 5, 'cOmpOn2021A301h9530', 1, 'Airpod Pro', 5000000, 10, 10, 5000000),
(20, 13, 7, 'cOmpOn2021A301h9530', 1, 'iphone 12 pro max', 12000000, 50, 50, 12000000),
(21, 14, 5, 'cOmpOn2021A301h9530', 1, 'Airpod Pro', 5000000, 10, 10, 5000000),
(22, 15, 9, 'cOmpOn2021N201l1630', 1, 'Monitor qled90', 5000000, 500, 500, 5000000),
(23, 16, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 8000000, 300, 300, 8000000),
(24, 17, 10, 'cOmpOn2021N201l1630', 1, 'notebook s9 pro', 12000000, 200, 200, 12000000),
(25, 17, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 8000000, 300, 300, 8000000),
(26, 18, 10, 'cOmpOn2021N201l1630', 1, 'notebook s9 pro', 12000000, 200, 200, 12000000),
(27, 19, 9, 'cOmpOn2021N201l1630', 2, 'Monitor qled90', 5000000, 500, 1000, 10000000),
(28, 20, 10, 'cOmpOn2021N201l1630', 1, 'notebook s9 pro', 12000000, 200, 200, 12000000),
(29, 20, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 8000000, 300, 300, 8000000),
(30, 21, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 8000000, 300, 300, 8000000),
(31, 21, 9, 'cOmpOn2021N201l1630', 1, 'Monitor qled90', 5000000, 500, 500, 5000000),
(32, 22, 10, 'cOmpOn2021N201l1630', 2, 'notebook s9 pro', 12000000, 200, 400, 24000000),
(33, 23, 9, 'cOmpOn2021N201l1630', 2, 'Monitor qled90', 5000000, 500, 1000, 10000000),
(34, 23, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 8000000, 300, 300, 8000000),
(35, 24, 10, 'cOmpOn2021N201l1630', 1, 'notebook s9 pro', 12000000, 200, 200, 12000000),
(36, 25, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 8000000, 300, 300, 8000000),
(37, 26, 9, 'cOmpOn2021N201l1630', 1, 'Monitor qled90', 5000000, 500, 500, 5000000),
(38, 26, 10, 'cOmpOn2021N201l1630', 2, 'notebook s9 pro', 12000000, 200, 400, 24000000),
(39, 27, 9, 'cOmpOn2021N201l1630', 1, 'Monitor qled90', 5000000, 500, 500, 5000000),
(40, 27, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 8000000, 300, 300, 8000000),
(41, 27, 10, 'cOmpOn2021N201l1630', 2, 'notebook s9 pro', 12000000, 200, 400, 24000000),
(42, 28, 8, 'cOmpOn2021N201l1630', 2, 'Samsung note8', 8000000, 300, 600, 16000000),
(43, 29, 8, 'cOmpOn2021N201l1630', 1, 'Samsung note8', 5000000, 300, 300, 5000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `status_pengiriman` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengiriman`
--

INSERT INTO `pengiriman` (`id_pengiriman`, `status_pengiriman`) VALUES
(0, 'belum dibayar'),
(1, 'sedang diproses'),
(2, 'barang dikirm');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `id_toko` varchar(30) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL,
  `stok_awal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `id_toko`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`, `stok_awal`) VALUES
(1, 1, 'cOmpOn2021D201o1030', 'Mouse Wirelles z4000', 250000, 30, '20210130233826mouse hp wirelles z4000.png', 'ini barang bagus', 30, 30),
(2, 1, 'cOmpOn2021D201o1030', 'CPU omen 25L', 10000000, 2000, '20210130234036CPU hp omen 25l.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 20, 20),
(3, 1, 'cOmpOn2021D201o1030', 'printer smart tank 616', 3000000, 1000, '20210130234232hp smart tank 616.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 9, 10),
(4, 3, 'cOmpOn2021D201o1030', 'Probook 600', 6000000, 1000, '20210130234725produk1.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 20, 20),
(5, 2, 'cOmpOn2021A301h9530', 'Airpod Pro', 5000000, 10, '20210131001528Apple_AirPods_Pro_-_White_1024x1024.png', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. A sed repellat cumque ipsa perspiciatis aspernatur incidunt officia recusandae sit inventore iusto eveniet nihil accusantium adipisci, eaque officiis molestias explicabo reiciendis.	', 0, 10),
(6, 3, 'cOmpOn2021A301h9530', 'Macbook Pro', 15000000, 2000, 'macbookpro.png', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. A sed repellat cumque ipsa perspiciatis aspernatur incidunt officia recusandae sit inventore iusto eveniet nihil accusantium adipisci, eaque officiis molestias explicabo reiciendis.', 26, 30),
(7, 2, 'cOmpOn2021A301h9530', 'iphone 12 pro max', 12000000, 50, '20210131002554iphone-12-pro-max-blue-hero.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti veniam, reprehenderit, incidunt voluptas, suscipit, tempora dignissimos ullam necessitatibus quo aliquam perferendis doloribus quidem. At repellendus natus ratione neque libero, atque.', 16, 20),
(8, 2, 'cOmpOn2021N201l1630', 'Samsung note8', 5000000, 300, '20210203134205produk2.png', 'ini barang bagus', 19, 30),
(9, 1, 'cOmpOn2021N201l1630', 'Monitor qled90', 5000000, 500, '2021020318234949-chg90-qled-gaming-monitor-500x500.png', 'ini barang bagus', 10, 20),
(10, 3, 'cOmpOn2021N201l1630', 'notebook s9 pro', 12000000, 200, '20210203182706samsung.0-removebg-preview.png', 'ini produk bagus', 18, 30),
(12, 2, 'cOmpOn2023Y106f6915', 'hp', 1000000, 1, '202306150413216.png', 'ini handphone bagus', 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `id_toko` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_toko` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telepon_toko` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email_toko` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_bank` enum('bca','bni','bri','mandiri') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rek_bank` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto_toko` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deskripsi_toko` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `provinsi_toko` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `distrik_toko` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat_toko` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bergabung` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `telepon_toko`, `email_toko`, `nama_bank`, `rek_bank`, `foto_toko`, `deskripsi_toko`, `provinsi_toko`, `distrik_toko`, `alamat_toko`, `bergabung`) VALUES
('cOmpOn2021A301h9530', 'Apple Indonesia', '021456789012', 'AppleIndonesia@store.com', 'mandiri', '173112700650060', '20210131001059apple-removebg-preview.png', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. A sed repellat cumque ipsa perspiciatis aspernatur incidunt officia recusandae sit inventore iusto eveniet nihil accusantium adipisci, eaque officiis molestias explicabo reiciendis.	', 'DKI Jakarta', 'Jakarta Selatan', 'Cilandak', '2021-01-31'),
('cOmpOn2021D201o1030', 'Hewlett-Packard indonesia', '021345678901', 'HPIndonesia@hpstore.com', 'mandiri', '173112700650034', '20210130233520HP.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ', 'DKI Jakarta', 'Jakarta Timur', 'cawang', '2021-01-31'),
('cOmpOn2021N201l1630', 'Samsung Indonesia', '021987633121', 'samsung@indostore.com', 'bni', '183112700650175', '20210203031629samsung.png', 'ini toko bagus', 'Jawa Barat', 'Bekasi', 'harapan indah', '2021-02-03'),
('cOmpOn2023M206g1915', 'odan', '00', 'odan@gmail.com', 'bri', '123456', '20230615031610IMG-20220523-WA0106.jpg', 'Menjual', 'Sulawesi Selatan', 'Toraja Utara', 'Pangli', '2023-06-15'),
('cOmpOn2023Y106f6915', 'TTC SHOP', '081000000000', 'ttc@gmail.com', 'mandiri', '123456', '202306150410584.jpg', 'ini toko hp', 'Jawa Barat', 'Cirebon', 'jawa barat', '2023-06-15');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_toko` (`id_toko`),
  ADD KEY `id_pengiriman` (`id_pengiriman`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indeks untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indeks untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`),
  ADD KEY `id_toko` (`id_toko`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_pengiriman`) REFERENCES `pengiriman` (`id_pengiriman`),
  ADD CONSTRAINT `pembelian_ibfk_3` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Ketidakleluasaan untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD CONSTRAINT `pembelian_produk_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `pembelian_produk_ibfk_2` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`),
  ADD CONSTRAINT `pembelian_produk_ibfk_3` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Ketidakleluasaan untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD CONSTRAINT `toko_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
