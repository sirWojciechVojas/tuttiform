-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Lut 2021, 17:46
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `homestead`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `form_fields`
--

CREATE TABLE `form_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filled` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `form_fields`
--

INSERT INTO `form_fields` (`id`, `form_id`, `template`, `attribute`, `question`, `required`, `options`, `filled`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'checkboxes', 'checkboxes.0b6604a0', 'Co myslisz kolego?', 1, '[\"nic\"]', 1, NULL, '2021-02-05 20:38:10', '2021-02-05 20:38:29'),
(2, 1, 'checkboxes', 'checkboxes.0ad41c4b', 'Poloi?', 1, '[\"lkjh\"]', 1, '2021-02-06 10:40:24', '2021-02-06 10:39:58', '2021-02-06 10:40:24'),
(3, 2, 'checkboxes', 'checkboxes.ed403a88', 'Ile to kosztuje?', 1, '[\"5z\\u0142\",\"8z\\u0142\",\"10z\\u0142\",\"18z\\u0142\"]', 1, NULL, '2021-02-06 13:23:14', '2021-02-06 14:43:50');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_fields_form_id_foreign` (`form_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `form_fields`
--
ALTER TABLE `form_fields`
  ADD CONSTRAINT `form_fields_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
