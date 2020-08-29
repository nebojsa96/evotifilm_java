-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2020 at 07:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evotifilm`
--

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `godina` int(10) UNSIGNED NOT NULL,
  `kratak_opis` varchar(1000) DEFAULT NULL,
  `opis` varchar(2000) DEFAULT NULL,
  `zakljucak` varchar(700) DEFAULT NULL,
  `trajanje` varchar(20) DEFAULT NULL,
  `ocena` smallint(5) UNSIGNED NOT NULL,
  `ocena_imdb` float NOT NULL,
  `imdb` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `naziv`, `godina`, `kratak_opis`, `opis`, `zakljucak`, `trajanje`, `ocena`, `ocena_imdb`, `imdb`) VALUES
(1, 'Pride and Prejudice', 2005, 'Priča prati dvoje mladih ljudi, Elizabeth Bennet i Mr Darcy-a, koji privlače jedno drugo. Međutim, kako bi bili zajedno, morali bi da pređu preko ponosa i svojih predrasuda.', 'Pride and Prejudice je britansko-američka romantična    drama, zasnovana na istoimenom romanu Jane Austin iz 1813. godine. Ovaj roman je dobio zaista mnogo ekranizacija različitog tipa, a ovaj film predstavlja njegovu komercijalno najuspešniju verziju. Ovo je prvi film režisera Joe Wright-a, koji nakon njega nastavlja sa Keirom Knightley da obrađuje romane (Atonement, Anna Karenina). Priča, uveliko poznata, prati porodicu Bennet tokom 18. veka u ruralnoj Engleskoj, u koje se doseljava dobrostojeći Mr Darcy, za koga bi se svaka devojka rado udala. Međutim Elizabeth Bennet nije kao svaka devojka i po našem mišljenju, na sjajan i slojevit način je tumači Keira Knightley. Prate je, u ulozi Mr Darcy-a veoma dobro uzdržani Matthew Macfadyen i ostatak sasvim dobro izabrane glumačke postave. S obzirom da su producenti želeli da se na neki način izdvoje od ostalog adaptiranog materijala, određene scene, kostimi, pa čak i vremenski period su malo izmenjeni, što se možda neće dopasti vernim poštovaocima originalnog materijala. Nama to nije smetalo i ovaj film, iako namenjen prvenstveno ženskoj publici, nam se zaista dopao i preporučujemo vam da ga pogledate.', 'Ovaj film postavlja određena pitanja. Da li film verno prikazuje roman? Veliki poštovaoci knjige će verovatno reći ne, što se nas tiče, adaptiran je veoma korektno. Da li je Keira dobro odglumela? Ovo pitanje se postavlja za svaku njenu ulogu, mi smatramo da jeste. Da li je film samo za žene? Iako je prvenstveno namenjen ženskom polu, mi smatramo da ne postoji podela na muške i ženske filmove. I nama dvojici, iako nismo žene, se veoma dopao. Od nas ovaj film dobija ocenu (4+). Koja je vaša ocena ovog filma i koji su vaši odgovori na ova pitanja? Pišite nam u komentarima.', '2h9min', 4, 7.8, 'http://www.imdb.com/title/tt0414387/'),
(2, 'Cosmos: A Spacetime Odyssey', 2014, 'Ova dokumentarna serija govori o kosmosu i zakonima priorode.', 'Cosmos: A Spacetime Odyssey je američka naučno-dokumentarna serija koja je na neki načn nastavak serije iz 1980. godine Cosmos: A Personal Voyage, čiji je glavni prezenter bio Carl Sagan i koja je napravila veliki korak i otvorila vrata televizije ostalim serijama i emisijama ovog karaktera. Ono čime se ova serija bavi je pokušaj da na što interesantniji način širokoj masi približi zakonitosti iz prirode i kosmosa, kao korak ka razumevanju čoveka i sveta oko njega. To uspeva da uradi na zaista neverovatno dobar i zanimljiv način, kroz određene priče i segmente, praćene sjajnom naracijom astrofizičara Neil deGrasse Tyson-a. Smatramo da je ova serija neverovatno korisna i da bi svako trebalo da je pogleda, jer pruža zaista obilje veoma bitnih informacija iz oblasti astrofizike, geografije, biologije, matematike... I samim tim se iz nje zaista može mnogo naučiti. Takođe, one informacije koje ste već znali, toliko su dobro sistematizovane i prezentovane da ćete se osećati još sigurnije u svoje znanje. Od nas imate apsolutnu preporuku da pogledate ovu seriju i zaista mnogo naučite.', 'Što se nas tiče, ova serija nas toliko oduševljava da bismo je mi prilikom reforme obrazovanja uveli kao obavezno štivo za učenike srednjih škola. Od nas dobija odličnu ocenu (5).', '13x43min', 5, 9.3, 'http://www.imdb.com/title/tt2395695/?ref_=fn_al_tt_1'),
(3, 'The Wolf of Wall Street', 2013, 'Priča prati život brokera od njegovih početaka do velikog bogatstva, koje sa sobom nosi mnoštvo ilegalnih aktivnosti, droge, korupcije, itd.', 'The Wolf of Wall Street je biografski film zasnovan na memoarima Jordan Belfort-a o njegovoj veoma uzbudljivoj karijeri na Wall Steet-u. Za režiju je zadužen veliki Martin Scorsese (Goodfellas, Shuter Island...), koji je sasvim očekivano uradio odličan posao. Priča filma prati Belforta, od njegovih nevinih početaka, do apsolutne dominacije i preterivanja u svetu novca, droge i prevara. Sama priča ovog filma je priča o pohlepi i tu nema neke preterane dubine, međutim način na koji je ispričana, specifičnom naracijom, sjajnim režijom i dijalozima i fenomenalnom glumom, dobijamo nešto duži film, koji proživljavamo sa punom pažnjom tokom celog njegovog trajanja. Za to je pored režije najzaslužnija gluma. U prvom planu je naravno, uvek sjajni i potcenjeni – Leonardo DiCaprio, koji iako tumači veoma plitku osobu, uspeva da dočara njegovu površnost na zaista sjajan način. Pored njega treba istaći i Jonah Hill-a, u daleko najboljoj ulozi u dosadašnjoj karijeri. Napomenućemo da je film prepun golotinje i korištenja droge, tako da ga ne bi baš trebalo gledati sa porodicom. Ovaj film je daleko bolji od materijala od koga je sastavljen i poseduje dosta sjajnih elemenata, kao i veoma jaku, mada malo skrivenu poruku, tako da vam preporučujemo da ga pogledate.', 'The Wolf of Wall Street nas je veoma dobro zabavio i sjajno nam držao pažnju. Međutim, kada dodatno razmislimo, shvatamo da je film u određenoj meri, s obzirom na trajanje, nedovoljno dobro balansiran (previše scena drogiranja i bahanalisanja, nešto manje vremena razvoja glavnog lika od nevinih početaka do velikog bogatstva). Smatramo da zaslužuje vrlo dobru ocenu (4+).', '3h', 4, 8.2, 'http://www.imdb.com/title/tt0993846/'),
(4, 'Nebeska udica', 2000, 'Priča o ljudima u Srbiji koji se suočavaju sa užasima bombardovanja.\r\n', 'Nebeska udica je domaći film koji je režirao Ljubiša Samardžić. Priča prati grupu ljudi koja se suočava sa užasima bombardovanja. Radnja filma je najviše koncentrisana na Kaju (Glogovac), bivšeg košarkaša, koji se pored bombardovanja bori i za svog sina. Kako bi skrenuli misli s rata i izbegli da provedu leto u skloništu, Kaja i ostali momci iz kraja organizuju sređivanje košarkaškog terena. U filmu se povajuvljuje veliki broj naših poznatih glumaca, poput Bjelogrlića, Milene Dravić, Đurička, Katarine Žutić, Irfana Mensura i mnogih drugih. Pored njih, kao specijalni gosti su u filmu su učestvovali i košarkaši Rebrača, Bodiroga, Đorđević, Željko Obradović. Film je veoma emotivan, i nemoguće je da vas određeni momenti ne dirnu. Nebeska udica spada među naša omiljena domaća ostvarenja, gledali smo je mnogo puta i verovatno čemo to učiniti ponovo. Verujemo da je veliki broj vas učinio isto, a ukoliko neko slučajno nije, preporučujemo da to što pre uradi.', 'Jel znaš ti kako se postaje pravi šampion? Tako što izađeš na teren kad je najteže i pobediš!. Bez ikakve sumnje, odličan (5).', '1h35min', 5, 7.9, 'http://www.imdb.com/title/tt0209180/?ref_=fn_al_tt_1'),
(5, 'Blended', 2014, 'Nakon veoma lošeg sastanka \"na slepo\", Jim i Lauren sa porodicama igrom slucaja odlaze na putovanje u isto vreme u isto mesto.', ' Blended je romanticna komedija koju je režirao Frank Coraci, koji je sa glavnim glumcem Adam Sandlerom saradivao i na drugim projektima, kao što su The Wedding Singer, The Wateboy, Click itd. Takode i glavna glumica ovog filma, Drew Barrymore je prethodno saradivala sa njim u filmovima The Wedding Singer i 50 First Dates. Upravo to je ono što možete ocekivati od ovog filma, neku kombinaciju vec videnog šablona Adam Sandlerovih filmova, sa relativno nerealisticnom radnjom, \"tupavim\" glavnim likom, karakteristicnim humorom i nekom vrstom \"slucajne\" romanse. Sve smo to uzeli u obzir i svesni smo cinjenice da nismo videli ništa novo, niti specijalno vredno u ovom filmu. Medutim, veoma nas je dobro zabavio i moramo priznati cak i nasmejao, što nije slucaj sa velikim brojem modernih komedija. Tako da, predlažemo vam da pogledate ovaj film u onim momentima kada jednostavno želite da se opustite, ne razmišljate previše i odmorite se od svega.', 'Kao što smo vec napomenuli, ovo zaista nije specijalno vredan film. Medutim, bio je jedan od onih \"feel good\" filmova koji nas je zapravo ostavio u dobrom raspoloženju i zbog toga vam ga preporucujemo. Od nas dobija iznadprosecnu ocenu (3+).', '1h30min', 3, 6.6, 'https://www.imdb.com/title/tt1086772/?ref_=nv_sr_1'),
(6, 'Psycho', 1960, ' Prica prati sekretaricu u besktvu, koja nakon krade 40.000$ od poslodavca, igrom slucaja odseda u motelu koji drži mladic sa svojom majkom.', ' Priča prati sekretaricu u besktvu, koja nakon krade 40.000$ od poslodavca, igrom slucaja odseda u motelu koji drži mladic sa svojom majkom. Psycho je psihološki horor film, zasnovan na istoimenom romanu Robert Bloch-a, koji je režirao najveci režiser horora svih vremena, Alfred Hitchcock (Vertigo, Rear Window...). U pitanju je revolucionarno delo, koje je na mnogo nacina promenilo filmsku industriju i cak uvelo novi podžanr \"slasher\" horor filmova. Radnja ovog crno-belog filma prati sekretaricu koja igrom slucaja odseda u Bates Motel-u koji drži Norman Bates sa svojojm majkom. Odnos Hitchcock-a prema svojoj glavnoj junakinji je nešto neverovatno što ekstremno iznenaduje publiku, cak i sada, 57 godina nakon izlaska ovog filma. Treba pohvaliti i Antony Perkinsa u nevideno jezivoj ulozi jednog od glavnih likova, Norman Bates-a. U pitanju je zaista veliki klasik svetske kinematografije, koji bi obavezno trebalo pogledati ukoliko ste to iz bilo kog razloga zaboravili da uradite.', 'Nema tu šta da se razmišlja, film koji je ovoliko bitan za kinematografiju uopšte, ni u ludilu ne može da dobije manju ocenu od odlicne (5). Ukoliko vas zanima malo više o Normanu Bates-u i njegovom odnosu sa majkom, preporucujemo vam da date šansu seriji Bates Motel.', '1h49min', 5, 8.5, 'https://www.imdb.com/title/tt0054215/?ref_=nv_sr_2');

-- --------------------------------------------------------

--
-- Table structure for table `film_zanr`
--

CREATE TABLE `film_zanr` (
  `id_film` int(10) UNSIGNED NOT NULL,
  `id_zanr` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `film_zanr`
--

INSERT INTO `film_zanr` (`id_film`, `id_zanr`) VALUES
(1, 8),
(1, 15),
(2, 7),
(3, 4),
(3, 5),
(3, 6),
(4, 8),
(4, 19),
(5, 5),
(5, 15),
(6, 6),
(6, 12),
(6, 14);

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `korisnicko_ime` varchar(32) NOT NULL,
  `sifra` varchar(32) NOT NULL,
  `puno_ime` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `tip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `korisnicko_ime`, `sifra`, `puno_ime`, `email`, `tip`) VALUES
(1, 'admin', '12345', 'Admin Adminic', 'admin.admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `zanr`
--

CREATE TABLE `zanr` (
  `id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zanr`
--

INSERT INTO `zanr` (`id`, `naziv`) VALUES
(1, 'Akcioni'),
(2, 'Animirani'),
(3, 'Avantura'),
(4, 'Biografija'),
(5, 'Komedija'),
(6, 'Krimi'),
(7, 'Dokumentarni'),
(8, 'Drama'),
(9, 'Porodični'),
(10, 'Fantazija'),
(11, 'Istorijski'),
(12, 'Horor'),
(13, 'Mjuzikl'),
(14, 'Misterija'),
(15, 'Romantični'),
(16, 'Naučna fantastika'),
(17, 'Sportski'),
(18, 'Triler'),
(19, 'Ratni'),
(20, 'Vestern'),
(21, 'Indijski');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film_zanr`
--
ALTER TABLE `film_zanr`
  ADD PRIMARY KEY (`id_film`,`id_zanr`),
  ADD KEY `film_zanr_fk_1` (`id_zanr`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zanr`
--
ALTER TABLE `zanr`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film_zanr`
--
ALTER TABLE `film_zanr`
  ADD CONSTRAINT `film_zanr_fk` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `film_zanr_fk_1` FOREIGN KEY (`id_zanr`) REFERENCES `zanr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
