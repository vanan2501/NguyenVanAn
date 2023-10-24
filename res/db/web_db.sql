-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 20, 2023 lúc 11:57 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `adminchat`
--

CREATE TABLE `adminchat` (
  `id_chat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `content_chat` text COLLATE utf8_unicode_ci NOT NULL,
  `date_chat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `adminchat`
--

INSERT INTO `adminchat` (`id_chat`, `id_user`, `content_chat`, `date_chat`) VALUES
(16, 1, 'Thiếu quản lý coupon', '2022-05-07 23:49:22'),
(17, 1, 'Kiểm soát bình luận của học viên đối với giáo viên', '2022-05-07 23:54:57'),
(18, 1, 'Gửi Email mời quay lại đối với user k đăng nhập quá 5 ngày', '2022-05-09 17:29:49'),
(19, 1, 'Thêm khóa học thì thêm luôn các tập của khóa học', '2022-04-29 23:51:23'),
(20, 1, 'Hoàn thiện website. Sẵn sàng báo cáo!', '2022-04-29 16:32:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baitap`
--

CREATE TABLE `baitap` (
  `id` int(11) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `ngaytao` date NOT NULL,
  `id_cs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id_gh` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_cs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id_gh`, `id_user`, `id_cs`) VALUES
(10, 1, 36),
(9, 54, 36);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `stt_cate` int(11) NOT NULL,
  `id_cate` varchar(255) NOT NULL,
  `name_cate` varchar(255) NOT NULL,
  `icon_cate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`stt_cate`, `id_cate`, `name_cate`, `icon_cate`) VALUES
(10, 'android', 'Lập trình android', 'android'),
(9, 'c', 'Lập trình c++', 'c++'),
(12, 'c#', 'Lập trình C#.Net', 'C#'),
(11, 'java', 'Lập trình java', 'java'),
(15, 'pttk', 'Phân tích thiết kế', 'pttk'),
(13, 'python', 'Lập trình Python', 'python'),
(8, 'thvp', 'Tin học văn phòng', 'fa fa-desktop');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cmt`
--

CREATE TABLE `cmt` (
  `id_cmt` int(11) NOT NULL,
  `id_cs` int(11) NOT NULL,
  `ten_cmt` varchar(255) NOT NULL,
  `email_cmt` varchar(255) NOT NULL,
  `nd_cmt` text NOT NULL,
  `ngay_cmt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cmt`
--

INSERT INTO `cmt` (`id_cmt`, `id_cs`, `ten_cmt`, `email_cmt`, `nd_cmt`, `ngay_cmt`) VALUES
(3, 19, 'Quản trị viên', 'admin@admin.com', 'Đã kiểm tra khóa học OK!', '2022-04-07 14:40:09'),
(10, 35, 'Quản trị viên', 'quantrivien-web@gmail.com', 'hay quá', '2023-10-19 21:04:48'),
(11, 38, 'Nguyễn Thị Hồng Vi', 'hongvi2112@gmail.com', 'được\r\n', '2023-10-19 22:57:44'),
(12, 38, 'Nguyễn Văn Bình', 'vanbinh@gmail.com', 'hay', '2023-10-20 16:05:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon`
--

CREATE TABLE `coupon` (
  `id_cp` int(11) NOT NULL,
  `code_cp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent_discount` int(11) NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupon`
--

INSERT INTO `coupon` (`id_cp`, `code_cp`, `percent_discount`, `expiration_date`) VALUES
(2, 'coupon20', 20, '2022-04-07'),
(3, 'kmgg20', 20, '2022-04-07'),
(4, 'quocteld45', 45, '2022-04-07'),
(5, 'abc', 30, '2023-10-31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `id_cs` int(11) NOT NULL,
  `ten_cs` varchar(255) NOT NULL,
  `info_cs` varchar(255) NOT NULL,
  `thumb_cs` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `mota_cs` text NOT NULL,
  `giaotrinh_cs` text NOT NULL,
  `id_cate` varchar(255) NOT NULL,
  `gia_cs` int(11) NOT NULL,
  `sobh_cs` int(11) NOT NULL,
  `time_cs` varchar(255) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`id_cs`, `ten_cs`, `info_cs`, `thumb_cs`, `id_user`, `mota_cs`, `giaotrinh_cs`, `id_cate`, `gia_cs`, `sobh_cs`, `time_cs`, `created_date`) VALUES
(19, 'Khóa học lập trình C# Cơ bản', 'Khoá học lần này sẽ mang đến toàn bộ những kiến thức cơ bản về C#. Chào mừng các bạn đã đến với khoá học LẬP TRÌNH C# CƠ BẢN của Kteam.', '9e440bede9cd23fb97b6bd89fe7da7a9.jpg', 44, '<p>Bạn mới bắt đầu học lập trình? Bạn đang muốn học thêm ngôn ngữ lập trình mới? C# là lựa chọn hoàn hảo để đáp ứng các nhu cầu trên.</p>\r\n\r\n<p><strong>Ngôn ngữ C# </strong>là một ngôn ngữ mới, cấu trúc rõ ràng, dễ hiểu và dễ học. C# thừa hưởng những ưu việt từ ngôn ngữ Java, C, C++ cũng như khắc phục được những hạn chế của các ngôn ngữ này. C# là ngôn ngữ lập trình hướng đối tượng được phát triển bởi Microsoft, được xây dựng dựa trên C++ và Java.</p>\r\n\r\n<p>Khoá học lần này sẽ mang đến toàn bộ những kiến thức cơ bản về C#. Chào mừng các bạn đã đến với khoá học <strong>LẬP TRÌNH C# CƠ BẢN</strong> của Kteam.</p>\r\n\r\n<h2>Ứng dụng kiến thức</h2>\r\n\r\n<p>Kteam hy vọng sau khóa học, bạn sẽ nắm được các kiến thức:</p>\r\n\r\n<ul>\r\n	<li>Cái nhìn tổng quan về ngôn ngữ lập trình C#.</li>\r\n	<li>Nắm vững kiến thức nền tảng về C# để học những khóa chuyên sâu hơn </li>\r\n	<li>Nắm vững các coding convention, naming convention</li>\r\n	<li>Thành thạo các thao tác lập trình trên visual studio</li>\r\n	<li>Biết cách tìm ra lỗi và gỡ lỗi trong lập trình</li>\r\n	<li>Và còn nhiều thứ khác chờ các bạn khám phá</li>\r\n	<li>Là kiến thức nền tảng để tiếp cận các công nghệ hay ho của C# như Winform, WPF, ASP.NET, WCF, Xamarin,…</li>\r\n</ul>\r\n', '<p>Bài 1: C# là gì</p>\r\n\r\n<p>Bài 2: Cấu trúc lệnh cơ bản</p>\r\n\r\n<p>Bài 3: Nhập xuất cơ bản</p>\r\n\r\n<p>Bài 4: Biến trong C#</p>\r\n\r\n<p>Bài 5: Kiểu dữ liệu trong C#</p>\r\n\r\n<p>Bài 6: Toán tử trong C# </p>\r\n\r\n<p>Bài 7: Hằng</p>\r\n\r\n<p>Bài 8: Ép kiểu trong C#</p>\r\n\r\n<p>Bài 9: If else trong C# </p>\r\n\r\n<p>Bài 10: Switch case trong C#</p>\r\n', 'c#', 599000, 10, '02:10:23', '2022-04-07'),
(35, 'Khóa học lập trình C++ căn bản', 'Serial dành cho những bạn chưa có bất kỳ kiến thức gì về lập trình, hoặc những bạn mất căn bản muốn lấy lại kiến thức nền tảng lập trình, cụ thể là C++.  Thời lượng mỗi video từ 3 – 30 phút nhằm chia nhỏ quá trình thực hiện, giúp bạn dễ tiếp thu và ứng dụ', '0d33faf216f8bf9a051437e40576d4c6.jpg', 1, '<p>Hiện nay,&nbsp;<strong>C++</strong>&nbsp;đ&atilde; l&agrave; c&aacute;i t&ecirc;n rất quen thuộc trong ng&agrave;nh lập tr&igrave;nh. Mặc d&ugrave; C++ l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh đ&atilde; ra đời kh&aacute; l&acirc;u, nhưng kh&ocirc;ng phải ai cũng c&oacute; cơ hội để t&igrave;m hiểu về n&oacute;.</p>\r\n\r\n<p>V&igrave; vậy,&nbsp;<strong>Kteam&nbsp;</strong>đ&atilde; x&acirc;y dựng l&ecirc;n kh&oacute;a học&nbsp;<strong>LẬP TR&Igrave;NH C++ CĂN BẢN&nbsp;</strong>để cung cấp một lượng kiến thức về ng&ocirc;n ngữ C++ n&oacute;i ri&ecirc;ng, v&agrave; c&aacute;c kh&aacute;i niệm kh&aacute;c trong lập tr&igrave;nh n&oacute;i chung.</p>\r\n\r\n<p>Nội dung kh&oacute;a học sẽ được ph&acirc;n t&aacute;ch một c&aacute;ch chi tiết, nhằm gi&uacute;p c&aacute;c bạn dễ hiểu v&agrave; thực h&agrave;nh được ngay.</p>\r\n\r\n<hr />\r\n<p>Tham gia đ&oacute;ng g&oacute;p kh&oacute;a học cộng đồng</p>\r\n', '<p><strong>B&agrave;i 1:&nbsp;Giới thiệu về C++</strong></p>\r\n\r\n<p><strong>B&agrave;i 2:&nbsp;C&agrave;i đặt m&ocirc;i trường ph&aacute;t triển (IDE) Visual studio 2015</strong></p>\r\n\r\n<p><strong>B&agrave;i 3:&nbsp;X&acirc;y dựng chương tr&igrave;nh C++ đầu ti&ecirc;n với Visual Studio 2015</strong></p>\r\n\r\n<p><strong>B&agrave;i 4:&nbsp;Cấu tr&uacute;c một chương tr&igrave;nh C++ (Structure of a program)</strong></p>\r\n\r\n<p><strong>B&agrave;i 5:&nbsp;Ghi ch&uacute; trong C++ (Comments in C++)</strong></p>\r\n\r\n<p><strong>B&agrave;i 6:&nbsp;Biến trong C++ (Variables in C++)</strong></p>\r\n\r\n<p><strong>B&agrave;i 7:&nbsp;Số tự nhi&ecirc;n v&agrave; Số chấm động trong C++ (Integer, Floating point)</strong></p>\r\n\r\n<p><strong>B&agrave;i 8:&nbsp;Kiểu k&yacute; tự trong C++ (Character)</strong></p>\r\n\r\n<p><strong>B&agrave;i 9:&nbsp;Kiểu luận l&yacute; v&agrave; cơ bản về C&acirc;u điều kiện If (Boolean and If statements)</strong></p>\r\n\r\n<p><strong>B&agrave;i 10:&nbsp;Nhập, Xuất v&agrave; Định dạng dữ liệu trong C++ (Input and Output)</strong></p>\r\n\r\n<p><strong>B&agrave;i 11:&nbsp;Hằng số trong C++ (Constants)</strong></p>\r\n\r\n<p><strong>B&agrave;i 12:&nbsp;To&aacute;n tử số học, to&aacute;n tử tăng giảm, to&aacute;n tử g&aacute;n số học trong C++ (Operators)</strong></p>\r\n\r\n<p><strong>B&agrave;i 13:&nbsp;To&aacute;n tử quan hệ, logic, bitwise, misc v&agrave; độ ưu ti&ecirc;n to&aacute;n tử trong C++</strong></p>\r\n\r\n<p><strong>B&agrave;i 14:&nbsp;Cơ bản về chuỗi k&yacute; tự trong C++ (An introduction to std::string)</strong></p>\r\n\r\n<p><strong>B&agrave;i 15:&nbsp;Biến cục bộ trong C++ (Local variables in C++)</strong></p>\r\n\r\n<p><strong>B&agrave;i 16:&nbsp;Biến to&agrave;n cục trong C++ (Global variables in C++)</strong></p>\r\n\r\n<p><strong>B&agrave;i 17:&nbsp;Biến tĩnh trong C++ (Static variables in C++)</strong></p>\r\n\r\n<p><strong>B&agrave;i 18:&nbsp;&Eacute;p kiểu ngầm định trong C++ (Implicit type conversion in C++)</strong></p>\r\n\r\n<p><strong>B&agrave;i 19:&nbsp;&Eacute;p kiểu tường minh trong C++ (Explicit type conversion in C++)</strong></p>\r\n\r\n<p><strong>B&agrave;i 20:&nbsp;Cơ bản về H&agrave;m v&agrave; Gi&aacute; trị trả về (Basic of functions and return values)</strong></p>\r\n\r\n<p><strong>B&agrave;i 21:&nbsp;Truyền Gi&aacute; Trị cho H&agrave;m (Passing Arguments by Value)</strong></p>\r\n\r\n<p><strong>B&agrave;i 22:&nbsp;Truyền Tham Chiếu cho H&agrave;m (Passing Arguments by Reference)</strong></p>\r\n\r\n<p><strong>B&agrave;i 23:&nbsp;Tiền khai b&aacute;o v&agrave; Định nghĩa H&agrave;m (Forward declarations and Definitions of Functions)</strong></p>\r\n\r\n<p><strong>B&agrave;i 24:&nbsp;Giới thiệu về cấu tr&uacute;c điều khiển (Control flow introduction)</strong></p>\r\n\r\n<p><strong>B&agrave;i 25:&nbsp;C&acirc;u điều kiện If v&agrave; To&aacute;n tử điều kiện (If statements and Conditional operator)</strong></p>\r\n\r\n<p><strong>B&agrave;i 26:&nbsp;C&acirc;u điều kiện Switch trong C++ (Switch statements)</strong></p>\r\n\r\n<p><strong>B&agrave;i 27:&nbsp;C&acirc;u lệnh Goto trong C++ (Goto statements)</strong></p>\r\n\r\n<p><strong>B&agrave;i 28:&nbsp;V&ograve;ng lặp While trong C++ (While statements)</strong></p>\r\n\r\n<p><strong>B&agrave;i 29:&nbsp;V&ograve;ng lặp Do while trong C++ (Do while statements)</strong></p>\r\n\r\n<p><strong>B&agrave;i 30:&nbsp;V&ograve;ng lặp For trong C++ (For statements)</strong></p>\r\n\r\n<p><strong>B&agrave;i 31:&nbsp;Từ kh&oacute;a Break and continue trong C++</strong></p>\r\n\r\n<p><strong>B&agrave;i 32:&nbsp;Ph&aacute;t sinh số ngẫu nhi&ecirc;n trong C++ (Random number generation)</strong></p>\r\n\r\n<p><strong>B&agrave;i 33:&nbsp;Mảng 1 chiều trong C++ (Arrays)</strong></p>\r\n\r\n<p><strong>B&agrave;i 34:&nbsp;C&aacute;c thao t&aacute;c tr&ecirc;n Mảng một chiều</strong></p>\r\n\r\n<p><strong>B&agrave;i 35:&nbsp;Mảng 2 chiều trong C++ (Two-dimensional arrays)</strong></p>\r\n\r\n<p><strong>B&agrave;i 36:&nbsp;C&aacute;c thao t&aacute;c tr&ecirc;n Mảng 2 chiều</strong></p>\r\n\r\n<p><strong>B&agrave;i 37:&nbsp;Mảng k&yacute; tự trong C++ (C-style strings)</strong></p>\r\n\r\n<p><strong>B&agrave;i 38:&nbsp;C&aacute;c thao t&aacute;c tr&ecirc;n Mảng k&yacute; tự (C-style strings)</strong></p>\r\n', 'c', 350000, 38, '30', '2023-10-19'),
(36, 'Khóa học lập trình Android cơ bản', 'Serial dành cho những bạn đã có kiến thức cơ bản về lập trình java, hoặc những bạn mất căn bản muốn lấy lại kiến thức nền tảng Android.', 'b011fe144e133a46f657117595847377.jpg', 54, '<p>&nbsp;</p>\r\n\r\n<p>Nội dung Serial n&agrave;y được ph&acirc;n t&aacute;ch&nbsp;<strong>chi tiết nhất</strong>&nbsp;c&oacute; thể, nhằm gi&uacute;p c&aacute;c bạn&nbsp;<strong>dễ hiểu</strong>&nbsp;v&agrave;&nbsp;<strong>thực h&agrave;nh được ngay</strong>.</p>\r\n\r\n<p>Thời lượng mỗi video trung b&igrave;nh từ&nbsp;<strong>5 &ndash; 30p</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Qua serial n&agrave;y, m&igrave;nh hi vọng c&aacute;c bạn sẽ:</p>\r\n\r\n<ul>\r\n	<li>Nắm vững kiến thức nền tảng về Android&nbsp;để học những kh&oacute;a chuy&ecirc;n s&acirc;u hơn&nbsp;</li>\r\n	<li>Nắm vững c&aacute;c coding convention, naming convention</li>\r\n	<li>Th&agrave;nh thạo c&aacute;c thao t&aacute;c lập tr&igrave;nh tr&ecirc;n android&nbsp;studio</li>\r\n	<li>Biết c&aacute;ch t&igrave;m ra lỗi v&agrave; gỡ lỗi trong lập tr&igrave;nh</li>\r\n	<li>V&agrave; c&ograve;n nhiều thứ kh&aacute;c chờ c&aacute;c bạn kh&aacute;m ph&aacute;</li>\r\n</ul>\r\n', '<p>01.&nbsp;Giới thiệu lập tr&igrave;nh Android v&agrave; c&agrave;i đặt m&ocirc;i trường</p>\r\n\r\n<p>02.&nbsp;C&aacute;c chức năng cơ bản của Android Studio</p>\r\n\r\n<p>03.&nbsp;C&agrave;i đặt m&aacute;y ảo Android - C&oacute; thể bạn chưa biết</p>\r\n\r\n<p>04.&nbsp;C&aacute;ch debug cơ bản với Android Studio</p>\r\n\r\n<p>05.&nbsp;C&aacute;c th&agrave;nh phần giao diện (UI) cơ bản</p>\r\n\r\n<p>06.&nbsp;Intent &amp; Manifest trong L&acirc;̣p trình Android</p>\r\n\r\n<p>07.&nbsp;V&ograve;ng đời của Activity trong Android</p>\r\n\r\n<p>08.&nbsp;Fragment v&agrave; cơ chế BackStack</p>\r\n\r\n<p>09.&nbsp;Material Design v&agrave; Coding Convention</p>\r\n\r\n<p>10.&nbsp;ListView v&agrave; Custom Adapter</p>\r\n\r\n<p>11.&nbsp;RecyclerView v&agrave; ViewHolder trong Android Studio</p>\r\n\r\n<p>12.&nbsp;Giao diện trượt ngang với ViewPager v&agrave; Tab trong Android cơ bản</p>\r\n\r\n<p>13.&nbsp;Animation v&agrave; Transition trong lập tr&igrave;nh Android cơ bản</p>\r\n\r\n<p>14.&nbsp;Xử l&yacute; bất đồng bộ trong lập tr&igrave;nh Android cơ bản</p>\r\n\r\n<p>15.&nbsp;JSON v&agrave; web API trong lập tr&igrave;nh Android cơ bản</p>\r\n\r\n<p>16.&nbsp;Permission trong Android</p>\r\n\r\n<p>17.&nbsp;Xử lý n&ocirc;̣i dung đa phương ti&ecirc;̣n</p>\r\n\r\n<p>18.&nbsp;Lưu trữ dữ li&ecirc;̣u với SharedPreferences</p>\r\n\r\n<p>19.&nbsp;Lưu trữ dữ li&ecirc;̣u với SQLite</p>\r\n\r\n<p>20.&nbsp;Lưu trữ dữ li&ecirc;̣u với SQLite (Thực hành)</p>\r\n\r\n<p>21.&nbsp;Thực h&agrave;nh SQLite với Sugar ORM</p>\r\n', 'android', 450000, 21, '20', '2023-10-19'),
(37, 'Lập trình Java cơ bản đến hướng đối tượng', 'Thông qua khóa học LẬP TRÌNH JAVA CƠ BẢN ĐẾN HƯỚNG ĐỐI TƯỢNG, Kteam sẽ hướng dẫn các bạn kiến thức cơ bản của Java. Để từ đó, có được nền tảng cho phép bạn tiếp tục tìm hiểu những kiến thức tuyệt vời khác của Java hoặc là một ngôn ngữ khác.', '000b367559e8d220ba8ea6c64e4d7b02.png', 1, '<p>Serial n&agrave;y d&agrave;nh cho c&aacute;c bạn muốn học, t&igrave;m hiểu về lập tr&igrave;nh v&agrave; x&aacute;c định theo con đường lập tr&igrave;nh vi&ecirc;n l&acirc;u d&agrave;i. Kh&oacute;a học&nbsp;<strong>kh&ocirc;ng khuyến kh&iacute;ch</strong>&nbsp;những bạn tay ngang v&agrave;o học lập tr&igrave;nh v&igrave; bản chất&nbsp;<strong>Java&nbsp;</strong>l&agrave; ng&ocirc;n ngữ kh&oacute; học v&agrave; cần đi theo con đường học tập chuy&ecirc;n s&acirc;u.&nbsp;</p>\r\n\r\n<p>Kh&oacute;a học n&agrave;y y&ecirc;u cầu sinh vi&ecirc;n phải c&oacute; kiến thức vững chắc về lập tr&igrave;nh cơ bản thường được học ở trường như nhập m&ocirc;n, kĩ thuật lập tr&igrave;nh, cấu tr&uacute;c dữ liệu,..</p>\r\n', '<p>01. Lịch sử phát tri&ecirc;̉n và tính năng của Java<br />\r\n02. C&agrave;i đặt m&ocirc;i trường Java<br />\r\n03. Viết chương tr&igrave;nh Java đầu ti&ecirc;n<br />\r\n04. C&aacute;c biến trong Java<br />\r\n05. C&aacute;c kiểu dữ liệu trong Java<br />\r\n06. C&aacute;c to&aacute;n tử trong Java<br />\r\n07. Hằng trong Java<br />\r\n08. &Eacute;p kiểu trong Java<br />\r\n09. Cấu tr&uacute;c rẽ nh&aacute;nh trong Java<br />\r\n10. V&ograve;ng lặp while trong Java<br />\r\n11. V&ograve;ng lặp For trong Java<br />\r\n12. Mảng trong Java<br />\r\n13. V&ograve;ng lặp for-each trong java<br />\r\n14. Vai tr&ograve; break, continue trong v&ograve;ng lặp Java<br />\r\n15. Switch trong Java<br />\r\n16. Lập tr&igrave;nh hướng đối tượng trong Java<br />\r\n17. Class trong lập tr&igrave;nh hướng đối tượng<br />\r\n18. C&aacute;c loại phạm vi truy cập trong lập tr&igrave;nh hướng đối tượng<br />\r\n19. Từ kh&oacute;a static trong lập tr&igrave;nh hướng đối tượng<br />\r\n20. Từ kh&oacute;a this trong lập tr&igrave;nh hướng đối tượng<br />\r\n21. Kế thừa trong lập tr&igrave;nh hướng đối tượng<br />\r\n22. Setter v&agrave; getter trong lập tr&igrave;nh hướng đối tượng<br />\r\n23. Overriding v&agrave; Overloading trong Java<br />\r\n24. T&iacute;nh trừu tượng trong lập tr&igrave;nh hướng đối tượng với Java<br />\r\n25. Interface trong lập tr&igrave;nh hướng đối tượng Java<br />\r\n26. Phương thức main trong Java<br />\r\n27. Try catch trong Java<br />\r\n28. Bốn t&iacute;nh chất của hướng đối tượng trong Java</p>\r\n', 'java', 500000, 28, '30', '2023-10-19'),
(38, 'Microsoft Word 2016', 'Microsoft Word không còn quá xa lạ với người dùng sử dụng máy tính. Nếu bạn đã từng sử dụng các phiên bản Word 2017, 2010, 2013 thì phiên bản Word 2016 này sẽ không có gì quá lạ lẫm.', '4f7bbcf0c5a475e5e93439fb98c892fd.jpg', 1, '<p>Trong kh&oacute;a học n&agrave;y, Kteam sẽ tập trung v&agrave;o phần c&agrave;i đặt &amp; sử dụng c&aacute;c c&ocirc;ng cụ cơ bản trong Word như:</p>\r\n\r\n<ul>\r\n	<li>C&aacute;ch tạo, mở, lưu, chỉnh sửa văn bản.</li>\r\n	<li>C&aacute;ch tinh chỉnh, định dạng văn bản, chữ, h&igrave;nh, ...</li>\r\n	<li>C&aacute;ch căn lề, đặt tab, tinh chỉnh khoảng c&aacute;ch đoạn, d&ograve;ng.</li>\r\n	<li>C&aacute;ch tạo mục lục, trộn thư, tạo li&ecirc;n kết, in ấn văn bản.</li>\r\n</ul>\r\n', '<p>&nbsp;L&agrave;m quen với Microsoft Word<br />\r\n01. Khởi Động Chương Tr&igrave;nh Microsoft Word<br />\r\n02. Giới Thiệu Về Thanh Ribbon V&agrave; Giao Diện Chương Tr&igrave;nh Microsoft Word<br />\r\n03. Word Option V&agrave; C&aacute;c Thiết Lập Cơ Bản Trong Microsoft Word<br />\r\n04. Tạo, mở, lưu văn bản trong Microsoft Word.<br />\r\n&nbsp;Thao t&aacute;c với văn bản<br />\r\n05. Thao t&aacute;c với văn bản trong Microsoft Word.<br />\r\n06. Chế độ hiển thị văn bản trong Microsoft Word<br />\r\n07. Hộp thoại Font &amp; Nh&oacute;m Font tr&ecirc;n thanh Ribbon<br />\r\n08. Font, cỡ chữ, thay đổi chữ hoa, chữ thường trong Microsoft Word<br />\r\n&nbsp;Định dạng văn bản<br />\r\n09. Chữ đậm, chữ nghi&ecirc;ng, gạch ch&acirc;n, chỉ số tr&ecirc;n/ dưới trong Microsoft Word<br />\r\n10. M&agrave;u chữ, m&agrave;u nền trong Microsoft Word<br />\r\n11. Sao ch&eacute;p, x&oacute;a bỏ định dạng, undo &amp; redo trong Microsoft Word<br />\r\n12. Bắt đầu với Paragraph settings trong Microsoft Word<br />\r\n13. Căn lề văn bản trong Microsoft Word<br />\r\n14. Thụt d&ograve;ng - Indent trong Microsoft Word<br />\r\n&nbsp;Thao t&aacute;c với đoạn văn<br />\r\n15. Điểm dừng Tab trong Microsoft Word<br />\r\n16. Khoảng c&aacute;ch đoạn, khoảng c&aacute;ch d&ograve;ng trong Microsoft Word<br />\r\n17. Bullets, Numbering, Multilevel list trong Microsoft Word<br />\r\n18. M&agrave;u nền, đường viền trong Microsoft Word<br />\r\n19. T&igrave;m kiếm v&agrave; thay thế trong Microsoft Word<br />\r\n20. Giới thiệu về thẻ Layout v&agrave; hộp thoại Page Setup trong Microsoft Word<br />\r\n21. Chỉnh lề trang v&agrave; định hướng trang trong Microsoft Word<br />\r\n22. Multiple Pages, k&iacute;ch thước trang trong Microsoft Word<br />\r\n23. Ngắt trang v&agrave; cột trong Microsoft Word<br />\r\n&nbsp;Thao t&aacute;c với trang<br />\r\n24. Bắt đầu ch&egrave;n đối tượng trong Microsoft Word<br />\r\n25. Table - Bảng biểu trong Microsoft Word<br />\r\n26. H&igrave;nh Ảnh trong Microsoft Word<br />\r\n27. Shape - H&igrave;nh vẽ trong Microsoft Word<br />\r\n28. Chart - Biểu đồ trong Microsoft Word<br />\r\n&nbsp;Ch&egrave;n đối tượng<br />\r\n29. Header &amp; Footer trong Microsoft Word<br />\r\n30. Ch&egrave;n Text Box &amp; Drop Cap trong Microsoft Word<br />\r\n31. WordArt - Ch&egrave;n chữ nghệ thuật trong Microsoft Word<br />\r\n32. Symbols &amp; Equation- Ch&egrave;n k&iacute; tự đặc biệt v&agrave; c&ocirc;ng thức to&aacute;n học trong Microsoft Word<br />\r\n33. Tạo mục lục cho văn bản trong Microsoft Word<br />\r\n34. Ch&egrave;n ch&uacute; th&iacute;ch v&agrave;o văn bản trong Microsoft Word<br />\r\n35. In văn bản trong Microsoft Word<br />\r\n36. Trộn thư trong Microsoft Word<br />\r\n37. Tạo li&ecirc;n kết trong Microsoft Word<br />\r\n&nbsp;Thao t&aacute;c n&acirc;ng cao</p>\r\n', 'thvp', 200000, 37, '60p', '2023-10-19'),
(39, 'Lập trình Python cơ bản', 'Với mục đích giới thiệu đến mọi người NGÔN NGỮ PYTHON, một ngôn ngữ lập trình khá mới mẻ so với C, C++, Java, PHP ở Việt Nam.  Thông qua khóa học LẬP TRÌNH PYTHON CƠ BẢN, Kteam sẽ hướng dẫn các bạn kiến thức cơ bản của Python. Để từ đó, có được nền tảng c', '692b6f9964e09132c00552afe99cfd90.png', 1, '<p>Serial n&agrave;y d&agrave;nh cho c&aacute;c bạn muốn học, t&igrave;m hiểu về lập tr&igrave;nh v&agrave; muốn t&igrave;m một ng&ocirc;n ngữ dễ học cho người mới bắt đầu, c&oacute; khuynh hướng l&agrave;m về mảng &ldquo;Khoa học m&aacute;y t&iacute;nh&rdquo;.&nbsp;</p>\r\n\r\n<p>Ngo&agrave;i ra, kh&oacute;a&nbsp;<strong>LẬP TR&Igrave;NH PYTHON CƠ BẢN</strong>&nbsp;cũng d&agrave;nh cho những bạn c&oacute; nhiều &yacute; tưởng nhưng thiếu kiến thức về lập tr&igrave;nh, muốn c&oacute; một ng&ocirc;n ngữ đơn giản, dễ học cho việc hiện thực h&oacute;a &yacute; tưởng đ&oacute;.</p>\r\n\r\n<p>Kh&oacute;a học n&agrave;y kh&ocirc;ng c&oacute; những y&ecirc;u cầu khắt khe về kiến thức nền. Do đ&oacute; nếu bạn l&agrave; một người kh&ocirc;ng biết nhiều về lập tr&igrave;nh cũng c&oacute; thể tiếp cận - Bạn cũng kh&ocirc;ng cần phải l&agrave; một thi&ecirc;n t&agrave;i to&aacute;n học</p>\r\n', '<p>01. Giới thiệu ng&ocirc;n ngữ lập tr&igrave;nh Python<br />\r\n02. C&agrave;i đặt m&ocirc;i trường Python<br />\r\n03. C&aacute;ch chạy chương tr&igrave;nh Python<br />\r\n04. C&aacute;ch ghi ch&uacute; trong Python<br />\r\n05. Biến trong Python<br />\r\n06. Kiểu dữ liệu số trong Python<br />\r\n07. Kiểu dữ liệu chuỗi trong Python - Phần 1<br />\r\n08. Kiểu dữ liệu chuỗi trong Python - Phần 2<br />\r\n09. Kiểu dữ liệu chuỗi trong Python - Phần 3<br />\r\n10. Kiểu dữ liệu chuỗi trong Python - Phần 4<br />\r\n11. Kiểu dữ liệu chuỗi trong Python - Phần 5<br />\r\n12. Kiểu dữ liệu List trong Python - Phần 1<br />\r\n13. Kiểu dữ liệu List trong Python - Phần 2<br />\r\n14. Kiểu dữ liệu Tuple trong Python<br />\r\n15. Sự kh&aacute;c nhau về to&aacute;n tử của Hashable object v&agrave; Unhashable object trong Python<br />\r\n16. Kiểu dữ liệu Set trong Python<br />\r\n16. Kiểu dữ liệu Set trong Python &ndash; Phần 2<br />\r\n17. Kiểu dữ liệu Dict trong Python - Phần 1<br />\r\n18. Kiểu dữ liệu Dict trong Python - Phần 2<br />\r\n19. Xử l&yacute; file trong Python<br />\r\n20. Iteration v&agrave; một số h&agrave;m hỗ trợ cho iteration object trong Python<br />\r\n21. Nhập xuất trong Python - H&agrave;m xuất<br />\r\n22. Nhập xuất trong Python - H&agrave;m nhập<br />\r\n23. Kiểu dữ liệu Boolean trong Python<br />\r\n24. Cấu tr&uacute;c rẽ nh&aacute;nh trong Python<br />\r\n25. V&ograve;ng lặp While trong Python<br />\r\n26. V&ograve;ng lặp For trong Python - Phần 1<br />\r\n27. V&ograve;ng lặp For trong Python - Phần 2<br />\r\n28. Kiểu dữ liệu Function trong Python - Sơ lược về h&agrave;m<br />\r\n29. Kiểu dữ liệu Function trong Python - Positional v&agrave; keyword argument<br />\r\n30. Kiểu dữ liệu Function trong Python - Packing v&agrave; unpacking arguments<br />\r\n31. Kiểu dữ liệu Function trong Python - Biến locals v&agrave; globals<br />\r\n32. Kiểu dữ liệu Function trong Python - Return<br />\r\n33. Kiểu dữ liệu function trong Python &ndash; Yield<br />\r\n34. Kiểu dữ liệu function trong Python &ndash; Lambda<br />\r\n35. Kiểu dữ liệu Function trong Python - Functional tools<br />\r\n36. Kiểu dữ liệu Function trong Python - Đệ quy (recursion)<br />\r\n37. Giới thiệu module trong Python<br />\r\n38. Package trong python</p>\r\n', 'python', 520000, 38, '40p', '2023-10-19'),
(40, 'Phân tích thiết kế phần mềm', 'Khóa học phân tích thiết kế phần mềm. Giúp bạn nắm được tư duy phân tích. Thiết kế một hệ thống. Không chỉ phần mềm, mà cả cho cuộc sống của bạn.', '27f5b750958d0084d6b6a3c7856dcd71.jpg', 1, '<p>Qua kh&oacute;a học n&agrave;y c&aacute;c bạn sẽ nắm những kiến thức:</p>\r\n\r\n<ul>\r\n	<li>C&aacute;c quy tr&igrave;nh ph&aacute;t triển phần mềm</li>\r\n	<li>Tạo lược đồ Use-Case</li>\r\n	<li>Tạo lược đồ Activity Diagram</li>\r\n	<li>Tạo ER Diagram</li>\r\n	<li>C&aacute;c chiến lược ph&acirc;n t&iacute;ch ERD</li>\r\n	<li>Từ m&ocirc; h&igrave;nh Thực thể kết hợp th&agrave;nh m&ocirc; h&igrave;nh quan hệ</li>\r\n	<li>Tạo Cơ Sở dữ liệu từ m&ocirc; h&igrave;nh quan hệ</li>\r\n	<li>Thiết kế giao diện người d&ugrave;ng</li>\r\n	<li>Kiến tr&uacute;c phần mềm</li>\r\n</ul>\r\n\r\n<p>N&agrave;o c&ugrave;ng nhau chiến th&ocirc;i!</p>\r\n', '<p>01. Giới thiệu về Ph&acirc;n t&iacute;ch thiết kế phần mềm<br />\r\n02. Tạo lược đồ Use - Case trong PTTKPM<br />\r\n03. Tạo Activity - Diagram trong PTTKPM<br />\r\n04. Giới thiệu về ER Diagram trong PTTKPM<br />\r\n05. Chiến lược ph&acirc;n t&iacute;ch ER Diagram trong PTTKPM<br />\r\n06. Chiến lược ph&acirc;n t&iacute;ch dữ liệu trong PTTKPM<br />\r\n07. Tạo cơ sở dữ liệu từ lược đồ quan hệ trong PTTKPM<br />\r\n08. Thiết kế giao diện người d&ugrave;ng trong PTTKPM<br />\r\n09. Kiến tr&uacute;c v&agrave; ph&acirc;n chia dữ liệu trong PTTKPM</p>\r\n', 'pttk', 100000, 9, '20p', '2023-10-19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc_baitap`
--

CREATE TABLE `danhmuc_baitap` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `danhmuc_baitap`
--

INSERT INTO `danhmuc_baitap` (`id`, `name`, `mota`) VALUES
(1, 'trắc nghiệm ', 0),
(2, 'tự luận ', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc_tailieu`
--

CREATE TABLE `danhmuc_tailieu` (
  `id` int(11) NOT NULL,
  `ten` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `danhmuc_tailieu`
--

INSERT INTO `danhmuc_tailieu` (`id`, `ten`) VALUES
(1, 'Word'),
(2, 'PowerPoint');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `episodes_course`
--

CREATE TABLE `episodes_course` (
  `id_ep` int(11) NOT NULL,
  `id_cs` int(11) NOT NULL,
  `ep_number` int(11) DEFAULT NULL,
  `ep_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `episodes_course`
--

INSERT INTO `episodes_course` (`id_ep`, `id_cs`, `ep_number`, `ep_title`, `video_name`) VALUES
(38, 19, 1, 'C# là gì', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(39, 19, 2, 'Cấu trúc lệnh cơ bản', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(40, 19, 3, 'Nhập xuất cơ bản', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(41, 19, 4, 'Biến trong C#', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(42, 19, 5, 'Kiểu dữ liệu trong C#', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(43, 19, 6, 'Toán tử trong C#', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(44, 19, 7, 'Hằng', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(45, 19, 8, 'Ép kiểu trong C#', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(46, 19, 9, 'If else trong C#', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(47, 19, 10, 'Switch case trong C#', '61dfbff31ca337a775a99a65a5a40524.mp4'),
(215, 35, 1, ' Giới thiệu về C++', 'b8b3b4de1d09159baa1f67190137c144.mp4'),
(216, 35, 2, 'Cài đặt môi trường phát triển (IDE) Visual studio 2015', 'e9bedb873f688b97100a03d7247595fd.mp4'),
(217, 35, 3, 'Xây dựng chương trình C++ đầu tiên với Visual Studio 2015', '1a404c2d8de5224dec06f9c13a09850a.mp4'),
(218, 35, 4, 'Cấu trúc một chương trình C++ (Structure of a program)', 'ca42dbf6b014e8af0a389224ce09a416.mp4'),
(219, 35, 5, 'Ghi chú trong C++ (Comments in C++)', '9eba6cbd51cf5b873f20b17afc825965.mp4'),
(220, 35, 6, 'Biến trong C++ (Variables in C++)', '15448033e35d41502012b8455ebb4ce0.mp4'),
(221, 35, 7, 'Số tự nhiên và Số chấm động trong C++ (Integer, Floating point)', '8cf28b800189d5c3776a363438f54d45.mp4'),
(222, 35, 8, 'Kiểu ký tự trong C++ (Character)', 'b5b0f0d6c38f27ac71b9d665abaa76e1.mp4'),
(223, 35, 9, 'Kiểu luận lý và cơ bản về Câu điều kiện If (Boolean and If statements)', '8760b9a8478a635128a63089240a1983.mp4'),
(224, 35, 10, 'Nhập, Xuất và Định dạng dữ liệu trong C++ (Input and Output)', NULL),
(225, 35, 11, 'Hằng số trong C++ (Constants)', NULL),
(226, 35, 12, 'Toán tử số học, toán tử tăng giảm, toán tử gán số học trong C++ (Operators)', NULL),
(227, 35, 13, 'Toán tử quan hệ, logic, bitwise, misc và độ ưu tiên toán tử trong C++', NULL),
(228, 35, 14, 'Cơ bản về chuỗi ký tự trong C++ (An introduction to std::string)', NULL),
(229, 35, 15, 'Biến cục bộ trong C++ (Local variables in C++)', NULL),
(230, 35, 16, 'Biến toàn cục trong C++ (Global variables in C++)', NULL),
(231, 35, 17, 'Biến tĩnh trong C++ (Static variables in C++)', NULL),
(232, 35, 18, 'Ép kiểu ngầm định trong C++ (Implicit type conversion in C++)', NULL),
(233, 35, 19, 'Ép kiểu tường minh trong C++ (Explicit type conversion in C++)', NULL),
(234, 35, 20, 'Cơ bản về Hàm và Giá trị trả về (Basic of functions and return values)', NULL),
(235, 35, 21, 'Truyền Giá Trị cho Hàm (Passing Arguments by Value)', NULL),
(236, 35, 22, 'Truyền Tham Chiếu cho Hàm (Passing Arguments by Reference)', NULL),
(237, 35, 23, 'Tiền khai báo và Định nghĩa Hàm (Forward declarations and Definitions of Functions)', NULL),
(238, 35, 24, 'Giới thiệu về cấu trúc điều khiển (Control flow introduction)', NULL),
(239, 35, 25, 'Câu điều kiện If và Toán tử điều kiện (If statements and Conditional operator)', NULL),
(240, 35, 26, 'Câu điều kiện Switch trong C++ (Switch statements)', NULL),
(241, 35, 27, 'Câu lệnh Goto trong C++ (Goto statements)', NULL),
(242, 35, 28, 'Vòng lặp While trong C++ (While statements)', NULL),
(243, 35, 29, 'Vòng lặp Do while trong C++ (Do while statements)', NULL),
(244, 35, 30, 'Vòng lặp For trong C++ (For statements)', NULL),
(245, 35, 31, 'Từ khóa Break and continue trong C++', NULL),
(246, 35, 32, ' Phát sinh số ngẫu nhiên trong C++ (Random number generation)', NULL),
(247, 35, 33, 'Mảng 1 chiều trong C++ (Arrays)', NULL),
(248, 35, 34, 'Các thao tác trên Mảng một chiều', NULL),
(249, 35, 35, 'Mảng 2 chiều trong C++ (Two-dimensional arrays)', NULL),
(250, 35, 36, 'Các thao tác trên Mảng 2 chiều', NULL),
(251, 35, 37, 'Mảng ký tự trong C++ (C-style strings)', NULL),
(252, 35, 38, 'Các thao tác trên Mảng ký tự (C-style strings)', NULL),
(253, 36, 1, 'Giới thiệu lập trình Android và cài đặt môi trường', NULL),
(254, 36, 2, 'Các chức năng cơ bản của Android Studio', NULL),
(255, 36, 3, 'Cài đặt máy ảo Android - Có thể bạn chưa biết', NULL),
(256, 36, 4, 'Cách debug cơ bản với Android Studio', NULL),
(257, 36, 5, 'Các thành phần giao diện (UI) cơ bản', NULL),
(258, 36, 6, 'Intent & Manifest trong Lập trình Android', NULL),
(259, 36, 7, ' Vòng đời của Activity trong Android', NULL),
(260, 36, 8, 'Fragment và cơ chế BackStack', NULL),
(261, 36, 9, 'Material Design và Coding Convention', NULL),
(262, 36, 10, 'ListView và Custom Adapter', NULL),
(263, 36, 11, 'RecyclerView và ViewHolder trong Android Studio', NULL),
(264, 36, 12, 'Giao diện trượt ngang với ViewPager và Tab trong Android cơ bản', NULL),
(265, 36, 13, 'Animation và Transition trong lập trình Android cơ bản', NULL),
(266, 36, 14, 'Xử lý bất đồng bộ trong lập trình Android cơ bản', NULL),
(267, 36, 15, 'JSON và web API trong lập trình Android cơ bản', NULL),
(268, 36, 16, 'Permission trong Android', NULL),
(269, 36, 17, 'Xử lý nội dung đa phương tiện', NULL),
(270, 36, 18, 'Lưu trữ dữ liệu với SharedPreferences', NULL),
(271, 36, 19, 'Lưu trữ dữ liệu với SQLite', NULL),
(272, 36, 20, 'Lưu trữ dữ liệu với SQLite (Thực hành)', NULL),
(273, 36, 21, 'Thực hành SQLite với Sugar ORM', NULL),
(274, 37, 1, 'Lịch sử phát triển và tính năng của Java', NULL),
(275, 37, 2, 'Cài đặt môi trường Java', NULL),
(276, 37, 3, 'Viết chương trình Java đầu tiên', NULL),
(277, 37, 4, 'Các biến trong Java', NULL),
(278, 37, 5, 'Các kiểu dữ liệu trong Java', NULL),
(279, 37, 6, 'Các toán tử trong Java', NULL),
(280, 37, 7, 'Hằng trong Java', NULL),
(281, 37, 8, 'Ép kiểu trong Java', NULL),
(282, 37, 9, 'Cấu trúc rẽ nhánh trong Java', NULL),
(283, 37, 10, 'Vòng lặp while trong Java', NULL),
(284, 37, 11, 'Vòng lặp For trong Java', NULL),
(285, 37, 12, 'Mảng trong Java', NULL),
(286, 37, 13, 'Vòng lặp for-each trong java', NULL),
(287, 37, 14, 'Vai trò break, continue trong vòng lặp Java', NULL),
(288, 37, 15, 'Switch trong Java', NULL),
(289, 37, 16, 'Lập trình hướng đối tượng trong Java', NULL),
(290, 37, 17, 'Class trong lập trình hướng đối tượng', NULL),
(291, 37, 18, 'Các loại phạm vi truy cập trong lập trình hướng đối tượng', NULL),
(292, 37, 19, 'Từ khóa static trong lập trình hướng đối tượng', NULL),
(293, 37, 20, 'Từ khóa this trong lập trình hướng đối tượng', NULL),
(294, 37, 21, 'Kế thừa trong lập trình hướng đối tượng', NULL),
(295, 37, 22, 'Setter và getter trong lập trình hướng đối tượng', NULL),
(296, 37, 23, 'Overriding và Overloading trong Java', NULL),
(297, 37, 24, 'Tính trừu tượng trong lập trình hướng đối tượng với Java', NULL),
(298, 37, 25, 'Interface trong lập trình hướng đối tượng Java', NULL),
(299, 37, 26, 'Phương thức main trong Java', NULL),
(300, 37, 27, 'Try catch trong Java', NULL),
(301, 37, 28, 'Bốn tính chất của hướng đối tượng trong Java', NULL),
(302, 38, 1, 'Khởi Động Chương Trình Microsoft Word', NULL),
(303, 38, 2, 'Giới Thiệu Về Thanh Ribbon Và Giao Diện Chương Trình Microsoft Word', NULL),
(304, 38, 3, 'Word Option Và Các Thiết Lập Cơ Bản Trong Microsoft Word', NULL),
(305, 38, 4, 'Tạo, mở, lưu văn bản trong Microsoft Word.  Thao tác với văn bản', NULL),
(306, 38, 5, 'Thao tác với văn bản trong Microsoft Word.', NULL),
(307, 38, 6, 'Chế độ hiển thị văn bản trong Microsoft Word', NULL),
(308, 38, 7, 'Hộp thoại Font & Nhóm Font trên thanh Ribbon', NULL),
(309, 38, 8, 'Font, cỡ chữ, thay đổi chữ hoa, chữ thường trong Microsoft Word  Định dạng văn bản', NULL),
(310, 38, 9, 'Chữ đậm, chữ nghiêng, gạch chân, chỉ số trên/ dưới trong Microsoft Word', NULL),
(311, 38, 10, 'Màu chữ, màu nền trong Microsoft Word', NULL),
(312, 38, 11, 'Sao chép, xóa bỏ định dạng, undo & redo trong Microsoft Word', NULL),
(313, 38, 12, 'Bắt đầu với Paragraph settings trong Microsoft Word', NULL),
(314, 38, 13, 'Căn lề văn bản trong Microsoft Word', NULL),
(315, 38, 14, 'Thụt dòng - Indent trong Microsoft Word  Thao tác với đoạn văn', NULL),
(316, 38, 15, 'Điểm dừng Tab trong Microsoft Word', NULL),
(317, 38, 16, 'Khoảng cách đoạn, khoảng cách dòng trong Microsoft Word', NULL),
(318, 38, 17, 'Bullets, Numbering, Multilevel list trong Microsoft Word', NULL),
(319, 38, 18, 'Màu nền, đường viền trong Microsoft Word', NULL),
(320, 38, 19, 'Tìm kiếm và thay thế trong Microsoft Word', NULL),
(321, 38, 20, 'Giới thiệu về thẻ Layout và hộp thoại Page Setup trong Microsoft Word', NULL),
(322, 38, 21, 'Chỉnh lề trang và định hướng trang trong Microsoft Word', NULL),
(323, 38, 22, 'Multiple Pages, kích thước trang trong Microsoft Word', NULL),
(324, 38, 23, 'Ngắt trang và cột trong Microsoft Word  Thao tác với trang', NULL),
(325, 38, 24, 'Bắt đầu chèn đối tượng trong Microsoft Word', NULL),
(326, 38, 25, 'Table - Bảng biểu trong Microsoft Word', NULL),
(327, 38, 26, 'Hình Ảnh trong Microsoft Word', NULL),
(328, 38, 27, 'Shape - Hình vẽ trong Microsoft Word', NULL),
(329, 38, 28, 'Chart - Biểu đồ trong Microsoft Word  Chèn đối tượng', NULL),
(330, 38, 29, 'Header & Footer trong Microsoft Word', NULL),
(331, 38, 30, 'Chèn Text Box & Drop Cap trong Microsoft Word', NULL),
(332, 38, 31, 'WordArt - Chèn chữ nghệ thuật trong Microsoft Word', NULL),
(333, 38, 32, 'Symbols & Equation- Chèn kí tự đặc biệt và công thức toán học trong Microsoft Word', NULL),
(334, 38, 33, 'Tạo mục lục cho văn bản trong Microsoft Word', NULL),
(335, 38, 34, 'Chèn chú thích vào văn bản trong Microsoft Word', NULL),
(336, 38, 35, 'In văn bản trong Microsoft Word', NULL),
(337, 38, 36, 'Trộn thư trong Microsoft Word', NULL),
(338, 38, 37, 'Tạo liên kết trong Microsoft Word', NULL),
(339, 39, 1, 'Giới thiệu ngôn ngữ lập trình Python', NULL),
(340, 39, 2, 'Cài đặt môi trường Python', NULL),
(341, 39, 3, 'Cách chạy chương trình Python', NULL),
(342, 39, 4, 'Cách ghi chú trong Python', NULL),
(343, 39, 5, 'Biến trong Python', NULL),
(344, 39, 6, 'Kiểu dữ liệu số trong Python', NULL),
(345, 39, 7, 'Kiểu dữ liệu chuỗi trong Python - Phần 1', NULL),
(346, 39, 8, 'Kiểu dữ liệu chuỗi trong Python - Phần 2', NULL),
(347, 39, 9, 'Kiểu dữ liệu chuỗi trong Python - Phần 3', NULL),
(348, 39, 10, 'Kiểu dữ liệu chuỗi trong Python - Phần 4', NULL),
(349, 39, 11, 'Kiểu dữ liệu chuỗi trong Python - Phần 5', NULL),
(350, 39, 12, 'Kiểu dữ liệu List trong Python - Phần 1', NULL),
(351, 39, 13, 'Kiểu dữ liệu List trong Python - Phần 2', NULL),
(352, 39, 14, 'Kiểu dữ liệu Tuple trong Python', NULL),
(353, 39, 15, 'Sự khác nhau về toán tử của Hashable object và Unhashable object trong Python', NULL),
(354, 39, 16, 'Kiểu dữ liệu Set trong Python', NULL),
(355, 39, 17, 'Kiểu dữ liệu Dict trong Python - Phần 1', NULL),
(356, 39, 18, 'Kiểu dữ liệu Dict trong Python - Phần 2', NULL),
(357, 39, 19, 'Xử lý file trong Python', NULL),
(358, 39, 20, 'Iteration và một số hàm hỗ trợ cho iteration object trong Python', NULL),
(359, 39, 21, 'Nhập xuất trong Python - Hàm xuất', NULL),
(360, 39, 22, 'Nhập xuất trong Python - Hàm nhập', NULL),
(361, 39, 23, 'Kiểu dữ liệu Boolean trong Python', NULL),
(362, 39, 24, 'Cấu trúc rẽ nhánh trong Python', NULL),
(363, 39, 25, 'Vòng lặp While trong Python', NULL),
(364, 39, 26, 'Vòng lặp For trong Python - Phần 1', NULL),
(365, 39, 27, 'Vòng lặp For trong Python - Phần 2', NULL),
(366, 39, 28, 'Kiểu dữ liệu Function trong Python - Sơ lược về hàm', NULL),
(367, 39, 29, 'Kiểu dữ liệu Function trong Python - Positional và keyword argument', NULL),
(368, 39, 30, 'Kiểu dữ liệu Function trong Python - Packing và unpacking arguments', NULL),
(369, 39, 31, 'Kiểu dữ liệu Function trong Python - Biến locals và globals', NULL),
(370, 39, 32, 'Kiểu dữ liệu Function trong Python - Return', NULL),
(371, 39, 33, 'Kiểu dữ liệu function trong Python – Yield', NULL),
(372, 39, 34, 'Kiểu dữ liệu function trong Python – Lambda', NULL),
(373, 39, 35, 'Kiểu dữ liệu Function trong Python - Functional tools', NULL),
(374, 39, 36, 'Kiểu dữ liệu Function trong Python - Đệ quy (recursion)', NULL),
(375, 39, 37, 'Giới thiệu module trong Python', NULL),
(376, 39, 38, 'Package trong python', NULL),
(377, 40, 1, 'Giới thiệu về Phân tích thiết kế phần mềm', NULL),
(378, 40, 2, 'Tạo lược đồ Use - Case trong PTTKPM', NULL),
(379, 40, 3, 'Tạo Activity - Diagram trong PTTKPM', NULL),
(380, 40, 4, 'Giới thiệu về ER Diagram trong PTTKPM', NULL),
(381, 40, 5, 'Chiến lược phân tích ER Diagram trong PTTKPM', NULL),
(382, 40, 6, 'Chiến lược phân tích dữ liệu trong PTTKPM', NULL),
(383, 40, 7, 'Tạo cơ sở dữ liệu từ lược đồ quan hệ trong PTTKPM', NULL),
(384, 40, 8, 'Thiết kế giao diện người dùng trong PTTKPM', NULL),
(385, 40, 9, 'Kiến trúc và phân chia dữ liệu trong PTTKPM', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `money_history`
--

CREATE TABLE `money_history` (
  `id_mh` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `menh_gia` int(11) NOT NULL,
  `ma_nap` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `money_history`
--

INSERT INTO `money_history` (`id_mh`, `id_user`, `menh_gia`, `ma_nap`) VALUES
(1, 1, 500000, '1234556'),
(2, 1, 500000, '123546'),
(3, 1, 500000, '23456'),
(4, 44, 500000, '61'),
(5, 44, 50000, 'ádfgdsa'),
(6, 44, 50000, 'sdfhg'),
(7, 44, 200000, 'addfgh'),
(8, 44, 100000, 'trỵuikjl'),
(9, 44, 200000, '23456u'),
(10, 44, 100000, '34567'),
(11, 44, 200000, 'i'),
(12, 44, 100000, 'oi'),
(15, 44, 500000, '123123'),
(24, 1, 500000, '1'),
(27, 1, 10000, '25555'),
(28, 1, 500000, '55555555555'),
(29, 1, 10000, '555555'),
(30, 55, 500000, '5'),
(31, 58, 500000, '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `own`
--

CREATE TABLE `own` (
  `id_own` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_cs` int(11) NOT NULL,
  `id_cp` int(11) DEFAULT NULL,
  `date_own` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `own`
--

INSERT INTO `own` (`id_own`, `id_user`, `id_cs`, `id_cp`, `date_own`) VALUES
(27, 1, 19, NULL, '2022-05-18'),
(29, 1, 35, NULL, '2023-10-19'),
(30, 1, 38, NULL, '2023-10-19'),
(31, 55, 38, NULL, '2023-10-19'),
(32, 58, 38, NULL, '2023-10-20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_request`
--

CREATE TABLE `payment_request` (
  `id_payreq` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `method_payreq` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Loại ngân hàng',
  `name_holder` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chủ thẻ',
  `number_cart` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số tài khoản',
  `amount_payreq` int(11) NOT NULL COMMENT 'Số tiền rút',
  `message_payreq` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tin nhắn kèm theo',
  `state_payreq` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 là chưa thanh toán - 1 là đã thanh toán',
  `date_payreq` datetime NOT NULL,
  `date_payment` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payment_request`
--

INSERT INTO `payment_request` (`id_payreq`, `id_user`, `method_payreq`, `name_holder`, `number_cart`, `amount_payreq`, `message_payreq`, `state_payreq`, `date_payreq`, `date_payment`) VALUES
(6, 44, 'AgriBank', 'Nông Văn Khánh', '1000 0109 0440', 60000, 'Cảm ơn Admin rất nhiều', 1, '2022-04-07 23:42:01', '0000-00-00 00:00:00'),
(7, 44, 'VietcomBank', 'Hoàng Công Hữu', '10024888165', 500000, '', 1, '2022-04-07 00:31:47', '2023-10-20 00:35:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `tenhs` varchar(50) NOT NULL,
  `tuoi` int(11) NOT NULL,
  `gioitinh` int(11) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `ngaysinh` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`id`, `tenhs`, `tuoi`, `gioitinh`, `diachi`, `ngaysinh`, `email`, `phone`, `id_user`) VALUES
(1, 'Phúc', 22, 0, 'hải phòng', '2022-05-04', 'phucdaica@gmail.com', '0398376515', 52);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tailieu`
--

CREATE TABLE `tailieu` (
  `id` int(11) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `loaitl` varchar(50) NOT NULL,
  `ngaytao` date NOT NULL,
  `id_cs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `tengv` varchar(50) NOT NULL,
  `tuoi` int(11) NOT NULL,
  `gioitinh` int(11) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `cvhientai` varchar(50) NOT NULL,
  `ngaysinh` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `teacher`
--

INSERT INTO `teacher` (`id`, `tengv`, `tuoi`, `gioitinh`, `diachi`, `cvhientai`, `ngaysinh`, `email`, `phone`, `id_user`) VALUES
(1, 'Quangg', 23, 0, 'Hải Phòng', 'giáo viên', '2022-05-04', 'vuducquang@gmail.com', '123456789', 43);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacherchat`
--

CREATE TABLE `teacherchat` (
  `id_chat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `content_chat` text COLLATE utf8_unicode_ci NOT NULL,
  `date_chat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `teacherchat`
--

INSERT INTO `teacherchat` (`id_chat`, `id_user`, `content_chat`, `date_chat`) VALUES
(3, 54, 'aaaaa', '2023-10-20 11:59:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `pass_user` varchar(255) NOT NULL,
  `name_user` varchar(255) NOT NULL,
  `job_user` varchar(255) NOT NULL,
  `sex_user` tinyint(4) NOT NULL COMMENT '0-Female, 1-Male',
  `about_user` varchar(255) NOT NULL,
  `permission_user` int(11) NOT NULL DEFAULT 0 COMMENT '0 là chưa kích hoạt mail  -  1 là tv đã active  -  2 là GV  -  3 là ADMIN',
  `code_user` varchar(255) NOT NULL,
  `coin_user` int(11) NOT NULL,
  `avatar_user` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `created_date` date NOT NULL,
  `last_login` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_user`, `email_user`, `pass_user`, `name_user`, `job_user`, `sex_user`, `about_user`, `permission_user`, `code_user`, `coin_user`, `avatar_user`, `created_date`, `last_login`) VALUES
(1, 'quantrivien-web@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Quản trị viên', 'Quản lý hệ thống Edumall', 1, 'Gioi thieu ban than Admin', 3, '', 313800, 'default.jpg', '2022-03-01', '2023-10-20'),
(44, 'conghuu_it@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Công Hữu', 'Giảng viên', 1, 'Dạy giỏi', 1, '', 933000, 'default.jpg', '2022-03-05', '2022-04-10'),
(54, 'vanan25012002@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Nguyễn Văn An', 'giảng viên đại học Mở', 0, '', 2, '', 0, 'default.jpg', '2023-10-12', '2023-10-20'),
(55, 'hongvi2112@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Nguyễn Thị Hồng Vi', '', 0, '', 1, '', 300000, 'default.jpg', '2023-10-19', '2023-10-19'),
(56, 'anhkhoa@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Lê Anh Khoa', '', 0, '', 1, '', 0, 'default.jpg', '2023-10-20', '2023-10-20'),
(57, 'binh@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Phạm Văn Bình', 'giảng viên', 0, '', 2, '', 0, 'default.jpg', '2023-10-20', '2023-10-20'),
(58, 'vanbinh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Văn Bình', '', 0, '', 1, '', 300000, 'default.jpg', '2023-10-20', '2023-10-20');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `adminchat`
--
ALTER TABLE `adminchat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `baitap`
--
ALTER TABLE `baitap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cs` (`id_cs`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_gh`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_cs`),
  ADD KEY `id_cs` (`id_cs`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cate`);

--
-- Chỉ mục cho bảng `cmt`
--
ALTER TABLE `cmt`
  ADD PRIMARY KEY (`id_cmt`),
  ADD KEY `id_cs` (`id_cs`);

--
-- Chỉ mục cho bảng `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id_cp`,`code_cp`);

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_cs`),
  ADD KEY `id_cate` (`id_cate`),
  ADD KEY `id_cate_2` (`id_cate`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `danhmuc_baitap`
--
ALTER TABLE `danhmuc_baitap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhmuc_tailieu`
--
ALTER TABLE `danhmuc_tailieu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `episodes_course`
--
ALTER TABLE `episodes_course`
  ADD PRIMARY KEY (`id_ep`),
  ADD KEY `id_cs` (`id_cs`);

--
-- Chỉ mục cho bảng `money_history`
--
ALTER TABLE `money_history`
  ADD PRIMARY KEY (`id_mh`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `own`
--
ALTER TABLE `own`
  ADD PRIMARY KEY (`id_own`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_cs`),
  ADD KEY `id_cs` (`id_cs`),
  ADD KEY `id_cp` (`id_cp`);

--
-- Chỉ mục cho bảng `payment_request`
--
ALTER TABLE `payment_request`
  ADD PRIMARY KEY (`id_payreq`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tailieu`
--
ALTER TABLE `tailieu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cs` (`id_cs`);

--
-- Chỉ mục cho bảng `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `teacherchat`
--
ALTER TABLE `teacherchat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email_user` (`email_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `adminchat`
--
ALTER TABLE `adminchat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `baitap`
--
ALTER TABLE `baitap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id_gh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `cmt`
--
ALTER TABLE `cmt`
  MODIFY `id_cmt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id_cp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
  MODIFY `id_cs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `danhmuc_baitap`
--
ALTER TABLE `danhmuc_baitap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `danhmuc_tailieu`
--
ALTER TABLE `danhmuc_tailieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `episodes_course`
--
ALTER TABLE `episodes_course`
  MODIFY `id_ep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT cho bảng `money_history`
--
ALTER TABLE `money_history`
  MODIFY `id_mh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `own`
--
ALTER TABLE `own`
  MODIFY `id_own` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `payment_request`
--
ALTER TABLE `payment_request`
  MODIFY `id_payreq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tailieu`
--
ALTER TABLE `tailieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `teacherchat`
--
ALTER TABLE `teacherchat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `adminchat`
--
ALTER TABLE `adminchat`
  ADD CONSTRAINT `adminchat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Các ràng buộc cho bảng `baitap`
--
ALTER TABLE `baitap`
  ADD CONSTRAINT `baitap_ibfk_1` FOREIGN KEY (`id`) REFERENCES `danhmuc_baitap` (`id`),
  ADD CONSTRAINT `baitap_ibfk_2` FOREIGN KEY (`id_cs`) REFERENCES `course` (`id_cs`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_cs`) REFERENCES `course` (`id_cs`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Các ràng buộc cho bảng `cmt`
--
ALTER TABLE `cmt`
  ADD CONSTRAINT `cmt_ibfk_1` FOREIGN KEY (`id_cs`) REFERENCES `course` (`id_cs`);

--
-- Các ràng buộc cho bảng `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Các ràng buộc cho bảng `episodes_course`
--
ALTER TABLE `episodes_course`
  ADD CONSTRAINT `episodes_course_ibfk_1` FOREIGN KEY (`id_cs`) REFERENCES `course` (`id_cs`);

--
-- Các ràng buộc cho bảng `money_history`
--
ALTER TABLE `money_history`
  ADD CONSTRAINT `money_history_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Các ràng buộc cho bảng `own`
--
ALTER TABLE `own`
  ADD CONSTRAINT `own_ibfk_1` FOREIGN KEY (`id_cs`) REFERENCES `course` (`id_cs`),
  ADD CONSTRAINT `own_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `own_ibfk_3` FOREIGN KEY (`id_cp`) REFERENCES `coupon` (`id_cp`);

--
-- Các ràng buộc cho bảng `payment_request`
--
ALTER TABLE `payment_request`
  ADD CONSTRAINT `payment_request_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Các ràng buộc cho bảng `tailieu`
--
ALTER TABLE `tailieu`
  ADD CONSTRAINT `tailieu_ibfk_1` FOREIGN KEY (`id`) REFERENCES `danhmuc_tailieu` (`id`),
  ADD CONSTRAINT `tailieu_ibfk_2` FOREIGN KEY (`id_cs`) REFERENCES `course` (`id_cs`);

--
-- Các ràng buộc cho bảng `teacherchat`
--
ALTER TABLE `teacherchat`
  ADD CONSTRAINT `teacherchat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
