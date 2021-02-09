-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Lut 2021, 18:51
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
-- Struktura tabeli dla tabeli `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `field_responses`
--

CREATE TABLE `field_responses` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_field_id` int(10) UNSIGNED NOT NULL,
  `form_response_id` int(10) UNSIGNED NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `field_responses`
--

INSERT INTO `field_responses` (`id`, `form_field_id`, `form_response_id`, `answer`, `rating`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '[\"ABBA - Chiquitita\",\"ABBA - Ring, Ring\",\"ABBA - The Winner Takes It All\",\"ABBA - Waterloo\",\"Alice In Chains - Nutshell\",\"Alphaville - Dance With Me\",\"Amy Winehouse - You Know I\'m No Good\",\"Andrzej Zaucha - By\\u0142a\\u015b Serca Biciem\",\"Aphex Twin - IZ-US\",\"Ariana Grande - God Is A Woman\",\"ATB - The Summer\",\"Avril Lavigne - I\'m With You\",\"Bad Boys Blue - I Totally Miss You\",\"Bad Boys Blue - Queen Of Hearts\",\"Billie Elish - bad guy\",\"Billy Idol - Rebel Yell\",\"Billy Idol - White Wedding\",\"Bj\\u00f6rk - Hyper-ballad\",\"Black Sabbath - A National Acrobat\",\"Black Sabbath - The Warning\",\"Blue System - Does Your Mother Really Know\",\"Blue System - Laila\",\"Blue System - My Bed Is Too Big\",\"Blur - Boys And Girls\",\"Bon Jovi - It\'s My Life\",\"Boys - Wolno\\u015b\\u0107\",\"Bryan Adams - Heaven\",\"Cappella - U & Me\",\"Cosmic Gate - The Wave\",\"Daria Zawia\\u0142ow - Szar\\u00f3wka\",\"Dead Or Alive - You Spin Me Round (Like A Record)\",\"Def Leppard - Hysteria\",\"Dire Straits ft. Sting - Money For Nothing\",\"Electric Light Orchestra - Ticket To The Moon\",\"Elton John - Rocket Man\",\"Enigma - Return To Innocence\",\"F.R. David - Girl\",\"Fun Factory - Close To You\",\"Genesis - Home By The Sea\",\"Guns N\'Roses - Patience\",\"Guns N\'Roses - Rocket Queen\",\"Guns N\'Roses - Sweet Child O\'Mine\",\"INXS - By My Side\",\"INXS - Disappear\",\"INXS - Mystify\",\"Jerome - Light\",\"Julee Cruise - Falling\",\"Kaliber 44 - Konfrontacje\",\"Kate Bush - Wuthering Heights\",\"Kelly Clarkson - Behind These Hazel Eyes\",\"Killing Joke - Love Like Blood\",\"Kim Wilde - I Can\'t Get Enough\",\"Kim Wilde - You Keep Me Hangin\' On\",\"King Crimson - Epitaph\",\"Kult - Hej, Czy Nie Wiecie\",\"La Bouche - I Love To Love\",\"Lacrimosa - Halt Mich\",\"Led Zeppelin - Kashmir\",\"Linkin Park - Breaking The Habbit\",\"Linkin Park - Crawling\",\"Linkin Park - Numb\",\"Linkin Park - One Step Closer\",\"Linkin Park - Somewhere I Belong\",\"Loft - Love Is Magic\",\"Lombard - Prze\\u017cyj To Sam (Live)\",\"Lonestar - Amazed\",\"Madonna - Nothing Really Matters\",\"Modern Talking - China In Her Eyes\",\"Nazareth - Dream On\",\"Pakito - Are You Ready\",\"Pink Floyd - Comfortably Numb\",\"Queen - I Want It All\",\"Raz Dwa Trzy - Trudno Nie Wierzy\\u0107 W Nic\",\"Roxette - How Do You Do\",\"Sade - The Sweetest Taboo\"]', '[\"4\",\"5\",\"5\",\"5\",\"3\",\"7\",\"6\",\"2\",\"6\",\"10\",\"5\",\"7\",\"4\",\"7\",\"7\",\"5\",\"8\",\"5\",\"6\",\"5\",\"4\",\"5\",\"5\",\"3\",\"10\",\"3\",\"7\",\"8\",\"7\",\"5\",\"2\",\"6\",\"3\",\"5\",\"10\",\"4\",\"6\",\"6\",\"3\",\"9\",\"10\",\"5\",\"4\",\"7\",\"6\",\"6\",\"6\",\"3\",\"7\",\"4\",\"5\",\"5\",\"3\",\"5\",null,\"6\",\"3\",\"2\",\"2\",\"5\",\"5\",\"6\",\"6\",\"5\",\"9\",\"2\",\"7\",\"3\",\"5\",\"8\",\"9\",\"4\",\"5\",\"1\",\"10\"]', NULL, '2021-02-07 18:31:23', '2021-02-07 18:31:23');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `forms`
--

CREATE TABLE `forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `forms`
--

INSERT INTO `forms` (`id`, `user_id`, `title`, `description`, `code`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'TOP ULUBIONYCH PRZEBOJÓW GRUPOWICZÓW - VOL. 2', 'TOP ULUBIONYCH PRZEBOJÓW GRUPOWICZÓW - VOL. 2', '3tfiIMwhGmtWVPHxHUYkv2x6sGgP6HYa', 'closed', NULL, '2021-02-06 15:55:01', '2021-02-07 20:20:05'),
(2, 1, 'Bardzo elegancki form', 'To wlasnie to', 'Qb4d7xAZmsm9FarRl663IxN9dg5tbMqg', 'closed', NULL, '2021-02-06 19:22:01', '2021-02-07 20:20:56'),
(3, 2, 'Próbny formularz', 'Wybierz 5 spośród 15.', 'vp1LcvqhEorGFNfaSGpd6mTQ70jmygZt', 'draft', NULL, '2021-02-07 19:35:50', '2021-02-07 19:35:50'),
(4, 2, 'Próbny formularz', 'Wybierz 5 spośród 15.', 'ZqRZ1ejKaSwbawX8lEbVK4l20PCOgRrq', 'draft', NULL, '2021-02-07 19:35:51', '2021-02-07 19:35:51');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `form_availabilities`
--

CREATE TABLE `form_availabilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `open_form_at` datetime DEFAULT NULL,
  `close_form_at` datetime DEFAULT NULL,
  `response_count_limit` int(10) UNSIGNED DEFAULT NULL,
  `available_weekday` tinyint(3) UNSIGNED DEFAULT NULL,
  `available_start_time` time DEFAULT NULL,
  `available_end_time` time DEFAULT NULL,
  `closed_form_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `form_collaborators`
--

CREATE TABLE `form_collaborators` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filled` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `form_fields`
--

INSERT INTO `form_fields` (`id`, `form_id`, `template`, `attribute`, `question`, `required`, `options`, `filled`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'checkboxes', 'checkboxes.1a8cd01d', 'PROSZĘ O WYBRANIE DOKŁADNIE 75 ULUBIONYCH UTWORÓW Z PODANYCH PONIŻEJ:', 0, '[\"3 DOORS DOWN - KRYPTONITE\",\"AC/DC - HIGHWAY TO HELL\",\"ADAM LAMBERT - GHOST TOWN\",\"ALICE COOPER - HE\'S BACK (THE MAN BEHIND THE MASK)\",\"ALICE COOPER - HEY STOOPID\",\"ALICE COOPER - POISON\",\"ALICE COOPER - TEENAGE FRANKENSTEIN\",\"ALICE IN CHAINS - THEM BONES\",\"ALINA BARAZ & GALIMATIAS - FANTASY (FELIX JAEHN REMIX)\",\"AMY WINEHOUSE - BACK TO BLACK\",\"ARMY OF LOVERS - OBSESSION\",\"ASP - ME\",\"ASSEMBLAGE23 - DISAPPOINT (FUNKER VOGT REMIX)\",\"AURA DIONE FEAT. ROCK MAFIA - FRIENDS\",\"AWOLNATION - SAIL\",\"BABYLON ZOO - SPACEMAN\",\"BACKSTREET BOYS - EVERYBODY (BACKSTREET\'S BACK)\",\"BAD WOLVES - ZOMBIE\",\"BASTILLE - OF THE NIGHT\",\"BAUHAUS - BELA LUGOSI\'S DEAD\",\"BEAR MCCREARY - THEME FROM CHILD\'S PLAY\",\"BEATFREAKZ - SOMEBODY\'S WATCHING ME\",\"BILLIE EILISH - ALL THE GOOD GIRLS GO TO HELL\",\"BILLIE EILISH - BURY A FRIEND\",\"BILLY IDOL - DANCING WITH MYSELF\",\"BLUE SYSTEM - LUCIFER\",\"BLUTENGEL - VAMPIRE ROMANCE\",\"CALVIN HARRIS & ALESSO FEAT. HURTS - UNDER CONTROL\",\"CHRISTINA AGUILERA - GENIE IN A BOTTLE\",\"CLASSIX NOUVEAUX - NEVER NEVER COMES\",\"COMA - ZAPRZEPASZCZONE SIŁY WIELKIEJ ARMII ŚWIĘTYCH ZNAKÓW\",\"DAFT PUNK - ONE MORE TIME\",\"DARKNESS - IN MY DREAMS\",\"DAVID BOWIE - LIFE ON MARS\",\"DAVID BOWIE - SPACE ODDITY\",\"DAVID GUETTA & SHOWTEK FEAT. VASSY - BAD\",\"DAVID GUETTA FEAT. NICKI MINAJ - TURN ME ON\",\"DAVID GUETTA FEAT. SIA - TITANIUM\",\"DEN HARROW - FUTURE BRAIN\",\"DIE ANTWOORD - I FINK U FREEKY\",\"DIHAJ - SKELETONS\",\"DISCLOSURE FEAT. SAM SMITH - OMEN\",\"DJ BOBO - SHADOWS OF THE NIGHT\",\"DJ DADO - X-FILES\",\"DODA - BAD GIRLS\",\"DOKKEN - DREAM WARRIOS\",\"DONATAN I MARYLA RODOWICZ - PEŁNIA\",\"DURAN DURAN - WILD BOYS\",\"DUSTY SPRINGFIELD - SPOOKY\",\"E NOMINE - VATER UNSER\",\"ECHO AND THE BUNNYMAN - PEOPLE ARE STRANGE (OST LOST BOYS)\",\"EIFFEL 65 - BLUE (DA BA DEE)\",\"EIFFEL 65 - MOVE YOUR BODY\",\"EMINEM FEAT. RIHANNA - THE MONSTER\",\"ENIGMA - MEA CULPA\",\"ENIGMA - SADNESS PART 1\",\"ERA - AMENO\",\"EVANESCENCE - HAUNTED\",\"EVANESCENCE - TOURNIQUET\",\"EVANESCENCE FEAT. PAUL MCCOY - BRING ME TO LIFE\",\"FAITH NO MORE - EPIC\",\"FALCO - JEANNY\",\"FALCO - OUT OF THE DARK\",\"FANCY - PRINCE OF DARKNESS\",\"FOCUS - HOCUS POCUS\",\"FORMACJA NIEŻYWYCH SCHABUFF - KLUB WESOŁEGO SZAMPANA\",\"FRANZ FERDINAND - EVIL EYE\",\"GHOSTEMANE - HADES\",\"GHOSTEMANE - NAILS\",\"GODSMACK - VOODOO\",\"GOTHMINISTER - MARCH OF THE DEAD\",\"GOTHMINISTER - WISH\",\"GROOVE COVERAGE - POISON\",\"GUNS\'N\'ROSES - YOU COULD BE MINE\",\"HIGHLAND - BELLA STELLA\",\"HIM - JOIN ME\",\"HINDER - LIPS OF AN ANGEL\",\"ICE MC - IT\'S A RAINY DAY\",\"IMAGINE DRAGONS - DEMONS\",\"INXS - DEVIL INSIDE\",\"IRON MAIDEN - FEAR OF THE DARK\",\"IRON MAIDEN - THE NUMBER OF THE BEAST\",\"IS THIS MOMENT - BIG BAD WOLF\",\"JEFFERSON AIRPLANE - WHITE RABBIT\",\"JOHN CARPENTER - HALLOWEEN THEME\",\"JULEE CRUISE - FALLING\",\"KATY PERRY FEAT. KANYE WEST - E.T.\",\"KORN FEAT. SKRILLEX - CHAOS LIVES IN EVERYTHING\",\"LADY GAGA - BAD ROMANCE\",\"LADY GAGA - JUDAS\",\"LADY GAGA - MONSTER\",\"LAO CHE - ZOMBI!\",\"LAO CHE - ŻYCIE JEST JAK TRAMWAJ\",\"LAURI - HEAVY\",\"LENINGRAD COWBOYS - YOU\'RE MY HEART, YOU\'RE MY SOUL\",\"LENNY KRAVITZ - IS THERE ANY LOVE IN YOUR HEART\",\"LIMP BIZKIT - EAT YOU ALIVE\",\"LINKIN PARK - LOST IN THE ECHO\",\"LMFAO FEAT. NATALIA KILLS - CHAMPAGNE SHOWERS\",\"LONDON BOYS - REQUIEM\",\"LOUIS ARMSTRONG - JEEPERS CREEPERS\",\"LUM!X, GABRY PONTE - MONSTER\",\"MAANAM - SZAŁ NIEBIESKICH CIAŁ\",\"MAGIC AFFAIR - OMEN 3\",\"MARILYN MANSON - IF I WAS YOUR VAMPIRE\",\"MARILYN MANSON - THE KKK TOOK MY BABY AWAY\",\"MARILYN MANSON - THE NOBODIES\",\"MARILYN MANSON - THIS IS HALLOWEEN\",\"MARK SNOW - MATERIA PRIMORIS (THE X-FILES THEME)\",\"MARYLIN MANSON - BETTER OF TWO EVILS\",\"MARYLIN MANSON - SWEET DREAMS\",\"MARYLIN MANSON - THE BEAUTIFUL PEOPLE\",\"MARYLIN MANSON - THE DOPE SHOW\",\"MC HAMMER - ADDAMS GROOVE\",\"MEG & DIA - MONSTER (LUM!X BOOTLEG)\",\"MEGADETH - HANGAR 18\",\"MEGADETH - SYMPHONY OF DESTRUCTION\",\"METALLICA - ENTER SANDMAN\",\"METALLICA - ONE\",\"METALLICA - THE UNFORGIVEN\",\"METALLICA - THE UNFORGIVEN II\",\"METALLICA - UNTIL IT SLEEP\",\"MICHAEL JACKSON - GHOSTS\",\"MICHAEL JACKSON - LEAVE ME ALONE\",\"MICHAEL JACKSON - THRILLER\",\"MIKE CANDYS FEAT. EVELYN & PATRICK MILLER - 2012 (IF THE WORLD WILL END TOMMOROW)\",\"MIKE OLDFIELD - TUBULAR BELLS\",\"MIKO MISSION - TWO FOR LOVE\",\"MONTE KRISTO - THE GIRL OF LUCIFER\",\"MOVING HEROES - YOU ARE MY ANGEL AND MY DEVIL\",\"MUSIC INSTRUCTOR - GET FREAKY\",\"MUSIC INSTRUCTOR - HYMN\",\"MY CHEMICAL ROMANCE - HELENA\",\"MY CHEMICAL ROMANCE - VAMPIRES WILL NEVER HURT YOU\",\"MY CHEMICAL ROMANCE - WELCOME TO THE BLACK PARADE\",\"NANA - DARKMAN\",\"NANA - HE\'S COMIN\'\",\"NE-YO - BEAUTIFUL MONSTER\",\"NIGHTWISH - GHOST LOVE SCORE\",\"NINE INCH NAILS - CLOSER\",\"NIRVANA - COME AS YOU ARE\",\"NO DOUBT - SPIDERWEBS\",\"OBYWATEL G.C. - ANI TY, ANI JA\",\"ORCHESTRAL MANOEUVRES IN THE DARK - PANDORA\'S BOX\",\"OZZY OSBOURNE - HELLRAISER\",\"OZZY OSBOURNE - UNDER THE GRAVEYARD\",\"PARAMORE - DECODE\",\"PARAMORE - MONSTER\",\"PET SHOP BOYS - HEART\",\"PET SHOP BOYS - IT\'S A SIN\",\"PHARAO - WORLD OF MAGIC\",\"PINK FLOYD - COMFORTABLY NUMB\",\"PITBULL - BACK IN TIME\",\"PORCUPINE TREE - LAZARUS\",\"RADIOHEAD - CREEP\",\"RADIORAMA - ALIENS\",\"RADIORAMA - VAMPIRES\",\"RADIORAMA - YETI\",\"RALPH KAMINSKI - KOSMICZNE ENERGIE\",\"RAMMSTEIN - DU RIECHST SO GUT 98\",\"RAY PARKER JR. - GHOSTBUSTERS\",\"REPUBLIKA - REINKARNACJE\",\"REPUBLIKA - ŚMIERĆ NA PIĘĆ\",\"REPUBLIKA - ŚMIERĆ W BIKINI\",\"RIHANNA - DISTURBIA\",\"ROB ZOMBIE - DRAGULA\",\"ROB ZOMBIE - SUPERBEAST\",\"ROBBIE WILLIAMS - ANGELS\",\"ROCKWELL - SOMEBODY\'S WATCHING ME\",\"SAMANTHA FOX - I SURRENDER (TO THE SPIRIT OF THE NIGHT)\",\"SANDRA - SHADOWS\",\"SARAH BRIGHTMAN - THE PHANTOM OF THE OPERA\",\"SHAKESPEARS SISTERS - STAY\",\"SHAKIRA - SHE WOLF\",\"SLIPKNOT - THE DEVIL IN I\",\"SŁOŃ - ANIA\",\"SMASHING PUMPKINS - AVA ADORE\",\"SPAGNA - I WANNA BE YOUR WIFE\",\"STARE DOBRE MAŁŻEŃSTWO - BIESZCZADZKIE ANIOŁY\",\"STEVE MILLER BAND - ABRACADABRA\",\"SUICIDE COMMANDO - HELLRAISER (AGONOIZE REMIX)\",\"T. LOVE - LUCY PHERE\",\"TADEUSZ WOŹNIAK & ALIBABKI - ZEGARMISTRZ ŚWIATŁA\",\"TALKING HEADS - PSYCHO KILLER\",\"TAYLOR SWIFT - LOOK WHAT YOU MADE ME DO\",\"THE ALAN PARSONS PROJECT - TIME\",\"THE AUTOMATIC - MONSTER (FIFA 08 OST)\",\"THE CRAMPS - SURFIN\' DEAD\",\"THE CRANBERRIES - SALVATION\",\"THE CRANBERRIES - THIS IS THE DAY\",\"THE CRANBERRIES - ZOMBIE\",\"THE CURE - LULLABY\",\"THE DISCO BOYS - HEY ST. PETER\",\"THE HOOTERS - ALL YOU ZOMBIES\",\"THE KELLY FAMILY - AN ANGEL\",\"THE KELLY FAMILY - FEEL IN LOVE WITH AN ALIEN\",\"THE OFFSPRING - HIT THAT\",\"THE PRODIGY - BREATHE\",\"THE PRODIGY - FIRESTARTER\",\"THE PRODIGY - INVANDERS MUST DIE\",\"THE PRODIGY - OMEN\",\"THE PRODIGY - VOODOO PEOPLE\",\"THE RAMONES - PET CEMATARY\",\"THE ROLLING STONES - SYMPATHY FOR THE DEVIL\",\"THE WANTED - CHASING THE SUN\",\"THE WEEKND - BLINDING LIGHTS\",\"THE WEEKND & DAFT PUNK - I FEEL IT COMING\",\"THREE DAYS GRACE - ANIMAL I HAVE BECOME\",\"TITO & TARANTULA - AFTER DARK\",\"TOUCH & GO - WOULD YOU GO TO BED WITH ME\",\"TRANS X - LIVING ON VIDEO\",\"TSA - ALIEN\",\"TYMEK FEAT. BIG SCYTHE - ANIOŁY I DEMONY\",\"VALERIE DORE - KING ARTHUR\",\"VIDEOKIDS - WOODPECKERS FROM SPACE\",\"WAMDUE PROJECT - KING OF MY CASTLE\",\"WILKI - ELI LAMA SABACHTANI\",\"WILL SMITH - MEN IN BLACK\",\"WISHBONE ASH - PERSEPHONE\",\"WITHIN TEMPTATION - A DEMON\'S FATE\",\"XMAL DEUTSCHLAND - INCUBUS SUCCUBUS\",\"XMAL DEUTSCHLAND - INCUBUS SUCCUBUS II\",\"YAZOO - DON\'T GO\",\"ZZ TOP - BREAKAWAY\",\"ZZ TOP - ROUGH BOY\"]', 1, NULL, '2021-02-06 15:57:21', '2021-02-06 15:58:25'),
(2, 1, 'drop-down', 'drop_down.2afd0a8e', 'Co jests', 1, '[\"asdf\",\"czxcv\"]', 1, '2021-02-06 19:19:57', '2021-02-06 19:02:15', '2021-02-06 19:19:57'),
(3, 2, 'checkboxes', 'checkboxes.3d105c8d', 'I o co chodzi?', 1, '[\"3 DOORS DOWN - KRYPTONITE\",\"AC/DC - HIGHWAY TO HELL\",\"ADAM LAMBERT - GHOST TOWN\",\"ALICE COOPER - HE\'S BACK (THE MAN BEHIND THE MASK)\",\"ALICE COOPER - HEY STOOPID\",\"ALICE COOPER - POISON\",\"ALICE COOPER - TEENAGE FRANKENSTEIN\",\"ALICE IN CHAINS - THEM BONES\",\"ALINA BARAZ & GALIMATIAS - FANTASY (FELIX JAEHN REMIX)\",\"AMY WINEHOUSE - BACK TO BLACK\",\"ARMY OF LOVERS - OBSESSION\",\"ASP - ME\",\"ASSEMBLAGE23 - DISAPPOINT (FUNKER VOGT REMIX)\",\"AURA DIONE FEAT. ROCK MAFIA - FRIENDS\",\"AWOLNATION - SAIL\",\"BABYLON ZOO - SPACEMAN\",\"BACKSTREET BOYS - EVERYBODY (BACKSTREET\'S BACK)\",\"BAD WOLVES - ZOMBIE\",\"BASTILLE - OF THE NIGHT\",\"BAUHAUS - BELA LUGOSI\'S DEAD\",\"BEAR MCCREARY - THEME FROM CHILD\'S PLAY\",\"BEATFREAKZ - SOMEBODY\'S WATCHING ME\",\"BILLIE EILISH - ALL THE GOOD GIRLS GO TO HELL\",\"BILLIE EILISH - BURY A FRIEND\",\"BILLY IDOL - DANCING WITH MYSELF\",\"BLUE SYSTEM - LUCIFER\",\"BLUTENGEL - VAMPIRE ROMANCE\",\"CALVIN HARRIS & ALESSO FEAT. HURTS - UNDER CONTROL\",\"CHRISTINA AGUILERA - GENIE IN A BOTTLE\",\"CLASSIX NOUVEAUX - NEVER NEVER COMES\",\"COMA - ZAPRZEPASZCZONE SIŁY WIELKIEJ ARMII ŚWIĘTYCH ZNAKÓW\",\"DAFT PUNK - ONE MORE TIME\",\"DARKNESS - IN MY DREAMS\",\"DAVID BOWIE - LIFE ON MARS\",\"DAVID BOWIE - SPACE ODDITY\",\"DAVID GUETTA & SHOWTEK FEAT. VASSY - BAD\",\"DAVID GUETTA FEAT. NICKI MINAJ - TURN ME ON\",\"DAVID GUETTA FEAT. SIA - TITANIUM\",\"DEN HARROW - FUTURE BRAIN\",\"DIE ANTWOORD - I FINK U FREEKY\",\"DIHAJ - SKELETONS\",\"DISCLOSURE FEAT. SAM SMITH - OMEN\",\"DJ BOBO - SHADOWS OF THE NIGHT\",\"DJ DADO - X-FILES\",\"DODA - BAD GIRLS\",\"DOKKEN - DREAM WARRIOS\",\"DONATAN I MARYLA RODOWICZ - PEŁNIA\",\"DURAN DURAN - WILD BOYS\",\"DUSTY SPRINGFIELD - SPOOKY\",\"E NOMINE - VATER UNSER\",\"ECHO AND THE BUNNYMAN - PEOPLE ARE STRANGE (OST LOST BOYS)\",\"EIFFEL 65 - BLUE (DA BA DEE)\",\"EIFFEL 65 - MOVE YOUR BODY\",\"EMINEM FEAT. RIHANNA - THE MONSTER\",\"ENIGMA - MEA CULPA\",\"ENIGMA - SADNESS PART 1\",\"ERA - AMENO\",\"EVANESCENCE - HAUNTED\",\"EVANESCENCE - TOURNIQUET\",\"EVANESCENCE FEAT. PAUL MCCOY - BRING ME TO LIFE\",\"FAITH NO MORE - EPIC\",\"FALCO - JEANNY\",\"FALCO - OUT OF THE DARK\",\"FANCY - PRINCE OF DARKNESS\",\"FOCUS - HOCUS POCUS\",\"FORMACJA NIEŻYWYCH SCHABUFF - KLUB WESOŁEGO SZAMPANA\",\"FRANZ FERDINAND - EVIL EYE\",\"GHOSTEMANE - HADES\",\"GHOSTEMANE - NAILS\",\"GODSMACK - VOODOO\",\"GOTHMINISTER - MARCH OF THE DEAD\",\"GOTHMINISTER - WISH\",\"GROOVE COVERAGE - POISON\",\"GUNS\'N\'ROSES - YOU COULD BE MINE\",\"HIGHLAND - BELLA STELLA\",\"HIM - JOIN ME\",\"HINDER - LIPS OF AN ANGEL\",\"ICE MC - IT\'S A RAINY DAY\",\"IMAGINE DRAGONS - DEMONS\",\"INXS - DEVIL INSIDE\",\"IRON MAIDEN - FEAR OF THE DARK\",\"IRON MAIDEN - THE NUMBER OF THE BEAST\",\"IS THIS MOMENT - BIG BAD WOLF\",\"JEFFERSON AIRPLANE - WHITE RABBIT\",\"JOHN CARPENTER - HALLOWEEN THEME\",\"JULEE CRUISE - FALLING\",\"KATY PERRY FEAT. KANYE WEST - E.T.\",\"KORN FEAT. SKRILLEX - CHAOS LIVES IN EVERYTHING\",\"LADY GAGA - BAD ROMANCE\",\"LADY GAGA - JUDAS\",\"LADY GAGA - MONSTER\",\"LAO CHE - ZOMBI!\",\"LAO CHE - ŻYCIE JEST JAK TRAMWAJ\",\"LAURI - HEAVY\",\"LENINGRAD COWBOYS - YOU\'RE MY HEART, YOU\'RE MY SOUL\",\"LENNY KRAVITZ - IS THERE ANY LOVE IN YOUR HEART\",\"LIMP BIZKIT - EAT YOU ALIVE\",\"LINKIN PARK - LOST IN THE ECHO\",\"LMFAO FEAT. NATALIA KILLS - CHAMPAGNE SHOWERS\",\"LONDON BOYS - REQUIEM\",\"LOUIS ARMSTRONG - JEEPERS CREEPERS\",\"LUM!X, GABRY PONTE - MONSTER\",\"MAANAM - SZAŁ NIEBIESKICH CIAŁ\",\"MAGIC AFFAIR - OMEN 3\",\"MARILYN MANSON - IF I WAS YOUR VAMPIRE\",\"MARILYN MANSON - THE KKK TOOK MY BABY AWAY\",\"MARILYN MANSON - THE NOBODIES\",\"MARILYN MANSON - THIS IS HALLOWEEN\",\"MARK SNOW - MATERIA PRIMORIS (THE X-FILES THEME)\",\"MARYLIN MANSON - BETTER OF TWO EVILS\",\"MARYLIN MANSON - SWEET DREAMS\",\"MARYLIN MANSON - THE BEAUTIFUL PEOPLE\",\"MARYLIN MANSON - THE DOPE SHOW\",\"MC HAMMER - ADDAMS GROOVE\",\"MEG & DIA - MONSTER (LUM!X BOOTLEG)\",\"MEGADETH - HANGAR 18\",\"MEGADETH - SYMPHONY OF DESTRUCTION\",\"METALLICA - ENTER SANDMAN\",\"METALLICA - ONE\",\"METALLICA - THE UNFORGIVEN\",\"METALLICA - THE UNFORGIVEN II\",\"METALLICA - UNTIL IT SLEEP\",\"MICHAEL JACKSON - GHOSTS\",\"MICHAEL JACKSON - LEAVE ME ALONE\",\"MICHAEL JACKSON - THRILLER\",\"MIKE CANDYS FEAT. EVELYN & PATRICK MILLER - 2012 (IF THE WORLD WILL END TOMMOROW)\",\"MIKE OLDFIELD - TUBULAR BELLS\",\"MIKO MISSION - TWO FOR LOVE\",\"MONTE KRISTO - THE GIRL OF LUCIFER\",\"MOVING HEROES - YOU ARE MY ANGEL AND MY DEVIL\",\"MUSIC INSTRUCTOR - GET FREAKY\",\"MUSIC INSTRUCTOR - HYMN\",\"MY CHEMICAL ROMANCE - HELENA\",\"MY CHEMICAL ROMANCE - VAMPIRES WILL NEVER HURT YOU\",\"MY CHEMICAL ROMANCE - WELCOME TO THE BLACK PARADE\",\"NANA - DARKMAN\",\"NANA - HE\'S COMIN\'\",\"NE-YO - BEAUTIFUL MONSTER\",\"NIGHTWISH - GHOST LOVE SCORE\",\"NINE INCH NAILS - CLOSER\",\"NIRVANA - COME AS YOU ARE\",\"NO DOUBT - SPIDERWEBS\",\"OBYWATEL G.C. - ANI TY, ANI JA\",\"ORCHESTRAL MANOEUVRES IN THE DARK - PANDORA\'S BOX\",\"OZZY OSBOURNE - HELLRAISER\",\"OZZY OSBOURNE - UNDER THE GRAVEYARD\",\"PARAMORE - DECODE\",\"PARAMORE - MONSTER\",\"PET SHOP BOYS - HEART\",\"PET SHOP BOYS - IT\'S A SIN\",\"PHARAO - WORLD OF MAGIC\",\"PINK FLOYD - COMFORTABLY NUMB\",\"PITBULL - BACK IN TIME\",\"PORCUPINE TREE - LAZARUS\",\"RADIOHEAD - CREEP\",\"RADIORAMA - ALIENS\",\"RADIORAMA - VAMPIRES\",\"RADIORAMA - YETI\",\"RALPH KAMINSKI - KOSMICZNE ENERGIE\",\"RAMMSTEIN - DU RIECHST SO GUT 98\",\"RAY PARKER JR. - GHOSTBUSTERS\",\"REPUBLIKA - REINKARNACJE\",\"REPUBLIKA - ŚMIERĆ NA PIĘĆ\",\"REPUBLIKA - ŚMIERĆ W BIKINI\",\"RIHANNA - DISTURBIA\",\"ROB ZOMBIE - DRAGULA\",\"ROB ZOMBIE - SUPERBEAST\",\"ROBBIE WILLIAMS - ANGELS\",\"ROCKWELL - SOMEBODY\'S WATCHING ME\",\"SAMANTHA FOX - I SURRENDER (TO THE SPIRIT OF THE NIGHT)\",\"SANDRA - SHADOWS\",\"SARAH BRIGHTMAN - THE PHANTOM OF THE OPERA\",\"SHAKESPEARS SISTERS - STAY\",\"SHAKIRA - SHE WOLF\",\"SLIPKNOT - THE DEVIL IN I\",\"SŁOŃ - ANIA\",\"SMASHING PUMPKINS - AVA ADORE\",\"SPAGNA - I WANNA BE YOUR WIFE\",\"STARE DOBRE MAŁŻEŃSTWO - BIESZCZADZKIE ANIOŁY\",\"STEVE MILLER BAND - ABRACADABRA\",\"SUICIDE COMMANDO - HELLRAISER (AGONOIZE REMIX)\",\"T. LOVE - LUCY PHERE\",\"TADEUSZ WOŹNIAK & ALIBABKI - ZEGARMISTRZ ŚWIATŁA\",\"TALKING HEADS - PSYCHO KILLER\",\"TAYLOR SWIFT - LOOK WHAT YOU MADE ME DO\",\"THE ALAN PARSONS PROJECT - TIME\",\"THE AUTOMATIC - MONSTER (FIFA 08 OST)\",\"THE CRAMPS - SURFIN\' DEAD\",\"THE CRANBERRIES - SALVATION\",\"THE CRANBERRIES - THIS IS THE DAY\",\"THE CRANBERRIES - ZOMBIE\",\"THE CURE - LULLABY\",\"THE DISCO BOYS - HEY ST. PETER\",\"THE HOOTERS - ALL YOU ZOMBIES\",\"THE KELLY FAMILY - AN ANGEL\",\"THE KELLY FAMILY - FEEL IN LOVE WITH AN ALIEN\",\"THE OFFSPRING - HIT THAT\",\"THE PRODIGY - BREATHE\",\"THE PRODIGY - FIRESTARTER\",\"THE PRODIGY - INVANDERS MUST DIE\",\"THE PRODIGY - OMEN\",\"THE PRODIGY - VOODOO PEOPLE\",\"THE RAMONES - PET CEMATARY\",\"THE ROLLING STONES - SYMPATHY FOR THE DEVIL\",\"THE WANTED - CHASING THE SUN\",\"THE WEEKND - BLINDING LIGHTS\",\"THE WEEKND & DAFT PUNK - I FEEL IT COMING\",\"THREE DAYS GRACE - ANIMAL I HAVE BECOME\",\"TITO & TARANTULA - AFTER DARK\",\"TOUCH & GO - WOULD YOU GO TO BED WITH ME\",\"TRANS X - LIVING ON VIDEO\",\"TSA - ALIEN\",\"TYMEK FEAT. BIG SCYTHE - ANIOŁY I DEMONY\",\"VALERIE DORE - KING ARTHUR\",\"VIDEOKIDS - WOODPECKERS FROM SPACE\",\"WAMDUE PROJECT - KING OF MY CASTLE\",\"WILKI - ELI LAMA SABACHTANI\",\"WILL SMITH - MEN IN BLACK\",\"WISHBONE ASH - PERSEPHONE\",\"WITHIN TEMPTATION - A DEMON\'S FATE\",\"XMAL DEUTSCHLAND - INCUBUS SUCCUBUS\",\"XMAL DEUTSCHLAND - INCUBUS SUCCUBUS II\",\"YAZOO - DON\'T GO\",\"ZZ TOP - BREAKAWAY\",\"ZZ TOP - ROUGH BOY\"]', 1, NULL, '2021-02-06 19:22:04', '2021-02-07 20:00:57'),
(4, 4, 'short-answer', 'short_answer.b5664e05', NULL, NULL, NULL, 0, NULL, '2021-02-07 19:36:03', '2021-02-07 19:36:03'),
(5, 4, 'checkboxes', 'checkboxes.6e87fcd1', NULL, NULL, NULL, 0, NULL, '2021-02-07 19:36:55', '2021-02-07 19:36:55');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `form_responses`
--

CREATE TABLE `form_responses` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `response_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respondent_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respondent_user_agent` varchar(511) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `form_responses`
--

INSERT INTO `form_responses` (`id`, `form_id`, `response_code`, `respondent_ip`, `respondent_user_agent`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'ZNEUDAaWI25VF6ioL0OMvJfNHaKARnL9W50fM21NvEf1MAlratcj280ry3naHAsh', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', NULL, '2021-02-06 22:53:23', '2021-02-06 22:53:23'),
(2, 2, 'R3B9fCVAMgvxbcfvW1RjLf21RAe0TpWE5FMwTJ9Vxd8lg8r7JTemANhUfmNzU8FD', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', NULL, '2021-02-06 23:12:09', '2021-02-06 23:12:09'),
(3, 2, 'Bc6BhA0pYYa52ytEihPPgyi7m03iMy87AVyHtqSKbHicIDuUJiwTwKFYJXZYGKkO', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', NULL, '2021-02-06 23:23:07', '2021-02-06 23:23:07'),
(4, 2, 'RhC9cfYHQIQhVOGMU5qNWFwoMBqoIoyZ3LPVoHh1eIRcJdqvvMyYsnFwQRdGXzZ3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', NULL, '2021-02-06 23:23:56', '2021-02-06 23:23:56'),
(5, 2, 'r5Be23clT89nLcakTO3hyTzqFTS7kJYPctnsROoYD7iPMjL9swHgBHOivA1fd6iB', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', NULL, '2021-02-06 23:24:39', '2021-02-06 23:24:39'),
(6, 2, 'YzpnioWRQh7pjMEMoVIBogQW5CBJup1k5mDjP93WOWz1SG03np39qW2YNZ9IcMV8', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', NULL, '2021-02-07 17:38:45', '2021-02-07 17:38:45'),
(7, 1, 'FGJIBup4HSU9P56GGvZFkd02JpUA3tZ9pIK5X6g1Q7mcLT7oRGOphxG5wlLUGfvs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', NULL, '2021-02-07 18:31:23', '2021-02-07 18:31:23');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `form_resvals`
--

CREATE TABLE `form_resvals` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `form_field_id` int(10) UNSIGNED NOT NULL,
  `sel_type` smallint(6) NOT NULL,
  `field_limit` int(10) UNSIGNED NOT NULL,
  `custom_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `form_resvals`
--

INSERT INTO `form_resvals` (`id`, `form_id`, `form_field_id`, `sel_type`, `field_limit`, `custom_text`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 75, 'Musisz wybrać co najmniej', NULL, '2021-02-06 19:20:50', '2021-02-07 18:21:06'),
(3, 2, 3, 0, 2, 'uważać!', NULL, '2021-02-06 19:23:02', '2021-02-06 19:23:02');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"displayName\":\"App\\\\Mail\\\\EmailVerificationMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:30:\\\"App\\\\Mail\\\\EmailVerificationMail\\\":23:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"tuttej123@interia.pl\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1612728743, 1612728743);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_12_10_200406_create_forms_table', 1),
(4, '2018_12_10_200556_create_form_fields_table', 1),
(5, '2018_12_10_200700_create_form_responses_table', 1),
(6, '2018_12_11_130118_create_jobs_table', 1),
(7, '2018_12_11_130249_create_failed_jobs_table', 1),
(8, '2018_12_19_164049_modify_form_responses_table', 1),
(9, '2018_12_19_171726_create_field_responses_table', 1),
(10, '2018_12_31_104932_modify_users_table', 1),
(11, '2018_12_31_105713_create_form_collaborators_table', 1),
(12, '2019_03_24_201130_create_form_availabilities_table', 1),
(13, '2021_02_03_202005_create_form_resvals_table', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `email_token`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Wojciech', 'Pastuszko', 'wojciech.pastuszko@interia.pl', '$2y$10$E5tMyJ/J8d3mnkq7bcSfducMZRJvGyoXQSegk30V2.VpSK6z1uYZS', NULL, 'Shrxms7nywlelNSom4HHOCBE2iBq3kUXKpHV6RYRBXkAyIE8sPhWZs8t9mO0', NULL, '2021-02-05 19:37:03', '2021-02-05 19:37:03'),
(2, 'Maciek', 'Tutaj', 'tuttej123@interia.pl', '$2y$10$30V8PL93cfkA8DPPBRzuSerjW8/yW7FzMi.LN7vUONjhwoOWAjNCy', NULL, 'DUBgoyayUUrzwprdnpFjevUMnT34RePCzuv7kieai69PXYNrlGhntcpRYZnL', NULL, '2021-02-07 19:12:22', '2021-02-07 19:12:22');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `field_responses`
--
ALTER TABLE `field_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_responses_form_field_id_foreign` (`form_field_id`),
  ADD KEY `field_responses_form_response_id_foreign` (`form_response_id`);

--
-- Indeksy dla tabeli `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forms_code_unique` (`code`),
  ADD KEY `forms_user_id_foreign` (`user_id`);

--
-- Indeksy dla tabeli `form_availabilities`
--
ALTER TABLE `form_availabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_availabilities_form_id_foreign` (`form_id`);

--
-- Indeksy dla tabeli `form_collaborators`
--
ALTER TABLE `form_collaborators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_collaborators_form_id_foreign` (`form_id`),
  ADD KEY `form_collaborators_user_id_foreign` (`user_id`);

--
-- Indeksy dla tabeli `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_fields_form_id_foreign` (`form_id`);

--
-- Indeksy dla tabeli `form_responses`
--
ALTER TABLE `form_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_responses_form_id_foreign` (`form_id`);

--
-- Indeksy dla tabeli `form_resvals`
--
ALTER TABLE `form_resvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_resvals_form_id_foreign` (`form_id`),
  ADD KEY `form_resvals_form_field_id_foreign` (`form_field_id`);

--
-- Indeksy dla tabeli `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `field_responses`
--
ALTER TABLE `field_responses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `form_availabilities`
--
ALTER TABLE `form_availabilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `form_collaborators`
--
ALTER TABLE `form_collaborators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `form_responses`
--
ALTER TABLE `form_responses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `form_resvals`
--
ALTER TABLE `form_resvals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `field_responses`
--
ALTER TABLE `field_responses`
  ADD CONSTRAINT `field_responses_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `field_responses_form_response_id_foreign` FOREIGN KEY (`form_response_id`) REFERENCES `form_responses` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `forms`
--
ALTER TABLE `forms`
  ADD CONSTRAINT `forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `form_availabilities`
--
ALTER TABLE `form_availabilities`
  ADD CONSTRAINT `form_availabilities_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `form_collaborators`
--
ALTER TABLE `form_collaborators`
  ADD CONSTRAINT `form_collaborators_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `form_collaborators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `form_fields`
--
ALTER TABLE `form_fields`
  ADD CONSTRAINT `form_fields_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `form_responses`
--
ALTER TABLE `form_responses`
  ADD CONSTRAINT `form_responses_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `form_resvals`
--
ALTER TABLE `form_resvals`
  ADD CONSTRAINT `form_resvals_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `form_resvals_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
