-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 11 2022 г., 16:02
-- Версия сервера: 5.7.29
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tags`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categor`
--

CREATE TABLE `categor` (
  `id` int(255) NOT NULL,
  `name_cat` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categor`
--

INSERT INTO `categor` (`id`, `name_cat`) VALUES
(3, 'Разработка/PHP'),
(4, 'Саморазвитие/ Личная эффективность'),
(7, 'Деловые/Бизнес-процессы'),
(8, 'Деловые/Найм'),
(9, 'Деловые/Реклама'),
(10, 'Деловые/Управление бизнесом'),
(11, 'Деловые/Управление людьми'),
(12, 'Деловые/Управление проектами'),
(13, 'Детские/Воспитание'),
(14, 'Дизайн/Общее'),
(15, 'Дизайн/Logo'),
(16, 'Дизайн/Web дизайн'),
(17, 'Разработка/PHP'),
(18, 'Разработка/HTML и CSS'),
(19, 'Разработка/Проектирование');

-- --------------------------------------------------------

--
-- Структура таблицы `db`
--

CREATE TABLE `db` (
  `id` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tags` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `db`
--

INSERT INTO `db` (`id`, `name`, `author`, `type`, `categories`, `description`, `id_tags`) VALUES
(1, 'Путь джедая', 'Максим Дорофеев', 'Книга', 'Саморазвитие/ Личная эффективность', 'Хорошая книга для саморазвития', 1),
(2, 'Основы JavaScript', 'Дик Аллен', 'Книга', 'Дизайн / Web дизайн', 'Основы веб дизайна', 13),
(3, 'Основы PHP и MySQL', 'Чак Берри', 'Сайт/ Блог', 'Разработка / PHP', 'Серверное программирование', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `links`
--

CREATE TABLE `links` (
  `id_link` int(255) NOT NULL,
  `id` int(255) NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_name` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `links`
--

INSERT INTO `links` (`id_link`, `id`, `link`, `link_name`) VALUES
(8, 1, 'https://avidreaders.ru/book/put-dzhedaya.html', 'Описание книги Путь Джедая'),
(9, 2, 'https://learn.javascript.ru/', 'Электронная версия \"Основы JavaScript\"'),
(10, 3, 'https://htmlacademy.ru/tutorial/php/mysql', 'Электронная версия \"Основы PHP и MySQL\"');

-- --------------------------------------------------------

--
-- Структура таблицы `post_tags`
--

CREATE TABLE `post_tags` (
  `id_post` int(255) NOT NULL,
  `id` int(255) NOT NULL,
  `id_tags` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tags`
--

INSERT INTO `post_tags` (`id_post`, `id`, `id_tags`) VALUES
(4, 3, 2),
(10, 1, 14),
(13, 2, 13),
(15, 1, 1),
(21, 2, 1),
(31, 3, 14),
(35, 1, 2),
(36, 3, 13),
(38, 3, 16),
(42, 1, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `tags_test`
--

CREATE TABLE `tags_test` (
  `id_tags` int(255) NOT NULL,
  `name_tag` varchar(65) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags_test`
--

INSERT INTO `tags_test` (`id_tags`, `name_tag`) VALUES
(12, '#PHP'),
(15, '#TEST'),
(16, '#TEST2'),
(13, '#ВебДизайн'),
(2, '#Продуктивность'),
(14, '#Саморазвитие'),
(1, '#Философия');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categor`
--
ALTER TABLE `categor`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `db`
--
ALTER TABLE `db`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_tags` (`id_tags`);

--
-- Индексы таблицы `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id_link`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `tag_id` (`id_tags`),
  ADD KEY `mat_id` (`id`);

--
-- Индексы таблицы `tags_test`
--
ALTER TABLE `tags_test`
  ADD PRIMARY KEY (`id_tags`),
  ADD KEY `id` (`id_tags`),
  ADD KEY `name_tag` (`name_tag`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categor`
--
ALTER TABLE `categor`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `db`
--
ALTER TABLE `db`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `links`
--
ALTER TABLE `links`
  MODIFY `id_link` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id_post` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `tags_test`
--
ALTER TABLE `tags_test`
  MODIFY `id_tags` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `db`
--
ALTER TABLE `db`
  ADD CONSTRAINT `db_ibfk_1` FOREIGN KEY (`id_tags`) REFERENCES `tags_test` (`id_tags`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`id`) REFERENCES `db` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`id_tags`) REFERENCES `tags_test` (`id_tags`) ON UPDATE CASCADE,
  ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`id`) REFERENCES `db` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
