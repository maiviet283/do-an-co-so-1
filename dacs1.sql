-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 11, 2024 lúc 04:42 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dacs1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'nhan vien');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6),
(6, 1, 8),
(7, 1, 9),
(8, 1, 10),
(9, 1, 11),
(10, 1, 12),
(11, 1, 13),
(12, 1, 14),
(13, 1, 15),
(14, 1, 16),
(15, 1, 20),
(16, 1, 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add danh muc', 1, 'add_danhmuc'),
(2, 'Can change danh muc', 1, 'change_danhmuc'),
(3, 'Can delete danh muc', 1, 'delete_danhmuc'),
(4, 'Can view danh muc', 1, 'view_danhmuc'),
(5, 'Can add do uong', 2, 'add_douong'),
(6, 'Can change do uong', 2, 'change_douong'),
(7, 'Can delete do uong', 2, 'delete_douong'),
(8, 'Can view do uong', 2, 'view_douong'),
(9, 'Can add gio hang', 3, 'add_giohang'),
(10, 'Can change gio hang', 3, 'change_giohang'),
(11, 'Can delete gio hang', 3, 'delete_giohang'),
(12, 'Can view gio hang', 3, 'view_giohang'),
(13, 'Can add khach hang', 4, 'add_khachhang'),
(14, 'Can change khach hang', 4, 'change_khachhang'),
(15, 'Can delete khach hang', 4, 'delete_khachhang'),
(16, 'Can view khach hang', 4, 'view_khachhang'),
(17, 'Can add thanh toan', 5, 'add_thanhtoan'),
(18, 'Can change thanh toan', 5, 'change_thanhtoan'),
(19, 'Can delete thanh toan', 5, 'delete_thanhtoan'),
(20, 'Can view thanh toan', 5, 'view_thanhtoan'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add permission', 7, 'add_permission'),
(26, 'Can change permission', 7, 'change_permission'),
(27, 'Can delete permission', 7, 'delete_permission'),
(28, 'Can view permission', 7, 'view_permission'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add content type', 10, 'add_contenttype'),
(38, 'Can change content type', 10, 'change_contenttype'),
(39, 'Can delete content type', 10, 'delete_contenttype'),
(40, 'Can view content type', 10, 'view_contenttype'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session'),
(45, 'Can add gio hang do uong', 12, 'add_giohangdouong'),
(46, 'Can change gio hang do uong', 12, 'change_giohangdouong'),
(47, 'Can delete gio hang do uong', 12, 'delete_giohangdouong'),
(48, 'Can view gio hang do uong', 12, 'view_giohangdouong');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$yUDNR6BLRQD6WqmIjH5zQr$/R4OAHowXg6Le4numEQ44i60iTJx/8JDdbIukri1jwk=', '2024-10-11 14:40:56.197694', 1, 'tfboys2016', 'Mai', 'Quốc Việt', 'vietmq.21it@vku.udn.vn', 1, 1, '2024-06-23 15:39:05.000000'),
(2, 'pbkdf2_sha256$720000$wIbaF7tIEcDMpPUFABKLss$a7zoinptk2aCKYjFWGOiSDYuE6onc2elPCPQC1rIRts=', '2024-07-23 04:22:18.000000', 0, 'nhanvien1', 'Nguyễn', 'Văn An', 'nva123@gmail.com', 1, 1, '2024-06-24 13:35:58.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-06-23 15:48:59.231579', '1', 'Nước Có Ga', 1, '[{\"added\": {}}]', 1, 1),
(2, '2024-06-23 15:49:35.916555', '2', 'Nước Không Có Ga', 1, '[{\"added\": {}}]', 1, 1),
(3, '2024-06-23 15:50:01.376040', '3', 'Nước Trái Cây', 1, '[{\"added\": {}}]', 1, 1),
(4, '2024-06-23 15:50:23.623153', '4', 'Trà Đóng Chai', 1, '[{\"added\": {}}]', 1, 1),
(5, '2024-06-23 15:50:39.297717', '5', 'Nước Ép', 1, '[{\"added\": {}}]', 1, 1),
(6, '2024-06-23 15:50:57.677531', '6', 'Nước Dinh Dưỡng', 1, '[{\"added\": {}}]', 1, 1),
(7, '2024-06-23 15:51:26.567210', '7', 'Đồ Uống Thể Thao', 1, '[{\"added\": {}}]', 1, 1),
(8, '2024-06-23 16:08:39.265532', '1', 'Trà Đào', 1, '[{\"added\": {}}]', 2, 1),
(9, '2024-06-24 06:27:21.248928', '2', 'Trà Đá', 1, '[{\"added\": {}}]', 2, 1),
(10, '2024-06-24 06:28:03.586447', '2', 'Trà Đá', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 2, 1),
(11, '2024-06-24 06:43:39.668525', '3', 'Coca Cola', 1, '[{\"added\": {}}]', 2, 1),
(12, '2024-06-24 06:56:07.023255', '3', 'Coca Cola', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(13, '2024-06-24 06:56:53.615719', '3', 'Coca Cola', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(14, '2024-06-24 06:57:05.333076', '2', 'Trà Đá', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(15, '2024-06-24 06:57:15.536336', '1', 'Trà Đào', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(16, '2024-06-24 07:00:17.068085', '1', 'Trà Đào', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 2, 1),
(17, '2024-06-24 13:21:40.403380', '3', 'Coca Cola', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 2, 1),
(18, '2024-06-24 13:22:22.465548', '2', 'Trà Đá', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 2, 1),
(19, '2024-06-24 13:25:39.127576', '1', 'Mai Quốc Việt (21 tuổi)', 1, '[{\"added\": {}}]', 4, 1),
(20, '2024-06-24 13:30:01.431320', '1', 'Mai Quốc Việt (21 tuổi)', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 4, 1),
(21, '2024-06-24 13:33:45.105312', '1', 'nhan vien', 1, '[{\"added\": {}}]', 8, 1),
(22, '2024-06-24 13:34:54.249284', '1', 'tfboys2016', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 9, 1),
(23, '2024-06-24 13:35:59.309742', '2', 'nhanvien1', 1, '[{\"added\": {}}]', 9, 1),
(24, '2024-06-24 13:36:47.678198', '2', 'nhanvien1', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Groups\", \"Last login\"]}}]', 9, 1),
(25, '2024-06-24 13:36:55.577271', '2', 'nhanvien1', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 9, 1),
(26, '2024-06-24 13:37:05.026517', '2', 'nhanvien1', 2, '[]', 9, 1),
(27, '2024-06-24 13:50:26.879860', '4', 'Sting', 1, '[{\"added\": {}}]', 2, 1),
(28, '2024-06-24 13:51:54.978642', '5', 'Trà Sữa Trân Châu Đen', 1, '[{\"added\": {}}]', 2, 1),
(29, '2024-06-24 13:53:28.793171', '6', 'Trà Tắc', 1, '[{\"added\": {}}]', 2, 1),
(30, '2024-06-24 13:53:58.340136', '6', 'Trà Tắc', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 2, 1),
(31, '2024-06-24 13:57:28.799631', '7', 'Trà Sữa Khoai Môn', 1, '[{\"added\": {}}]', 2, 1),
(32, '2024-06-24 13:58:35.776393', '8', 'Trà Sữa Than Tre', 1, '[{\"added\": {}}]', 2, 1),
(33, '2024-06-24 14:06:44.163569', '9', 'Trà Sữa Hoa Đậu Biếc', 1, '[{\"added\": {}}]', 2, 1),
(34, '2024-06-24 14:10:26.481109', '10', 'Nước Ép Cỏ Lúa Mỳ', 1, '[{\"added\": {}}]', 2, 1),
(35, '2024-06-24 14:11:56.745648', '11', 'Nước Tăng Lực', 1, '[{\"added\": {}}]', 2, 1),
(36, '2024-06-24 14:14:07.714568', '12', 'Nước Ép Cam', 1, '[{\"added\": {}}]', 2, 1),
(37, '2024-06-24 14:15:37.504693', '13', 'Nước Dừa', 1, '[{\"added\": {}}]', 2, 1),
(38, '2024-06-24 14:16:58.837813', '14', 'Nước Lọc', 1, '[{\"added\": {}}]', 2, 1),
(39, '2024-06-24 14:18:33.477386', '15', 'Hạt Hướng Dương', 1, '[{\"added\": {}}]', 2, 1),
(40, '2024-06-24 14:19:15.963395', '8', 'Đồ Ăn Vặt', 1, '[{\"added\": {}}]', 1, 1),
(41, '2024-06-24 14:19:27.845401', '15', 'Hạt Hướng Dương', 2, '[{\"changed\": {\"fields\": [\"Danh muc\"]}}]', 2, 1),
(42, '2024-06-24 14:21:26.049518', '16', 'Nước 7 UP', 1, '[{\"added\": {}}]', 2, 1),
(43, '2024-06-24 14:22:40.608037', '17', 'Trà Ô Long', 1, '[{\"added\": {}}]', 2, 1),
(44, '2024-07-16 03:24:26.756415', '2', 'Ân Nguyễn (21 tuổi)', 1, '[{\"added\": {}}]', 4, 1),
(45, '2024-07-16 03:27:06.882838', '2', 'Ân Nguyễn (21 tuổi)', 3, '', 4, 1),
(46, '2024-07-16 03:27:06.882838', '1', 'Mai Quốc Việt (21 tuổi)', 3, '', 4, 1),
(47, '2024-07-16 03:29:14.285277', '1', 'Giỏ hàng trống (0)', 3, '', 3, 1),
(48, '2024-07-16 03:29:49.775383', '3', 'Ân Nguyễn (21 tuổi)', 1, '[{\"added\": {}}]', 4, 1),
(49, '2024-07-16 03:30:13.243223', '2', 'Sting (3) : 0.0', 2, '[{\"changed\": {\"fields\": [\"Do uong\", \"So luong\", \"Giam gia\"]}}]', 3, 1),
(50, '2024-07-16 03:32:42.142715', '2', 'Sting (3) : 30000.0', 2, '[]', 3, 1),
(51, '2024-07-16 03:32:45.186400', '2', 'Sting (3) : 30000.0', 2, '[]', 3, 1),
(52, '2024-07-16 03:34:01.205015', '2', 'Sting (3) - Tổng Tiền : 30000 VNĐ - Giá Thực Tế 27000.0 VNĐ', 2, '[{\"changed\": {\"fields\": [\"Giam gia\"]}}]', 3, 1),
(53, '2024-07-16 04:36:43.783958', '4', 'Mai Quốc Việt (21 tuổi)', 1, '[{\"added\": {}}]', 4, 1),
(54, '2024-07-16 04:37:14.056123', '3', 'Nước Ép Cam (10) - Tổng Tiền : 150000 VNĐ - Giảm Giá 20% - Giá Thực Tế 120000.0 VNĐ', 2, '[{\"changed\": {\"fields\": [\"Do uong\", \"So luong\", \"Giam gia\"]}}]', 3, 1),
(55, '2024-07-16 04:54:21.366835', '3', 'Ân Nguyễn (21 tuổi)', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 4, 1),
(56, '2024-07-16 04:54:38.196766', '4', 'Mai Quốc Việt (21 tuổi)', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 4, 1),
(57, '2024-07-16 05:39:44.089788', '4', 'Mai Quốc Việt (21 tuổi)', 3, '', 4, 1),
(58, '2024-07-16 05:39:44.089788', '3', 'Ân Nguyễn (21 tuổi)', 3, '', 4, 1),
(59, '2024-07-16 05:39:53.734792', '3', 'Nước Ép Cam (10) - Tổng Tiền : 150000 VNĐ - Giảm Giá 20% - Giá Thực Tế 120000.0 VNĐ', 3, '', 3, 1),
(60, '2024-07-16 05:39:53.739854', '2', 'Sting (3) - Tổng Tiền : 30000 VNĐ - Giảm Giá 10% - Giá Thực Tế 27000.0 VNĐ', 3, '', 3, 1),
(61, '2024-07-16 05:53:53.380012', '1', 'Nước Ngọt', 1, '[{\"added\": {}}]', 1, 1),
(62, '2024-07-16 05:54:28.744770', '2', 'Nước Ép Trái Cây', 1, '[{\"added\": {}}]', 1, 1),
(63, '2024-07-16 05:54:39.959524', '3', 'Sinh Tố', 1, '[{\"added\": {}}]', 1, 1),
(64, '2024-07-16 05:54:47.279833', '4', 'Cà Phê', 1, '[{\"added\": {}}]', 1, 1),
(65, '2024-07-16 05:54:53.319576', '5', 'Trà', 1, '[{\"added\": {}}]', 1, 1),
(66, '2024-07-16 05:55:00.559568', '6', 'Sữa Lạnh', 1, '[{\"added\": {}}]', 1, 1),
(67, '2024-07-16 05:55:08.744778', '7', 'Nước Khoáng', 1, '[{\"added\": {}}]', 1, 1),
(68, '2024-07-16 05:55:23.080014', '8', 'Thức Uống Thảo Mộc', 1, '[{\"added\": {}}]', 1, 1),
(69, '2024-07-16 05:55:33.209741', '9', 'Nước Dừa', 1, '[{\"added\": {}}]', 1, 1),
(70, '2024-07-16 05:55:45.409780', '10', 'Nước Nguyên Chất', 1, '[{\"added\": {}}]', 1, 1),
(71, '2024-07-16 05:55:53.929789', '11', 'Đồ Uống Thể Thao', 1, '[{\"added\": {}}]', 1, 1),
(72, '2024-07-16 05:57:01.539811', '12', 'Cocktail', 1, '[{\"added\": {}}]', 1, 1),
(73, '2024-07-16 05:58:06.550204', '1', 'Sting', 1, '[{\"added\": {}}]', 2, 1),
(74, '2024-07-16 05:59:27.069680', '1', 'Sting', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(75, '2024-07-16 06:00:26.830144', '2', '7UP', 1, '[{\"added\": {}}]', 2, 1),
(76, '2024-07-16 06:01:03.739839', '3', 'Coca Cola', 1, '[{\"added\": {}}]', 2, 1),
(77, '2024-07-16 06:02:17.719811', '4', 'Trà Tắc', 1, '[{\"added\": {}}]', 2, 1),
(78, '2024-07-16 06:03:17.650070', '5', 'Nước Dừa', 1, '[{\"added\": {}}]', 2, 1),
(79, '2024-07-16 06:04:31.824825', '6', 'Trà Sữa Than Tre', 1, '[{\"added\": {}}]', 2, 1),
(80, '2024-07-16 06:05:33.744615', '7', 'Trà Sữa Trân Châu Đen', 1, '[{\"added\": {}}]', 2, 1),
(81, '2024-07-16 06:06:35.989581', '8', 'Nước Cam', 1, '[{\"added\": {}}]', 2, 1),
(82, '2024-07-16 06:07:40.914552', '9', 'Trà Sữa Hoa Đậu Biếc', 1, '[{\"added\": {}}]', 2, 1),
(83, '2024-07-16 06:09:01.645959', '5', 'Nước Dừa', 2, '[{\"changed\": {\"fields\": [\"Danh muc\"]}}]', 2, 1),
(84, '2024-07-16 07:06:57.677895', '1', 'Ân Nguyễn (21 tuổi)', 1, '[{\"added\": {}}]', 4, 1),
(85, '2024-07-16 07:08:33.099874', '2', 'Sting (5) - Giảm Giá 0% - Giá Thực Tế: 50000.0 VNĐ', 1, '[{\"added\": {}}]', 12, 1),
(86, '2024-07-16 07:11:37.782856', '2', 'Mai Quốc Việt (21 tuổi)', 1, '[{\"added\": {}}]', 4, 1),
(87, '2024-07-17 02:10:53.917073', '1', 'Sting', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(88, '2024-07-17 02:11:03.691049', '2', '7UP', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(89, '2024-07-17 02:11:18.097855', '3', 'Coca Cola', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(90, '2024-07-17 02:11:51.732739', '4', 'Trà Tắc', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(91, '2024-07-17 02:12:04.142291', '5', 'Nước Dừa', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(92, '2024-07-17 02:12:15.966535', '6', 'Trà Sữa Than Tre', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(93, '2024-07-17 02:12:23.057330', '7', 'Trà Sữa Trân Châu Đen', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(94, '2024-07-17 02:12:35.988848', '8', 'Nước Cam', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(95, '2024-07-17 02:12:42.847348', '9', 'Trà Sữa Hoa Đậu Biếc', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(96, '2024-07-17 02:13:03.069606', '5', 'Nước Dừa', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(97, '2024-07-17 02:13:28.099812', '8', 'Nước Cam', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(98, '2024-07-17 02:13:58.755319', '7', 'Trà Sữa Trân Châu Đen', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(99, '2024-07-17 02:58:45.736303', '2', '7 UP', 2, '[{\"changed\": {\"fields\": [\"Ten\", \"Thong tin\"]}}]', 2, 1),
(100, '2024-07-17 04:55:59.987455', '10', 'Trà Ô Long', 1, '[{\"added\": {}}]', 2, 1),
(101, '2024-07-17 04:56:53.773986', '11', 'Hạt Hướng Dương', 1, '[{\"added\": {}}]', 2, 1),
(102, '2024-07-17 04:57:59.055085', '12', 'Nước Lọc', 1, '[{\"added\": {}}]', 2, 1),
(103, '2024-07-17 04:59:19.946840', '13', 'Nước Ép Cỏ Lúa Mỳ', 1, '[{\"added\": {}}]', 2, 1),
(104, '2024-07-17 05:00:18.284496', '14', 'Trà Sữa Khoai Môn', 1, '[{\"added\": {}}]', 2, 1),
(105, '2024-07-17 05:02:50.726112', '15', 'Rose', 1, '[{\"added\": {}}]', 2, 1),
(106, '2024-07-17 05:04:13.104558', '15', 'Rose', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 2, 1),
(107, '2024-07-17 05:04:36.195472', '15', 'Bea Suzy', 2, '[{\"changed\": {\"fields\": [\"Ten\"]}}]', 2, 1),
(108, '2024-07-17 14:30:06.841890', '12', 'None (None tuổi)', 3, '', 4, 1),
(109, '2024-07-17 14:30:06.851848', '11', 'None (None tuổi)', 3, '', 4, 1),
(110, '2024-07-17 14:30:06.856748', '10', 'None (None tuổi)', 3, '', 4, 1),
(111, '2024-07-17 14:30:06.862155', '9', 'None (None tuổi)', 3, '', 4, 1),
(112, '2024-07-17 14:30:06.863182', '8', 'None (None tuổi)', 3, '', 4, 1),
(113, '2024-07-17 14:30:06.866948', '7', 'None (None tuổi)', 3, '', 4, 1),
(114, '2024-07-17 14:30:06.870597', '6', 'None (None tuổi)', 3, '', 4, 1),
(115, '2024-07-17 14:30:06.877892', '5', 'None (None tuổi)', 3, '', 4, 1),
(116, '2024-07-17 14:30:06.878709', '4', 'None (None tuổi)', 3, '', 4, 1),
(117, '2024-07-17 14:30:06.881724', '3', 'None (None tuổi)', 3, '', 4, 1),
(118, '2024-07-17 14:35:38.567839', '16', 'None (None tuổi)', 3, '', 4, 1),
(119, '2024-07-17 14:35:38.572917', '15', 'None (None tuổi)', 3, '', 4, 1),
(120, '2024-07-17 14:35:38.572917', '14', 'None (None tuổi)', 3, '', 4, 1),
(121, '2024-07-17 14:35:38.572917', '13', 'None (None tuổi)', 3, '', 4, 1),
(122, '2024-07-18 02:10:02.298035', '19', 'None (None tuổi) - USERNAME : user5', 3, '', 4, 1),
(123, '2024-07-18 02:10:02.302037', '18', 'None (None tuổi) - USERNAME : user4', 3, '', 4, 1),
(124, '2024-07-18 02:10:02.304031', '17', 'None (None tuổi) - USERNAME : user3', 3, '', 4, 1),
(125, '2024-07-18 02:12:51.333082', '21', 'None (None tuổi) - USERNAME : user15', 3, '', 4, 1),
(126, '2024-07-18 02:12:51.336081', '20', 'None (None tuổi) - USERNAME : user3', 3, '', 4, 1),
(127, '2024-07-18 08:53:00.166464', '24', 'None (None tuổi) - USERNAME : user4', 3, '', 4, 1),
(128, '2024-07-18 08:53:00.177036', '23', 'None (None tuổi) - USERNAME : qưe', 3, '', 4, 1),
(129, '2024-07-18 08:53:00.181543', '22', 'None (None tuổi) - USERNAME : user3', 3, '', 4, 1),
(130, '2024-07-18 12:07:36.202173', '2', 'nhanvien1', 2, '[]', 9, 1),
(131, '2024-07-18 12:11:51.452431', '25', 'None (None tuổi) - USERNAME : u3', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 4, 1),
(132, '2024-07-18 14:33:58.736371', '29', 'None (None tuổi) - USERNAME : ưqerrqwqưe', 3, '', 4, 1),
(133, '2024-07-18 14:33:58.739367', '28', 'None (None tuổi) - USERNAME : ưqerrqw', 3, '', 4, 1),
(134, '2024-07-18 14:33:58.741366', '27', 'None (None tuổi) - USERNAME : ưqer', 3, '', 4, 1),
(135, '2024-07-18 14:33:58.743135', '26', 'None (None tuổi) - USERNAME : q', 3, '', 4, 1),
(136, '2024-07-18 14:33:58.745134', '25', 'None (None tuổi) - USERNAME : u3', 3, '', 4, 1),
(137, '2024-07-18 15:17:58.555033', '34', 'None (None tuổi) - USERNAME : eq', 3, '', 4, 1),
(138, '2024-07-18 15:17:58.566159', '33', 'None (None tuổi) - USERNAME : ye', 3, '', 4, 1),
(139, '2024-07-18 15:17:58.568164', '32', 'None (None tuổi) - USERNAME : k', 3, '', 4, 1),
(140, '2024-07-18 15:17:58.571183', '31', 'None (None tuổi) - USERNAME : o', 3, '', 4, 1),
(141, '2024-07-18 15:17:58.574179', '30', 'None (None tuổi) - USERNAME : i', 3, '', 4, 1),
(142, '2024-07-19 08:58:30.945977', '35', 'None (None tuổi) - USERNAME : qử', 3, '', 4, 1),
(143, '2024-07-19 16:10:05.276470', '1', 'Ân Nguyễn (21 tuổi) - USERNAME : user1', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 4, 1),
(144, '2024-07-19 16:10:18.631491', '2', 'Mai Quốc Việt (21 tuổi) - USERNAME : user2', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 4, 1),
(145, '2024-07-20 05:52:16.879268', '37', 'None (None tuổi) - USERNAME : ', 3, '', 4, 1),
(146, '2024-07-20 08:21:14.194145', '36', 'None (None tuổi) - USERNAME : user3', 3, '', 4, 1),
(147, '2024-07-20 08:33:37.138249', '13', 'Nước Ép Cỏ Lúa Mỳ', 2, '[{\"changed\": {\"fields\": [\"Thong tin\"]}}]', 2, 1),
(148, '2024-07-20 13:54:54.380652', '2', 'Sting (5) - (ID:1) - Tong Tien : 50000', 3, '', 12, 1),
(149, '2024-07-20 13:55:13.512897', '3', 'Sting (6) - (ID:1) - Tong Tien : 60000', 1, '[{\"added\": {}}]', 12, 1),
(150, '2024-07-20 14:08:06.797561', '4', 'Trà Tắc (3) - (ID:1) - Tong Tien : 45000', 1, '[{\"added\": {}}]', 12, 1),
(151, '2024-07-20 14:42:27.308863', '5', 'Nước Ép Cỏ Lúa Mỳ (1) - (ID:2) - Tong Tien : 25000', 1, '[{\"added\": {}}]', 12, 1),
(152, '2024-07-21 06:46:39.675326', '10', 'Bea Suzy (1) - (ID:1) - Tong Tien : 10000', 3, '', 12, 1),
(153, '2024-07-21 06:53:59.445134', '6', 'ID : 6 - Bea Suzy (2) - (ID:1) - Tong Tien : 20000 VNĐ', 3, '', 12, 1),
(154, '2024-07-21 07:21:18.010509', '4', 'ID : 4 - Trà Tắc (3) - (ID:1) - Tong Tien : 45000 VNĐ', 3, '', 12, 1),
(155, '2024-07-21 07:21:18.013252', '3', 'ID : 3 - Sting (6) - (ID:1) - Tong Tien : 60000 VNĐ', 3, '', 12, 1),
(156, '2024-07-22 09:05:49.136262', '39', 'Ân Nguyễn (21 tuổi) - USERNAME : qq', 3, '', 4, 1),
(157, '2024-07-22 09:05:49.139195', '38', 'Ân (20 tuổi) - USERNAME : q', 3, '', 4, 1),
(158, '2024-07-22 09:19:27.375126', '66', 'ID : 66 - Sting (1) - (ID:1) - Tong Tien : 10000 VNĐ', 1, '[{\"added\": {}}]', 12, 1),
(159, '2024-07-22 09:23:56.783004', '67', 'ID : 67 - Sting (1) - (ID:1) - Tong Tien : 10000 VNĐ', 1, '[{\"added\": {}}]', 12, 1),
(160, '2024-07-22 09:24:03.705524', '68', 'ID : 68 - Nước Dừa (3) - (ID:1) - Tong Tien : 51000 VNĐ', 1, '[{\"added\": {}}]', 12, 1),
(161, '2024-07-22 09:24:33.963504', '69', 'ID : 69 - Trà Tắc (1) - (ID:1) - Tong Tien : 15000 VNĐ', 1, '[{\"added\": {}}]', 12, 1),
(162, '2024-07-22 09:30:35.781489', '70', 'ID : 70 - Bea Suzy (1) - (ID:2) - Tong Tien : 10000 VNĐ', 1, '[{\"added\": {}}]', 12, 1),
(163, '2024-07-30 12:57:51.261978', '2', 'Mai Quốc Việt (21 tuổi) - USERNAME : user2', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 4, 1),
(164, '2024-07-30 12:58:15.401527', '2', 'nhanvien1', 2, '[]', 9, 1),
(165, '2024-08-08 01:48:48.143847', '13', 'Nước Ép Cỏ Lúa Mỳ', 2, '[{\"changed\": {\"fields\": [\"So luong\"]}}]', 2, 1),
(166, '2024-09-19 08:31:22.705738', '2', 'Mai Quốc Việt (21 tuổi) - USERNAME : user2', 2, '[{\"changed\": {\"fields\": [\"Tuoi\"]}}]', 4, 1),
(167, '2024-10-11 14:41:11.680333', '1', 'Nguyễn Thị Ân (21 tuổi) - USERNAME : user1', 2, '[{\"changed\": {\"fields\": [\"Anh\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(8, 'auth', 'group'),
(7, 'auth', 'permission'),
(9, 'auth', 'user'),
(10, 'contenttypes', 'contenttype'),
(11, 'sessions', 'session'),
(1, 'sweet', 'danhmuc'),
(2, 'sweet', 'douong'),
(3, 'sweet', 'giohang'),
(12, 'sweet', 'giohangdouong'),
(4, 'sweet', 'khachhang'),
(5, 'sweet', 'thanhtoan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-23 15:38:19.854023'),
(2, 'auth', '0001_initial', '2024-06-23 15:38:20.454201'),
(3, 'admin', '0001_initial', '2024-06-23 15:38:20.595420'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-23 15:38:20.603465'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-23 15:38:20.637766'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-23 15:38:20.786851'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-23 15:38:20.887208'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-23 15:38:20.912466'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-23 15:38:20.929044'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-23 15:38:20.998568'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-23 15:38:20.998568'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-23 15:38:21.020657'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-23 15:38:21.046478'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-23 15:38:21.080294'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-23 15:38:21.129897'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-23 15:38:21.150071'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-23 15:38:21.196958'),
(18, 'sessions', '0001_initial', '2024-06-23 15:38:21.296455'),
(23, 'sweet', '0001_initial', '2024-07-16 05:49:59.399593'),
(24, 'sweet', '0002_alter_douong_don_gia_alter_douong_so_luong_and_more', '2024-07-16 05:49:59.479549'),
(25, 'sweet', '0003_remove_khachhang_gio_hang_khachhang_gio_hang', '2024-07-16 05:49:59.589575'),
(26, 'sweet', '0004_alter_giohang_do_uong_alter_giohang_so_luong_and_more', '2024-07-16 05:50:00.099796'),
(27, 'sweet', '0005_remove_giohang_do_uong_remove_giohang_giam_gia_and_more', '2024-07-16 05:50:00.959518'),
(28, 'sweet', '0006_alter_khachhang_ten_alter_khachhang_tuoi', '2024-07-17 08:13:28.959292'),
(29, 'sweet', '0007_alter_khachhang_gioi_tinh', '2024-07-17 08:23:35.083481'),
(30, 'sweet', '0008_alter_khachhang_email', '2024-07-17 08:29:11.888330'),
(31, 'sweet', '0009_remove_giohangdouong_giam_gia', '2024-07-20 13:54:37.880015'),
(32, 'sweet', '0010_remove_thanhtoan_giam_gia', '2024-08-03 08:30:28.837408');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0gh2u3502hd9ue7yubgove8m84y030pw', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sO79j:3X0OIcNo1O6MfwBgxKnuxwtabJmX2v54WCmCr4sCca8', '2024-07-15 02:52:39.790323'),
('0hsc5v9prkkxx9d9z6h22iwt2fbjp71y', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sUS56:wuZfqGNxnE0t2z0aNo23zvWjSeNWQ23pH6YSR8psZic', '2024-08-01 14:26:04.114307'),
('32u43xpk9z1u9jn0l3llwfgaqukojzdo', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sTwgb:_SA_Vez4TUPD7_ly5gH5H9FLUGQX1fSR5MsP_3X9dUE', '2024-07-31 04:54:41.947521'),
('6s4dlzn6drpcj618hw3a3tujk5cxfjdc', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sYmP8:Nj57ICyrPqq-K76FOROe2qEh_XJrZ-9yLl3uCl91PL0', '2024-08-13 12:56:38.068452'),
('c719t0cmrbutzy32cac667x25yk7so03', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sNpqf:61-GGRlipDwibcCORMIfnqKZwd_TFNhNlLkm6rEaIVE', '2024-07-14 08:23:49.992925'),
('c9ke4rzjlqdlkvej6nd9q3a28ozg9zvd', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sbrlu:yecE_ustK28W-fPH8Dcswhd5ajCRP9WnX9kfTEcMjq4', '2024-08-22 01:16:54.344070'),
('csvheqdtwoofa61vbshfq1j1pz77ij8s', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sUzeY:BXeMpqIRC9WuQ7ICqpy0WkTwsXqDNA2q7qIdy2YsIwE', '2024-08-03 02:16:54.059429'),
('ctcdrdmwckhbthpi8dnt6pgb361quvx9', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sT0iY:RWnfNf7us1LY0ZMjpdoLupy3i_hXHD5e0BThHWYYBbg', '2024-07-28 15:00:50.257476'),
('d2mx8bikykyvop5vuzm5to5bajjwdndp', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sUjUj:zEDLRdY9W9x2WqMmfXUQsfXjdcwr9tegsIluBRVXjuc', '2024-08-02 09:01:41.570346'),
('gp1pi7vbbrd7gc75vp9uu0vh2ghtnh13', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sa9Zq:Jojc3Zm88JNM8y4BJBq1OMdUSk6s9SbTTrfC5rJXgOY', '2024-08-17 07:53:22.475664'),
('sv9hjj2n32ypj8g62x4b0tf02y8tkhup', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sW73z:TbSmjCaJGLDDy6DR7JuA9PabfNOe8yY2m1Ri8piVmEQ', '2024-08-06 04:23:47.271821'),
('tqiqldywwqs68fhqn29h9yl8cvqifrdd', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sVopx:HODMfwQdYGhQyynTZwpHJfIgs7_bpwkBxqXP9hiEZpE', '2024-08-05 08:56:05.881130'),
('tvomr7yv9gs4jch7wmlyfy2ra5fqd0il', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1smPiy:ex54BlwXbD2FFQX9Czbrqw7cqiyJjq8YF8bOJURalFA', '2024-09-20 03:33:28.232189'),
('vnsg5zd78c3sir02avgt0ea2a529r5dz', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sLjto:gLv98spnF4mAYXAUEiPCZIgMkYBeNj5gdGWfTeBUmFE', '2024-07-08 13:38:24.783880'),
('vvuonbguqrkjrbk2ghmg8q2xdvtt8crl', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1sLPQH:fInDfDiQ3TZC89ye7Mw7RIvXjAOEV-Y2hrUf-4qY_QE', '2024-07-07 15:46:33.841265'),
('xr9rjk74xvn0w2hs3u1pvtlxuxvugfzb', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1szGp6:Y0-I7WxD5IvINBtq0cDejw_V-duPtuIVG2aXyKe42RU', '2024-10-25 14:40:56.197694'),
('xvvzmcoec4ix4679fievvo024rrxl39q', '.eJxVjEsOwiAUAO_C2hA-BYpL956BvA9I1dCktCvj3bVJF7qdmcxLJNjWmraelzSxOAstTr8MgR657YLv0G6zpLmty4RyT-Rhu7zOnJ-Xo_0bVOh13xrPXFCx14Yp0qggelcgWiIHgJhjdoEGy8aWMOjA3xbtiAqGYE0U7w8GYziF:1srCRV:WKseYwgF7pcrT1A5qWakvu6e7IT9ZQAuvv8q4lzfNfg', '2024-10-03 08:23:13.315355');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sweet_danhmuc`
--

CREATE TABLE `sweet_danhmuc` (
  `id` bigint(20) NOT NULL,
  `ten` varchar(64) NOT NULL,
  `thong_tin` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sweet_danhmuc`
--

INSERT INTO `sweet_danhmuc` (`id`, `ten`, `thong_tin`) VALUES
(1, 'Nước Ngọt', '<p>Đồ uống c&oacute; ga, thường chứa đường v&agrave; hương liệu.</p>'),
(2, 'Nước Ép Trái Cây', '<p>Nước được chiết xuất từ tr&aacute;i c&acirc;y tươi, tốt cho sức khỏe.</p>'),
(3, 'Sinh Tố', '<p>Đồ uống l&agrave;m từ tr&aacute;i c&acirc;y xay nhuyễn, thường kết hợp với sữa hoặc yogurt.</p>'),
(4, 'Cà Phê', '<p>Đồ uống được pha từ hạt c&agrave; ph&ecirc; rang xay, phổ biến với nhiều c&aacute;ch chế biến.</p>'),
(5, 'Trà', '<p>Đồ uống được chiết xuất từ l&aacute; tr&agrave;, c&oacute; thể n&oacute;ng hoặc lạnh.</p>'),
(6, 'Sữa Lạnh', '<p>Đồ uống từ sữa tươi, c&oacute; thể th&ecirc;m hương liệu hoặc tr&aacute;i c&acirc;y.</p>'),
(7, 'Nước Khoáng', '<p>Nước thi&ecirc;n nhi&ecirc;n, c&oacute; chứa kho&aacute;ng chất tốt cho sức khỏe.</p>'),
(8, 'Thức Uống Thảo Mộc', '<p>Đồ uống được chiết xuất từ c&aacute;c loại thảo mộc tự nhi&ecirc;n, tốt cho sức khỏe.</p>'),
(9, 'Nước Dừa', '<p>Nước được chiết xuất từ quả dừa tươi, c&oacute; vị ngọt tự nhi&ecirc;n.</p>'),
(10, 'Nước Nguyên Chất', '<p>Nước lọc tinh khiết, kh&ocirc;ng chứa bất kỳ tạp chất n&agrave;o.</p>'),
(11, 'Đồ Uống Thể Thao', '<p>Đồ uống bổ sung điện giải cho người tập thể thao, gi&uacute;p phục hồi sức lực.</p>'),
(12, 'Cocktail', '<p>Đồ uống pha trộn từ nhiều loại nguy&ecirc;n liệu kh&aacute;c nhau, thường c&oacute; cồn.</p>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sweet_douong`
--

CREATE TABLE `sweet_douong` (
  `id` bigint(20) NOT NULL,
  `ten` varchar(64) NOT NULL,
  `anh` varchar(100) DEFAULT NULL,
  `thong_tin` longtext DEFAULT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sweet_douong`
--

INSERT INTO `sweet_douong` (`id`, `ten`, `anh`, `thong_tin`, `so_luong`, `don_gia`) VALUES
(1, 'Sting', 'do_uong/2024/07/Screenshot_2024-06-24_153555.jpg', '<p>Sting l&agrave; loại nước ngọt c&oacute; ga nổi tiếng.</p>', 96, 10000),
(2, '7 UP', 'do_uong/2024/07/Screenshot_2024-06-24_212047.jpg', '<p>7 Up l&agrave; nước ngọt vị chanh thơm ngon.</p>', 49, 10000),
(3, 'Coca Cola', 'do_uong/2024/07/Screenshot_2024-06-24_153446.jpg', '<p>Coca-Cola l&agrave; biểu tượng của nước ngọt.</p>', 72, 10000),
(4, 'Trà Tắc', 'do_uong/2024/07/Screenshot_2024-06-24_153740.jpg', '<p>Tr&agrave; tắc l&agrave; một loại thức uống phổ biến tại Việt Nam.</p>', 51, 15000),
(5, 'Nước Dừa', 'do_uong/2024/07/Screenshot_2024-06-24_211458.jpg', '<p>Nước dừa l&agrave; một loại thức uống tự nhi&ecirc;n, trong suốt.</p>', 41, 17000),
(6, 'Trà Sữa Than Tre', 'do_uong/2024/07/sp6.jpg', '<p>Tr&agrave; sữa than tre l&agrave; một loại đồ uống độc đ&aacute;o.</p>', 20, 25000),
(7, 'Trà Sữa Trân Châu Đen', 'do_uong/2024/07/Screenshot_2024-06-24_153649.jpg', '<p>Tr&agrave; sữa tr&acirc;n ch&acirc;u đen l&agrave; một trong những m&oacute;n đồ uống phổ biến nhất.</p>', 60, 15000),
(8, 'Nước Cam', 'do_uong/2024/07/Screenshot_2024-06-24_211324.jpg', '<p>Nước cam l&agrave; một loại đồ uống tươi m&aacute;t, được chiết xuất từ quả cam.</p>', 31, 12000),
(9, 'Trà Sữa Hoa Đậu Biếc', 'do_uong/2024/07/sp5.jpg', '<p>Tr&agrave; sữa hoa đậu biếc l&agrave; một loại đồ uống độc đ&aacute;o v&agrave; hấp dẫn.</p>', 29, 24000),
(10, 'Trà Ô Long', 'do_uong/2024/07/Screenshot_2024-06-24_212159.jpg', '<p>Tr&agrave; của &Ocirc;ng Long Trồng Tại Kỳ Trung H&agrave; Tĩnh</p>', 30, 12000),
(11, 'Hạt Hướng Dương', 'do_uong/2024/07/Screenshot_2024-06-24_211754.jpg', '<p>Được chiết xuất từ nụ cười tỏa nắng của The Sun</p>', 50, 5000),
(12, 'Nước Lọc', 'do_uong/2024/07/Screenshot_2024-06-24_211616.jpg', '<p>D&agrave;nh cho mấy đứa ngh&egrave;o h&egrave;n dơ bẩn nha</p>', 50, 7000),
(13, 'Nước Ép Cỏ Lúa Mỳ', 'do_uong/2024/07/nuocepluami.jpg', '<p>Nước &eacute;p từ thi&ecirc;n nhi&ecirc;n, cỏ Tr&acirc;u kh&ocirc;ng d&aacute;m ăn</p>', 2, 25000),
(14, 'Trà Sữa Khoai Môn', 'do_uong/2024/07/sp2.jpg', '<p>L&agrave;m từ củ Sắn nhưng n&oacute;i khoai m&ocirc;n cho ngầu</p>', 20, 30000),
(15, 'Bea Suzy', 'do_uong/2024/07/beasuzy.jpg', '<p>Người ngồi c&ugrave;ng bạn để tr&ograve; chuyện, nếu bạn ph&egrave;n</p>', 31, 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sweet_douong_danh_muc`
--

CREATE TABLE `sweet_douong_danh_muc` (
  `id` bigint(20) NOT NULL,
  `douong_id` bigint(20) NOT NULL,
  `danhmuc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sweet_douong_danh_muc`
--

INSERT INTO `sweet_douong_danh_muc` (`id`, `douong_id`, `danhmuc_id`) VALUES
(1, 1, 1),
(2, 1, 12),
(3, 2, 1),
(4, 2, 12),
(5, 3, 1),
(6, 3, 12),
(8, 4, 2),
(9, 4, 5),
(7, 4, 8),
(11, 5, 2),
(12, 5, 3),
(26, 5, 9),
(10, 5, 11),
(14, 6, 3),
(15, 6, 5),
(16, 6, 6),
(13, 6, 8),
(20, 7, 3),
(17, 7, 8),
(19, 7, 10),
(18, 7, 11),
(21, 8, 2),
(22, 8, 3),
(24, 9, 2),
(25, 9, 5),
(23, 9, 8),
(28, 10, 5),
(29, 10, 7),
(27, 10, 8),
(30, 11, 12),
(31, 12, 1),
(33, 12, 7),
(32, 12, 10),
(35, 13, 3),
(34, 13, 8),
(36, 14, 2),
(37, 14, 5),
(38, 15, 1),
(39, 15, 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sweet_giohang`
--

CREATE TABLE `sweet_giohang` (
  `id` bigint(20) NOT NULL,
  `khach_hang_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sweet_giohang`
--

INSERT INTO `sweet_giohang` (`id`, `khach_hang_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sweet_giohangdouong`
--

CREATE TABLE `sweet_giohangdouong` (
  `id` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `do_uong_id` bigint(20) NOT NULL,
  `gio_hang_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sweet_giohangdouong`
--

INSERT INTO `sweet_giohangdouong` (`id`, `so_luong`, `do_uong_id`, `gio_hang_id`) VALUES
(83, 5, 3, 1),
(85, 7, 2, 1),
(100, 2, 1, 2),
(105, 25, 13, 2),
(106, 6, 3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sweet_khachhang`
--

CREATE TABLE `sweet_khachhang` (
  `id` bigint(20) NOT NULL,
  `anh` varchar(100) DEFAULT NULL,
  `ten` varchar(128) DEFAULT NULL,
  `tuoi` int(11) DEFAULT NULL,
  `gioi_tinh` varchar(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `sdt` varchar(12) DEFAULT NULL,
  `dia_chi` varchar(128) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sweet_khachhang`
--

INSERT INTO `sweet_khachhang` (`id`, `anh`, `ten`, `tuoi`, `gioi_tinh`, `email`, `sdt`, `dia_chi`, `username`, `password`) VALUES
(1, 'khach_hang/2024/10/love_is_true.jpg', 'Nguyễn Thị Ân', 21, 'F', 'duvimuahe123@gmail.com', '0705975416', 'Nghệ An', 'user1', '11'),
(2, 'khach_hang/2024/07/icon_uRTxdrn.jpg', 'Mai Quốc Việt', 21, 'M', 'vietmq.21it@vku.udn.vn', '0705975416', 'Hà Tĩnh', 'user2', 'user2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sweet_thanhtoan`
--

CREATE TABLE `sweet_thanhtoan` (
  `id` bigint(20) NOT NULL,
  `ngay_mua` date NOT NULL,
  `trang_thai` tinyint(1) NOT NULL,
  `tong_tien` int(11) NOT NULL,
  `do_uong_id` bigint(20) NOT NULL,
  `khach_hang_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `sweet_danhmuc`
--
ALTER TABLE `sweet_danhmuc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ten` (`ten`);

--
-- Chỉ mục cho bảng `sweet_douong`
--
ALTER TABLE `sweet_douong`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ten` (`ten`);

--
-- Chỉ mục cho bảng `sweet_douong_danh_muc`
--
ALTER TABLE `sweet_douong_danh_muc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sweet_douong_danh_muc_douong_id_danhmuc_id_e5d67179_uniq` (`douong_id`,`danhmuc_id`),
  ADD KEY `sweet_douong_danh_muc_danhmuc_id_6b132b08_fk_sweet_danhmuc_id` (`danhmuc_id`);

--
-- Chỉ mục cho bảng `sweet_giohang`
--
ALTER TABLE `sweet_giohang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `khach_hang_id` (`khach_hang_id`);

--
-- Chỉ mục cho bảng `sweet_giohangdouong`
--
ALTER TABLE `sweet_giohangdouong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sweet_giohangdouong_do_uong_id_7a5050e5_fk_sweet_douong_id` (`do_uong_id`),
  ADD KEY `sweet_giohangdouong_gio_hang_id_bbcf2370_fk_sweet_giohang_id` (`gio_hang_id`);

--
-- Chỉ mục cho bảng `sweet_khachhang`
--
ALTER TABLE `sweet_khachhang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `sweet_thanhtoan`
--
ALTER TABLE `sweet_thanhtoan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sweet_thanhtoan_do_uong_id_59d6ba51_fk_sweet_douong_id` (`do_uong_id`),
  ADD KEY `sweet_thanhtoan_khach_hang_id_25c18652_fk_sweet_khachhang_id` (`khach_hang_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `sweet_danhmuc`
--
ALTER TABLE `sweet_danhmuc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `sweet_douong`
--
ALTER TABLE `sweet_douong`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `sweet_douong_danh_muc`
--
ALTER TABLE `sweet_douong_danh_muc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `sweet_giohang`
--
ALTER TABLE `sweet_giohang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `sweet_giohangdouong`
--
ALTER TABLE `sweet_giohangdouong`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT cho bảng `sweet_khachhang`
--
ALTER TABLE `sweet_khachhang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `sweet_thanhtoan`
--
ALTER TABLE `sweet_thanhtoan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `sweet_douong_danh_muc`
--
ALTER TABLE `sweet_douong_danh_muc`
  ADD CONSTRAINT `sweet_douong_danh_muc_danhmuc_id_6b132b08_fk_sweet_danhmuc_id` FOREIGN KEY (`danhmuc_id`) REFERENCES `sweet_danhmuc` (`id`),
  ADD CONSTRAINT `sweet_douong_danh_muc_douong_id_1bb3a8c1_fk_sweet_douong_id` FOREIGN KEY (`douong_id`) REFERENCES `sweet_douong` (`id`);

--
-- Các ràng buộc cho bảng `sweet_giohang`
--
ALTER TABLE `sweet_giohang`
  ADD CONSTRAINT `sweet_giohang_khach_hang_id_8d1723b4_fk_sweet_khachhang_id` FOREIGN KEY (`khach_hang_id`) REFERENCES `sweet_khachhang` (`id`);

--
-- Các ràng buộc cho bảng `sweet_giohangdouong`
--
ALTER TABLE `sweet_giohangdouong`
  ADD CONSTRAINT `sweet_giohangdouong_do_uong_id_7a5050e5_fk_sweet_douong_id` FOREIGN KEY (`do_uong_id`) REFERENCES `sweet_douong` (`id`),
  ADD CONSTRAINT `sweet_giohangdouong_gio_hang_id_bbcf2370_fk_sweet_giohang_id` FOREIGN KEY (`gio_hang_id`) REFERENCES `sweet_giohang` (`id`);

--
-- Các ràng buộc cho bảng `sweet_thanhtoan`
--
ALTER TABLE `sweet_thanhtoan`
  ADD CONSTRAINT `sweet_thanhtoan_do_uong_id_59d6ba51_fk_sweet_douong_id` FOREIGN KEY (`do_uong_id`) REFERENCES `sweet_douong` (`id`),
  ADD CONSTRAINT `sweet_thanhtoan_khach_hang_id_25c18652_fk_sweet_khachhang_id` FOREIGN KEY (`khach_hang_id`) REFERENCES `sweet_khachhang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
