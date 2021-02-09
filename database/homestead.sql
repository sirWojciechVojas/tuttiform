-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Sty 2021, 16:07
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `field_responses`
--

INSERT INTO `field_responses` (`id`, `form_field_id`, `form_response_id`, `answer`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'gfdh@WW.PL', NULL, '2021-01-22 22:45:10', '2021-01-22 22:45:10'),
(2, 2, 1, '[\"10 000 Maniacs - Because The Night\",\"2 plus 1 - Easy Come, Easy Go\",\"2 Unlimited - Faces\",\"4 Strings - Take Me Away\",\"ABBA - Chiquitita\",\"ABBA - Fernando\",\"ABBA - Knowing Me, Knowing You\",\"ABBA - Mamma Mia\"]', NULL, '2021-01-22 22:45:10', '2021-01-22 22:45:10'),
(3, 1, 2, 'KK@OPP.PL', NULL, '2021-01-22 22:48:14', '2021-01-22 22:48:14'),
(4, 2, 2, '[\"Alphaville - Forever Young\",\"Amy Winehouse - You Know I\'m No Good\",\"Andrzej Zaucha - By\\u0142a\\u015b Serca Biciem\",\"Aphex Twin - IZ-US\",\"Archive - Again\"]', NULL, '2021-01-22 22:48:14', '2021-01-22 22:48:14'),
(5, 1, 3, 'lolek@oi.ol', NULL, '2021-01-23 05:03:12', '2021-01-23 05:03:12'),
(6, 2, 3, '[\"2 Unlimited - Faces\",\"ABBA - Fernando\",\"ABBA - Knowing Me, Knowing You\",\"ABBA - Ring, Ring\",\"ABBA - Take A Chance On Me\"]', NULL, '2021-01-23 05:03:12', '2021-01-23 05:03:12');

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
(1, 1, 'TOP ULUBIONYCH PRZEBOJÓW GRUPOWICZÓW - VOL. 2', 'TOP ULUBIONYCH PRZEBOJÓW GRUPOWICZÓW - VOL. 2', 'EMkXD8l1Aks2VxxWl8tthwo86ESuyl0k', 'open', NULL, '2021-01-01 19:40:38', '2021-01-22 22:44:42'),
(3, 1, 'TOP ULUBIONYCH PRZEBOJÓW GRUPOWICZÓW', 'TOP ULUBIONYCH PRZEBOJÓW GRUPOWICZÓW - VOL. 3', '9dwnC8XNvcTsVvxePNwtwKlDF7qaal3V', 'pending', NULL, '2021-01-02 21:18:01', '2021-01-23 15:08:51'),
(4, 1, 'SUPEROWSKI', 'Bardzo dobry formularz', 'OeRbsMCVWswayE1syPDPX6tlMupR0UGf', 'draft', '2021-01-23 14:32:30', '2021-01-23 10:38:07', '2021-01-23 14:32:30'),
(5, 1, 'Superowski Form', 'Dlaczego tak jest', 'CL49wnltpI8bMbWJmWYzCsnAYPGBXUMD', 'pending', NULL, '2021-01-23 14:33:01', '2021-01-23 15:09:32');

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
(1, 1, 'short-answer', 'short_answer.b4519d51', 'Email address', 1, NULL, 1, NULL, '2021-01-02 11:06:36', '2021-01-02 12:20:54'),
(2, 1, 'checkboxes', 'checkboxes.0418940c', 'PROSZĘ O WYBRANIE DOKŁADNIE 75 ULUBIONYCH UTWORÓW Z PODANYCH PONIŻEJ:', 0, '[\"10 000 Maniacs - Because The Night\",\"2 Brothers On The 4th Floor - Mirror Of Love\",\"2 plus 1 - Easy Come, Easy Go\",\"2 Unlimited - Faces\",\"4 Strings - Take Me Away\",\"ABBA - Chiquitita\",\"ABBA - Fernando\",\"ABBA - Knowing Me, Knowing You\",\"ABBA - Mamma Mia\",\"ABBA - Ring, Ring\",\"ABBA - Take A Chance On Me\",\"ABBA - The Winner Takes It All\",\"ABBA - Waterloo\",\"Ace - How Long\",\"Aerosmith - Dream On\",\"Aerosmith - Livin\' On The Edge\",\"A-Ha - Forever Not Yours\",\"A-Ha - Hunting High And Low\",\"A-Ha - Stay On This Roads\",\"A-Ha - Take On Me\",\"A-Ha - The Living Daylight\",\"A-Ha - The Sun Always Shines On TV\",\"A-Ha - Touchy!\",\"Air Supply - Making Love Out Of Nothing At All\",\"Akurat - Fantasmagorie\",\"Al Bano & Romina Power - Makassar\",\"Alex C. feat. Yasmin K - Angel Of Darkness\",\"Alice Cooper - Poison\",\"Alice Deejay - Back In My Life\",\"Alice Deejay - Will I Ever\",\"Alice In Chains - Nutshell\",\"Alice In Chains - Rotten Apple\",\"Alice In Chains - Would?\",\"Alphaville - Dance With Me\",\"Alphaville - Forever Young\",\"Amy Winehouse - You Know I\'m No Good\",\"Andrzej Zaucha - Byłaś Serca Biciem\",\"Aphex Twin - IZ-US\",\"Arch Enemy - War Eternal\",\"Archive - Again\",\"Ariana Grande - God Is A Woman\",\"As I Lay Dying - My Own Grave\",\"ATB - Black Nights\",\"ATB - The Summer\",\"ATB feat. York - The Fields Of Love\",\"ATC - Around The World (La La La La La)\",\"Audioslave - Cochise\",\"Audioslave - Like A Stone\",\"Avalanche - Johnny Johnny Come Home\",\"Avril Lavigne - I\'m With You\",\"Avril Lavigne - Nobody\'s Home\",\"Aztec Camera - Somewhere In My Heart\",\"Bad Boys Blue - I Totally Miss You\",\"Bad Boys Blue - Kiss You All Over, Baby\",\"Bad Boys Blue - Lady In Black\",\"Bad Boys Blue - Queen Of Hearts\",\"Bad Boys Blue - You\'re A Woman\",\"Bananarama - Venus\",\"Basshunter - Boten Anna\",\"Bee Gees - Heartbreaker\",\"Behemoth - O Father, O Satan, O Sun!\",\"Belinda Carlisle - Leave A Light On\",\"Belinda Carlisle - Mad About You\",\"Belinda Carlisle - Summer Rain\",\"Berlin - Take My Breath Away\",\"Beth Hart & Joe Bonamassa - I\'d Rather Go Blind\",\"Beverley Craven - Promise Me\",\"Billie Elish - bad guy\",\"Billy Idol - Cradle Of Love\",\"Billy Idol - Eyes Without A Face\",\"Billy Idol - Rebel Yell\",\"Billy Idol - Sweet Sixteen\",\"Billy Idol - To Be A Lover\",\"Billy Idol - White Wedding\",\"Billy Joel - Uptown Girl\",\"Billy Joel - We Didn\'t Start The Fire\",\"Björk - Hyper-ballad\",\"Black - Wonderful Life\",\"Black Eyed Peas - Shut Up\",\"Black Sabbath - A National Acrobat\",\"Black Sabbath - Iron Man\",\"Black Sabbath - Solitude\",\"Black Sabbath - The Warning\",\"Blink 182 - I Miss You\",\"Blue Stystem - Only With You\",\"Blue System - Does Your Mother Really Know\",\"Blue System - Dr. Mabuse\",\"Blue System - Laila\",\"Blue System - My Bed Is Too Big\",\"Blue System - When Sarah Smiles\",\"Blur - Boys And Girls\",\"Bob Marley - Get Up, Stand Up\",\"Bob Marley - No Woman, No Cry\",\"Bon Jovi - Always\",\"Bon Jovi - Bed Of Roses\",\"Bon Jovi - I\'ll Be There For You\",\"Bon Jovi - In These Arms\",\"Bon Jovi - It\'s My Life\",\"Bon Jovi - Livin\' On A Prayer\",\"Bon Jovi - Runaway\",\"Bon Jovi - You Give Love A Bad Name\",\"Boys - Wolność\",\"Boyz II Men - It\'s So Hard To Say Goodbye To Yesterday\",\"Bronski Beat - Smalltown Boy\",\"Brother Firetribe - Night Drive\",\"Brother Firetribe - Who Will You Run To Now?\",\"Bruce Dickinson - Tears Of The Dragon\",\"Bruce Springsteen - Brilliant Disguise\",\"Bruce Springsteen - I\'m On Fire\",\"Bruce Springsteen - Streets Of Philadelphia\",\"Bruno Mars - Locked Out Of Heaven\",\"Bruno Mars - Treasure\",\"Bryan Adams - Heaven\",\"Bryan Adams - Please Forgive Me\",\"Bryan Adams - Summer Of 69\'„,”Bryan Ferry - Slave To Love\",\"Budgie - Breadfan\",\"Budgie - Parents\",\"Budka Suflera - Jest Taki Samotny Dom\",\"Budka Suflera - Jolka, Jolka, Pamiętasz\",\"Budka Suflera - Nie Wierz Nigdy Kobiecie\",\"Budka Suflera - V Bieg\",\"C.C. Catch - Are You Man Enough\",\"C.C. Catch - Heartbreak Hotel\",\"C.C. Catch - Heaven And Hell\",\"C.C. Catch - Strangers By Night\",\"Calvin Harris ft. Example - We\'ll Be Coming Back\",\"Candlebox - Far Behind\",\"Cappella - U & Me\",\"Cat Stevens - Father And Son\",\"Celine Dion & Barbra Streisand - Tell Him\",\"Chicane - Saltwater\",\"Chris Cornell - You Know My Name\",\"Chris De Burgh - Lady In Red\",\"Chris Isaak - Wicked Game\",\"Chris Norman & Suzi Quatro - Stumblin\' In\",\"Chris Rea - Looking For The Summer\",\"Classix Nouveaux - Never Never Comes\",\"Cliff Turner - Moonlight Affair\",\"Closterkeller - Violette\",\"Clouseau - Close Encounters\",\"Code Red - Kanikuły 2007\",\"Collage - Living In The Moonlight\",\"Cosmic Gate - The Wave\",\"Counting Crows - Mr. Jones\",\"Covenant - Call The Ships To Port\",\"Creedence Clearwater Revival - Have You Ever Seen The Rain\",\"Culture Beat - Got To Get It\",\"Cutting Crew - I Just Died In Your Arms Tonight\",\"Czarny HiFi ft. Pezet - Niedopowiedzenia\",\"Czerwone Gitary - Kwiaty We Włosach\",\"Czesław Niemen - Sen O Warszawie\",\"Czesław Niemen & Enigmatic - Jednego Serca\",\"Daab - Ogrodu Serce\",\"Dare - Abandon\",\"Daria Zawiałow - Szarówka\",\"Darkness - In My Dreams\",\"Daryl Hall & John Oates - Out Of Touch\",\"David Bowie - Absolute Beginners\",\"David Bowie - Heroes\",\"David Bowie - Modern Love\",\"David Bowie - Starman\",\"De Mono - Kochać Inaczej\",\"De Mono - Wszystko Na Sprzedaż\",\"Dead Or Alive - You Spin Me Round (Like A Record)\",\"Debut De Soiree - Nuit De Folie\",\"Deep Purple - Black Night\",\"Deep Purple - Burn\",\"Deep Purple - Child In Time\",\"Deep Purple - Highway Star\",\"Deep Purple - Mistreated\",\"Deep Purple - Perfect Strangers\",\"Deep Purple - Soldier Of Fortune\",\"Deep Purple - Sometimes I Feel Like Screaming\",\"Deep Purple - When A Blind Man Cries\",\"Def Leppard - Animal\",\"Def Leppard - Hysteria\",\"Def Leppard - Love Bites\",\"Def Leppard - Pour Some Sugar On Me\",\"Del Shannon - Runaway (Crime Story OST)\",\"Den Harrow - Don\'t Break My Heart\",\"Depeche Mode - Enjoy The Silence\",\"Depeche Mode - Everything Counts\",\"Depeche Mode - Halo\",\"Depeche Mode - Precious\",\"Depeche Mode - Stripped\",\"Depeche Mode - Walking In My Shoes\",\"Digital Emotion - Go Go Yellow Screen\",\"DIIV - Doused\",\"Dire Straits - Brothers In Arms\",\"Dire Straits - Sultans Of Swing\",\"Dire Straits - Tunnel Of Love\",\"Dire Straits - Walk Of Life\",\"Dire Straits - Your Latest Trick\",\"Dire Straits ft. Sting - Money For Nothing\",\"DJ Bobo - Love Is All Around\",\"DJ Jose - Turn The Lights Off\",\"Don Henley - The Boys Of Summer\",\"Don McLean - American Pie\",\"Dr. Alban - Look Who\'s Talking\",\"Dream Theater - Nightmare To Remember\",\"Dune - Hardcore Vibes\",\"Duran Duran - Hungry Like The Wolf\",\"Duran Duran - Save A Prayer\",\"Dżem - Autsajder\",\"Earth, Wind & Fire - September\",\"Eddie Vedder - Society\",\"Eddy Huntington - U.S.S.R.\",\"Edwyn Collins - A Girl Like You\",\"Electric Light Orchestra - Ticket To The Moon\",\"Elliott Smith - Between The Bars\",\"Elton John - Rocket Man\",\"Elton John - Sacrifice\",\"Elvis Presley - In The Ghetto\",\"Eminem - Lose Yourself\",\"Eminem - The Way I Am\",\"Enigma - I Love You… I\'ll Kill You\",\"Enigma - Mea Culpa\",\"Enigma - Return To Innocence\",\"Enya - Caribbean Blue\",\"Enya - May It Be\",\"Eric Carmen - Hungry Eyes\",\"E-rotic - Sex On The Phone\",\"Escobar ft. Heather Nova - Someone New\",\"Europe - Carrie\",\"Europe - Dreamer\",\"Europe - Ready Or Not\",\"Europe - Rock The Night\",\"Europe - The Final Countdown\",\"Evanescence - My Immortal\",\"F.R. David - Girl\",\"Faith No More - A Small Victory\",\"Faith No More - Ashes To Ashes\",\"Falco - Vienna Calling\",\"Fancy - Come Back And Break My Heart\",\"Firebirds - Harry\",\"Fleetwood Mac - Little Lies\",\"Fleetwood Mac - Sara\",\"Fleetwood Mac - Seven Wonders\",\"Fleetwood Mac - The Chain\",\"Florence + The Machine - What The Water Gave Me\",\"Foreigner - I Want To Know What Love Is\",\"Foreigner - Urgent\",\"Frank Sinatra - The Way You Look Tonight\",\"Free - All Right Now\",\"Fun Factory - Close To You\",\"Gabry Ponte - Felicita\",\"Gary Moore - Still Got The Blues (For You)\",\"Genesis - Home By The Sea\",\"Genesis - Tonight, Tonight, Tonight\",\"George Michael - Careless Whisper\",\"George Michael - Kissing A Fool\",\"George Michael - One More Try\",\"George Michael - Waiting For That Day\",\"Gil Scott-Heron - Home Is Where The Hatred Is\",\"Giorgio Vanni feat. Amedeo Preziosi - Toon Tunz\",\"Godsmack - I Stand Alone\",\"Gojira - From The Sky\",\"Gojira - Stranded\",\"Good Charlotte - Keep You Hands Off My Girl\",\"Gorillaz ft. De La Soul - Feel Good Inc.\",\"Green Day - Boulevard Of Broken Dreams\",\"Groove Coverage - God Is A Girl\",\"Guns N\'Roses - Don\'t Cry\",\"Guns N\'Roses - Estrenged\",\"Guns N\'Roses - Knockin\' On Heaven\'s Door\",\"Guns N\'Roses - November Rain\",\"Guns N\'Roses - Paradise City\",\"Guns N\'Roses - Patience\",\"Guns N\'Roses - Rocket Queen\",\"Guns N\'Roses - Sweet Child O\'Mine\",\"Guns N\'Roses - Welcome To The Jungle\",\"Haddaway - Rock My Heart\",\"Harry Styles - Golden\",\"Hatari - Hatri? mun sigra\",\"Heart - Alone\",\"Heart - Crazy On You\",\"Hot Chocolate - It Started With A Kiss\",\"Howard Jones - What Is Love\",\"Hubert Kah - Wenn der Mond die Sonne berührt\",\"Ice Mc - Take Away The Colour (1993)\",\"Ice MC - Think About The Way\",\"Ich Troje - Razem, A Jednak Osobno\",\"INXS - By My Side\",\"INXS - Disappear\",\"INXS - Mystify\",\"INXS - Never Tear Us Apart\",\"INXS - The Devil Inside\",\"Iron Maiden - Bring Your Daughter To The Slaughter\",\"Iron Maiden - Fear Of The Dark\",\"Iron Maiden - Infinite Dreams\",\"Iron Maiden - Wasted Years\",\"James Brown - It\'s A Man\'s Man\'s Man\'s World\",\"Jan Hammer - Crockett\'s Theme\",\"Jan Johansen - H?ll Mej\",\"Janis Joplin - Summertime\",\"Jean Michel Jarre - Fourth Rendez-Vous\",\"Jefferson Airplane - White Rabbit\",\"Jerome - Light\",\"Jessie Ware - Imagine It Was Us\",\"Jets - Crush On You\",\"John Cafferty - Hearts On Fire\",\"John Farnham - You\'re The Voice\",\"John Lennon - Woman\",\"John Michael Montgomery - I Love The Way You Love Me\",\"John Parr - St. Elmos Fire (Man In Motion)\",\"Johnny Cash - Hurt\",\"Jon Bon Jovi - Blaze Of Glory\",\"Jon Bon Jovi - Miracle\",\"Jose Gonzalez - Crosses\",\"Joy - Hello\",\"Joy - Touch By Touch\",\"Joy Division - Love Will Tear Us Apart\",\"Julee Cruise - Falling\",\"K.B. Caps - Do You Really Need Me\",\"K.C. & The Sunishine Band - Give It Up\",\"Kaliber 44 - Konfrontacje\",\"Kansas - Dust In The Wind\",\"Kate Bush - Hounds Of Love\",\"Kate Bush - Wuthering Heights\",\"Kelly Clarkson - Behind These Hazel Eyes\",\"Kendrick Lamar - Swimming Pool (Drank)\",\"Killing Joke - Love Like Blood\",\"Kim Wilde - I Can\'t Get Enough\",\"Kim Wilde - Never Trust A Stranger\",\"Kim Wilde - You Keep Me Hangin\' On\",\"King Crimson - Epitaph\",\"Kings Of Leon - Closer\",\"Kings Of Leon - Sex On Fire\",\"Kiss - Heaven\'s On Fire\",\"Kombi - Black And White\",\"Kombi - Hotel Twoich Snów\",\"Kombi - Kochać Cię Za Późno\",\"Kombi - Przytul Mnie\",\"Kombi - Ślad\",\"Kool & The Gang - Summer Madness\",\"Korn - Alone I Break\",\"Korn - Got The Life\",\"Krzysztof Zalewski - Annuszka\",\"KSU - Jabol Punk\",\"Kult - Arahja\",\"Kult - Do Ani\",\"Kult - Hej, Czy Nie Wiecie\",\"Kult - Polska\",\"La Bouche - I Love To Love\",\"Lacrimosa - Halt Mich\",\"Lady Pank - Mniej Niż Zero\",\"Lady Pank - Sztuka Latania\",\"Lady Pank - Tacy Sami\",\"Lady Pank - Wspinaczka\",\"Lamb Of God - Walk With Me In Hell\",\"Lanberry - Ostatni Most\",\"Lao Che - Hydropiekłowstąpienie\",\"Laura Branigan - Self Control\",\"Led Zeppelin - All Of My Love\",\"Led Zeppelin - Babe I\'m Gonna Leave You\",\"Led Zeppelin - Kashmir\",\"Led Zeppelin - Since I\'ve Been Loving You\",\"Led Zeppelin - Stairway To Heaven\",\"Led Zeppelin - Whole Lotta Love\",\"Leonard Cohen - Dance Me To The End Of Love\",\"Lian Ross - Fantasy\",\"Lifelover - Myspys\",\"Limp Bizkit - My Way\",\"Linkin Park - Breaking The Habbit\",\"Linkin Park - Crawling\",\"Linkin Park - Easier To Run\",\"Linkin Park - Faint\",\"Linkin Park - In The End\",\"Linkin Park - Krwlng\",\"Linkin Park - Leave Out All The Rest\",\"Linkin Park - Numb\",\"Linkin Park - One Step Closer\",\"Linkin Park - P5hng Me A*wy\",\"Linkin Park - Somewhere I Belong\",\"Loft - Love Is Magic\",\"Lombard - Przeżyj To Sam (Live)\",\"Lonestar - Amazed\",\"Louis Armstrong - What A Wonderful World\",\"Lynyrd Skynryd - Free Bird\",\"Lynyrd Skynryd - Tuesday\'s Gone\",\"Łąki Łan - Bombaj\",\"Maanam - Wyjątkowo Zimny Maj\",\"Madness - Our House\",\"Madonna - Hung Up\",\"Madonna - La Isla Bonita\",\"Madonna - Like A Prayer\",\"Madonna - Live To Tell\",\"Madonna - Nothing Really Matters\",\"Madonna - Papa Don\'t Preach\",\"Madonna - Vogue\",\"Manfred Mann\' And The Band - For You\",\"Marek Grechuta & Anawa - Korowód\",\"Marek Grechuta & Anawa - Ocalić Od Zapomnienia\",\"Mariah Carey - Without You\",\"Marillion - Kayleigh\",\"Marillion - Lavender\",\"Marilyn Manson - Tourniquet\",\"Mark Morton ft. Chester Bennington - Cross Off\",\"Masterboy - Is This The Love\",\"Mayer Hawthorne - Maybe So, Maybe No\",\"Mayhem - Illuminate Eliminate\",\"Megadeth - A Tout Le Monde\",\"Men At Work - Down Under\",\"Mery Spolsky - Mazowiecka Kiecka\",\"Metallica - Enter Sandman\",\"Metallica - Master Of Puppets\",\"Metallica - Nothing Else Matters\",\"Metallica - One\",\"Metallica - Orion\",\"Metallica - Whiskey In The Jar\",\"MGMT - Little Dark Ages\",\"Michael Buble - Feeling Good\",\"Michael Jackson - Earth Song\",\"Michael Jackson - Liberian Girl\",\"Michael Jackson - Stranger In Moscow\",\"Michael Jackson ft. Slash - Give In To Me\",\"Michael Sembello - Maniac (Flashdance OST)\",\"Midge Ure - If I Was\",\"Midnight Oil - Beds Are Burning\",\"Mike Oldfield - Man In The Rain\",\"Miko Mission - Two For Love\",\"Mister Dex - Kopciuszek\",\"Modern Talking - Atlantis Is Calling (S.O.S. For Love)\",\"Modern Talking - Cheri Cheri Lady\",\"Modern Talking - China In Her Eyes\",\"Modern Talking - Don\'t Let Me Go\",\"Modern Talking - Don\'t Take Away My Heart\",\"Modern Talking - Geronimo\'s Cadillac\",\"Modern Talking - You Are Not Alone\",\"Molesta - Wiedziałem, Że Tak Będzie\",\"Moonlight - List Z Raju\",\"Mr. President - I\'ll Follow The Sun\",\"Muse - Butterflies And Hurricanes\",\"Muse - Hysteria\",\"Muse - Uprising\",\"My Chemical Romance - Welcome To The Black Parade\",\"Myslovitz - Długość Dźwięku Samotności\",\"Myslovitz - Gdzieś\",\"Nagły Atak Spawacza - Aleja nr 6 Grób nr 4\",\"Nazareth - Dream On\",\"Nazareth - Love Hurts\",\"Neil Sedaka - Oh! Carol\",\"New Order - Crystal\",\"New Order - True Faith\",\"Nightwish - Ghost Love Score\",\"Nightwish - The Poet And The Pendulum\",\"Nik Kershaw - Wide Boy\",\"Nik Kershaw - Wouldn\'t It Be Good\",\"Nirvana - Come As You Are\",\"Nirvana - Drain You\",\"Nirvana - The Man Who Sold The World\",\"Nouvelle Vague - Dance With Me\",\"O.S.T.R. - Życie Po Śmierci\",\"Obywatel G.C. - Nie Pytaj O Polskę\",\"Obywatel G.C. - Przyznaję Się Do Winy\",\"Obywatel G.C. - Tak… Tak… To Ja\",\"Oddział Zamknięty - Gdyby Nie Ty\",\"Oddział Zamknięty - Ten Wasz Świat\",\"Omega - Gyongyhaiu Lany\",\"Opus III - It\'s A Fine Day\",\"Orgy - Stitches\",\"Ozzy Osbourne - Changes\",\"Ozzy Osbourne - Dreamer\",\"Ozzy Osbourne - Ordinary Man\",\"Ozzy Osbourne - Under The Graveyard\",\"P.O.D. - Youth Of The Nation\",\"Pakito - Are You Ready\",\"Pakito - Moving On Stereo\",\"Panic! At The Disco - I Write Sins Not Tragedies\",\"Papa Dance - Naj Story\",\"Papa Dance - Nietykalni\",\"Papa Dance - Ocean Wspomnień\",\"Paramore - Decode\",\"Patrick Swayze ft. Wendy Fraser - She\'s Like The Wind\",\"Paul McCartney - Hope Of Deliverance\",\"Pearl Jam - Black\",\"Pearl Jam - Jeremy\",\"Pearl Jam - Oceans\",\"Perfect - Autobiografia\",\"Perfect - Nie Płacz Ewka\",\"Pet Shop Boys - Always On My Mind\",\"Pet Shop Boys - Heart\",\"Pet Shop Boys - Rent\",\"Pet Shop Boys - West End Girls\",\"Peter Gabriel & Kate Bush - Don\'t Give Up\",\"Peter Schilling - Major Tom\",\"Peter, Paul & Mary - Puff The Magic Dragon\",\"Pezet - Spadam\",\"Phil Collins - Against All Odds\",\"Phil Collins - Another Day In Paradise\",\"Phil Collins - In The Air Tonight\",\"Phil Collins - Something Happened On The Way To Heaven\",\"Phil Collins - Two Hearts\",\"Phil Collins & Philip Bailey - Easy Lover\",\"Phil Collins ft. Eric Clapton - I Wish It Would Rain Down\",\"Pink Floyd - Another Brick In The Wall (Part 2)\",\"Pink Floyd - Comfortably Numb\",\"Pink Floyd - Echoes\",\"Pink Floyd - Hey You\",\"Pink Floyd - High Hopes\",\"Pink Floyd - Money\",\"Pink Floyd - On The Turning Away\",\"Pink Floyd - Shine On You Crazy Diamond\",\"Pink Floyd - Wish You Were Here\",\"Player - Baby Come Back\",\"Pod Budą - Od Tamtej Chwili\",\"Porcupine Tree - Lazarus\",\"Power Of Trinity - Chodź Ze Mną\",\"Prince - Kiss\",\"Procol Harum - A Whiter Shade Of Pale\",\"Przemysław Gintrowski - Autoportret Witkacego\",\"Quebonafide - Zorza\",\"Queen - Bohemian Rhapsody\",\"Queen - Don\'t Stop Me Now\",\"Queen - I Want It All\",\"Queen - Innuendo\",\"Queen - Radio Ga Ga\",\"Queen - The Show Must Go On\",\"Queen - Who Wants To Live Forever\",\"R.E.M. - Find The River\",\"R.E.M. - Man On The Moon\",\"R.E.M. - The Sidewinder Sleeps Tonite\",\"Radiohead - Karma Police\",\"Radiorama - Aliens\",\"Rainbow - I Surrender\",\"Rainbow - Man On The Silver Mountain\",\"Rainbow - Stargazer\",\"Rammstein - Feuer Frei\",\"Rammstein - Sonne\",\"Raz Dwa Trzy - Trudno Nie Wierzyć W Nic\",\"Red Hot Chili Peppers - Californication\",\"Red Hot Chili Peppers - Can\'t Stop\",\"Red Hot Chili Peppers - Otherside\",\"Red Hot Chili Peppers - Snow\",\"Redbone - Come And Get Your Love\",\"Republika - Obcy Astronom\",\"Republika - Telefony\",\"Rezerwat - Zaopiekuj Się Mną\",\"Rick Fellini - Welcome To Rimini\",\"Robert Plant - Big Log\",\"Robin Beck - Tears In The Rain\",\"Rod Stewart - Sailing\",\"Roxette - Dangerous\",\"Roxette - Fading Like A Flower\",\"Roxette - How Do You Do\",\"Roxette - It Must Have Been Love\",\"Roxette - Joyride\",\"Roxette - Listen To Your Heart\",\"Rush -2112\",\"Rush - Closer To The Heart\",\"Rush - YYZ\",\"Ruslana - Wild Dances\",\"Ryan Paris - I Wanna Love You Once Again\",\"Sabrina - All Of Me\",\"Sade - King Of Sorrow\",\"Sade - Smooth Operator\",\"Sade - The Sweetest Taboo\",\"Samatha Fox - I Surrender (To The Spirit Of The Night)\",\"Sandra - (Life May Be) A Big Insanity\",\"Sandra - In The Heat Of The Night\",\"Sandra - We\'ll Be Together\",\"Savage - Only You\",\"Savage Garden - To The Moon And Back\",\"Schiller ft. Peter Heppner - I Feel You\",\"Schiller ft. September - Breathe\",\"Scooter - Leave In Silence\",\"Scorpions - Send Me An Angel\",\"Scorpions - Still Loving You\",\"Scorpions - Wind Of Change\",\"Scott McKenzie - San Francisco (Be Sure To Wear Some Flowers In Your Hair)\",\"Shania Twain - From This Moment On\",\"Silent Circle - Moonlight Affair\",\"Silverchair - Tomorrow\",\"Simon & Garfunkel - El Condor Pasa\",\"Simon & Garfunkel - The Boxer\",\"Simon & Garfunkel - The Only Living Boy In New York\",\"Simon & Garfunkel - The Sound Of Silence\",\"Simply Red - Holding Back The Years\",\"Sinead O\'Connor - Nothing Compares 2 U\",\"Skid Row - In A Darkened Room\",\"Slash - Anastasia\",\"Slayer - Angel Of Death\",\"Slayer - South Of Heaven\",\"Sleeping With Sirens - Kick Me\",\"Slipknot - Duality\",\"Slipknot - Everything Ends\",\"Slipknot - Psychosocial\",\"Slipknot - Snuff\",\"Slipknot - The Devil In I\",\"Slowdive - Crazy For You\",\"Smashing Pumpkins - Disarm\",\"Snowy White - Bird Of Paradise\",\"Sonata Arctica - Talullah\",\"Spandau Ballet - True\",\"Squash Gang - I Want An Illusion\",\"Stan Getz & Astrud Gilberto - The Girl From Ipanema\",\"Steppenwolf - Born To Be Wild\",\"Sting - Englishman In New York\",\"Sting - Fields Of Gold\",\"Sting - Fragile\",\"Strachy Na Lachy - Żyję W Kraju\",\"Style - It\'s A Secret\",\"Supergrass - Moving\",\"Sweet - Fox On The Run\",\"System Of A Down - Chop Suey!\",\"System Of A Down - Toxicity\",\"Sztywny Pal Azji - Wieża Radości, Wieża Samotności\",\"T.A.T.U. - Nas Ne Dagoniat\",\"T.Love - Lucy Phere\",\"T.Love - Warszawa\",\"Taco Hemingway - Deszcz Na Betonie\",\"Tadeusz Woźniak & Alibabki - Zegarmistrz Światła\",\"Talk Talk - Life\'s What You Make It\",\"Talking Heads - Psycho Killer\",\"Taylore Swift - You Belong To Me\",\"Tears For Fears - Shout\",\"Tess - One Love\",\"The Alan Parsons Project - Don\'t Answer Me\",\"The Animals - It\'s My Life\",\"The Animals - The House Of The Rising Sun\",\"The Bangles - Eternal Flame\",\"The Beach Boys - Darlin\'„,”The Beatles - Help!\",\"The Beatles - Hey Jude\",\"The Beatles - Let It Be\",\"The Beatles - While My Guitar Gently Weeps\",\"The Beatles - Yesterday\",\"The Cars - Drive\",\"The Clash - London Calling\",\"The Connells - 74\'-75\'„,”The Cranberries - Animal Instinct\",\"The Cranberries - Dreams\",\"The Cranberries - Linger\",\"The Cranberries - Stars\",\"The Cranberries - When You\'re Gone\",\"The Cranberries - Zombie\",\"The Cure - Burn\",\"The Cure - Disintegration\",\"The Cure - Friday I\'m In Love\",\"The Cure - Lovesong\",\"The Cure - Pictures Of You\",\"The Cure - Trust\",\"The Darkness - I Believe In A Thing Called Love\",\"The Doors - Break On Through\",\"The Doors - Light My Fire\",\"The Doors - People Are Strange\",\"The Doors - Riders On The Storm\",\"The Doors - The End\",\"The Doors - Waiting For The Sun\",\"The Eagles - Hotel California\",\"The Hooters - 500 Miles\",\"The Hurricanes - Only One Night\",\"The Jimi Hendrix Experience - All Along The Watchtower\",\"The Kelly Family - I Can\'t Help Myself\",\"The Kelly Family - One More Song\",\"The Killers - All These Things That I\'Ve Done\",\"The Killers - The Man\",\"The Moody Blues - Nights In White Satin\",\"The Pogues - Fiesta\",\"The Police - Every Little Thing She Does Is Magic\",\"The Police - Message In A Bottle\",\"The Rasmus - In The Shadows\",\"The Righteous Brothers - Unchained Melody\",\"The Rolling Stones - Angie\",\"The Rolling Stones - Paint It Black\",\"The Smiths - Stop Me If You Think You\'ve Heard This One Before\",\"The Stranglers - Golden Brown\",\"The Supremes - Keep Me Hangin\' On\",\"The Twins - Love System\",\"The Waterboys - The Whole Of The Moon\",\"The Zombies - She\'s Not There\",\"The Zombies - Time Of The Season\",\"Tina Turner - On Silent Wings\",\"Tom Petty And The Heartbreakers - Into The Great Wide Open\",\"Tomcraft - Loneliness\",\"Tonic - If You Could Only See\",\"Top One - Miła Moja\",\"Tori Amos - Winter\",\"Toto - Hold The Line\",\"T\'Pau - China In Your Hand\",\"Trans-X - Living On Video\",\"Travelling Wilburys - End Of The Line\",\"Travelling Wilburys - Runaway\",\"Trisha Yearwood - How Do I Live\",\"TSA -51\",\"TSA - Alien\",\"Turbo - Dorosłe Dzieci\",\"Twisted Sister - We\'re Not Gonna Take It\",\"U2 - New Year\'s Day\",\"U2 - One\",\"U2 - With Or Without You\",\"Uriah Heep - July Morning\",\"Uriah Heep - Lady In Black\",\"Valerie Dore - Lancelot\",\"Vanotek ft. Eneli - Tell Me Who\",\"Varius Manx - Zamigotał Świat\",\"Vize ft. Laniia - Stars\",\"Volbeat - The Garden\'s Tale\",\"Weezer - Island In The Sun\",\"Wham! - Everything She Wants\",\"Wham! - Last Christmas\",\"White Lies - Hold Back Your Love\",\"Whitesnake - Ain\'t No Love In The Heart Of The City\",\"Whitesnake - Fool For Your Loving\",\"Whitesnake - Is This Love\",\"Whitesnake - The Deeper The Love\",\"Whitney Houston - How Will I Know\",\"X-Perience - A Neverending Dream\",\"Yazoo - Don\'t Go\",\"Zbigniew Wodecki - Zacznij Od Bacha\",\"Zdzisława Sośnicka - Aleja Gwiazd\",\"Zespół Reprezentacyjny - Piosenka Bez Tytułu\",\"ZZ Top - Rough Boy\"]', 1, NULL, '2021-01-02 12:04:27', '2021-01-02 12:42:59'),
(5, 1, 'drop-down', 'drop_down.ad617668', NULL, NULL, NULL, 0, '2021-01-02 21:14:37', '2021-01-02 21:13:59', '2021-01-02 21:14:37'),
(6, 1, 'drop-down', 'drop_down.71968057', NULL, NULL, NULL, 0, '2021-01-02 21:14:15', '2021-01-02 21:14:09', '2021-01-02 21:14:15'),
(7, 3, 'drop-down', 'drop_down.dc9588cf', 'Co jest?', 1, '[\"Select at least\",\"Select at most\",\"Select exactly\"]', 1, '2021-01-23 14:36:33', '2021-01-02 21:18:07', '2021-01-23 14:36:33'),
(8, 3, 'multiple-choices', 'multiple_choices.7d247aa8', 'What the fuck?', 1, '[\"hiko\",\"gyte\"]', 1, '2021-01-23 14:36:27', '2021-01-03 14:46:17', '2021-01-23 14:36:27'),
(9, 3, 'linear-scale', 'linear_scale.6e33c7d8', '1233', 1, '{\"min\":{\"value\":\"0\",\"label\":\"low\"},\"max\":{\"value\":\"2\",\"label\":\"high\"}}', 1, '2021-01-23 14:34:53', '2021-01-03 14:46:21', '2021-01-23 14:34:53'),
(10, 3, 'checkboxes', 'checkboxes.0187097a', NULL, NULL, NULL, 0, '2021-01-22 21:56:29', '2021-01-22 21:56:05', '2021-01-22 21:56:29'),
(11, 3, 'checkboxes', 'checkboxes.7fe95721', NULL, NULL, NULL, 0, '2021-01-22 22:01:29', '2021-01-22 21:56:31', '2021-01-22 22:01:29'),
(12, 1, 'checkboxes', 'checkboxes.e273470c', NULL, NULL, NULL, 0, '2021-01-22 23:01:55', '2021-01-22 22:00:51', '2021-01-22 23:01:55'),
(13, 3, 'checkboxes', 'checkboxes.f23a9dd8', NULL, NULL, NULL, 0, '2021-01-22 22:02:38', '2021-01-22 22:01:08', '2021-01-22 22:02:38'),
(14, 3, 'checkboxes', 'checkboxes.57bff90c', NULL, NULL, NULL, 0, '2021-01-22 22:03:42', '2021-01-22 22:02:40', '2021-01-22 22:03:42'),
(15, 3, 'checkboxes', 'checkboxes.cbd57bce', NULL, NULL, NULL, 0, '2021-01-22 22:11:00', '2021-01-22 22:03:44', '2021-01-22 22:11:00'),
(16, 3, 'checkboxes', 'checkboxes.9830e2c6', NULL, NULL, NULL, 0, '2021-01-22 22:10:58', '2021-01-22 22:08:46', '2021-01-22 22:10:58'),
(17, 3, 'checkboxes', 'checkboxes.fca087d0', NULL, NULL, NULL, 0, '2021-01-22 22:10:55', '2021-01-22 22:10:28', '2021-01-22 22:10:55'),
(18, 1, 'checkboxes', 'checkboxes.554d1e20', NULL, NULL, NULL, 0, '2021-01-22 23:02:02', '2021-01-22 23:01:57', '2021-01-22 23:02:02'),
(19, 4, 'checkboxes', 'checkboxes.1ecc8cbe', NULL, NULL, NULL, 0, '2021-01-23 14:32:30', '2021-01-23 10:38:14', '2021-01-23 14:32:30'),
(20, 4, 'short-answer', 'short_answer.346efc2c', NULL, NULL, NULL, 0, '2021-01-23 14:32:30', '2021-01-23 14:32:10', '2021-01-23 14:32:30'),
(21, 5, 'short-answer', 'short_answer.8546d431', NULL, NULL, NULL, 0, '2021-01-23 15:09:18', '2021-01-23 14:33:04', '2021-01-23 15:09:18'),
(22, 5, 'checkboxes', 'checkboxes.7c45f307', 'Co myślisz o pogodzie?', 1, NULL, 1, NULL, '2021-01-23 14:33:22', '2021-01-24 12:06:28'),
(23, 3, 'checkboxes', 'checkboxes.08fcb8c7', 'Co tam jest?', 1, NULL, 1, NULL, '2021-01-23 14:36:36', '2021-01-24 15:02:06'),
(24, 5, 'short-answer', 'short_answer.571a7012', 'Podaj email', 1, NULL, 1, '2021-01-24 16:34:25', '2021-01-24 09:06:49', '2021-01-24 16:34:25');

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
(1, 1, 'yxM3LvHYzMmjYtIjIF9w9r5gDRbK5h1KgQKllXuJaHQGDN9ceeTPGEJCIYI7AkjG', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', NULL, '2021-01-22 22:45:10', '2021-01-22 22:45:10'),
(2, 1, 'n0UnaitgeO5sHmUisRkxwTSPQ0IOYeLUiHT0Q8LkSGFtqUh3ZlBq5OFKAbmHltDu', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', NULL, '2021-01-22 22:48:14', '2021-01-22 22:48:14'),
(3, 1, '2Wmin7oZ0911mJPRPNNIVmhnPCPi5r2Yv1NfAzzX2QxdYWRvRDSDLG3QG9IpUzdT', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', NULL, '2021-01-23 05:03:12', '2021-01-23 05:03:12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `form_resvalidation`
--

CREATE TABLE `form_resvalidation` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_field_id` int(10) UNSIGNED NOT NULL,
  `type` int(2) NOT NULL,
  `field_limit` int(10) NOT NULL,
  `custom_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, 'default', '{\"displayName\":\"App\\\\Mail\\\\EmailVerificationMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:30:\\\"App\\\\Mail\\\\EmailVerificationMail\\\":23:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:29:\\\"wojciech.pastuszko@interia.pl\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1609517997, 1609517997),
(2, 'default', '{\"displayName\":\"App\\\\Mail\\\\EmailVerificationMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:30:\\\"App\\\\Mail\\\\EmailVerificationMail\\\":23:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:29:\\\"wojciech.pastuszko@interia.pl\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1609520308, 1609520308),
(3, 'default', '{\"displayName\":\"App\\\\Mail\\\\EmailVerificationMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:30:\\\"App\\\\Mail\\\\EmailVerificationMail\\\":23:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:29:\\\"wojciech.pastuszko@interia.pl\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1609521232, 1609521232),
(4, 'default', '{\"displayName\":\"LaraForm\\\\Mail\\\\EmailVerificationMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:35:\\\"LaraForm\\\\Mail\\\\EmailVerificationMail\\\":23:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:13:\\\"LaraForm\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:29:\\\"wojciech.pastuszko@interia.pl\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1609522837, 1609522837),
(5, 'default', '{\"displayName\":\"App\\\\Mail\\\\EmailVerificationMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:30:\\\"App\\\\Mail\\\\EmailVerificationMail\\\":23:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"tuttej123@interia.pl\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1609527881, 1609527881),
(6, 'default', '{\"displayName\":\"App\\\\Mail\\\\ShareFormLinkMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:26:\\\"App\\\\Mail\\\\ShareFormLinkMail\\\":24:{s:4:\\\"form\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Form\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:4:\\\"data\\\";a:4:{s:13:\\\"email_subject\\\";s:47:\\\"TOP ULUBIONYCH PRZEBOJ\\u00d3W GRUPOWICZ\\u00d3W - VOL. 2\\\";s:13:\\\"email_message\\\";s:35:\\\"I\'ve invited you to fill in a form:\\\";s:9:\\\"user_name\\\";s:18:\\\"Wojciech Pastuszko\\\";s:10:\\\"user_email\\\";s:29:\\\"wojciech.pastuszko@interia.pl\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"wojciech.vojas@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1611247692, 1611247692),
(7, 'default', '{\"displayName\":\"App\\\\Mail\\\\ShareFormLinkMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":3:{s:8:\\\"mailable\\\";O:26:\\\"App\\\\Mail\\\\ShareFormLinkMail\\\":24:{s:4:\\\"form\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Form\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:4:\\\"data\\\";a:4:{s:13:\\\"email_subject\\\";s:47:\\\"TOP ULUBIONYCH PRZEBOJ\\u00d3W GRUPOWICZ\\u00d3W - VOL. 2\\\";s:13:\\\"email_message\\\";s:35:\\\"I\'ve invited you to fill in a form:\\\";s:9:\\\"user_name\\\";s:18:\\\"Wojciech Pastuszko\\\";s:10:\\\"user_email\\\";s:29:\\\"wojciech.pastuszko@interia.pl\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"wojciech.vojas@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:11:\\\"\\u0000*\\u0000markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;}\"}}', 0, NULL, 1611247736, 1611247736);

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
(12, '2019_03_24_201130_create_form_availabilities_table', 1);

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
(1, 'Wojciech', 'Pastuszko', 'wojciech.pastuszko@interia.pl', '$2y$10$YINcqeFHG.Is0AMHYnunc.Ocsq4fRwL21GL32XVCmsKt0Aejp2zTa', NULL, 'ZyFQk69wRBb5nrMyBpNATTFORwQJLeySI2uzakBGAF2uoMTgzJatXHzMrqai', NULL, '2021-01-01 16:40:37', '2021-01-01 16:40:37'),
(2, 'Maciej', 'Tutaj', 'tuttej123@interia.pl', '$2y$10$DPPnyGLQCp5kxLBZINZF7uzoB/IxVz9BlsXraXhFO.w4dKxyUWGkS', NULL, 'oVtrUIJZHN3sptwfSnamPojfuHDAzvzzpkXukDFunLCs9EUPJgPjvF2hudZz', NULL, '2021-01-01 18:04:41', '2021-01-01 18:04:41');

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
-- Indeksy dla tabeli `form_resvalidation`
--
ALTER TABLE `form_resvalidation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_field_id_form_fields_foreign` (`form_field_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `form_responses`
--
ALTER TABLE `form_responses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `form_resvalidation`
--
ALTER TABLE `form_resvalidation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Ograniczenia dla tabeli `form_resvalidation`
--
ALTER TABLE `form_resvalidation`
  ADD CONSTRAINT `form_field_id_form_fields_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
