-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 04, 2023 at 12:12 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelwebsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `timeMins` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activity_id`, `name`, `description`, `cost`, `country`, `province`, `timeMins`) VALUES
(1, 'Visit the Western Wall', 'Experience the sacred Western Wall in Jerusalem, a site of deep religious importance.', 0, 1, 'Jerusalem', 120),
(2, 'Explore the Dead Sea', 'Relax and float on the serene waters of the Dead Sea, known for its unique buoyancy.', 30, 1, 'Dead Sea', 240),
(3, 'Hike in the Galilee', 'Discover the lush beauty of the Galilee region on a scenic hiking adventure.', 10, 1, 'Galilee', 180),
(4, 'Visit the Grand Canyon', 'Witness the awe-inspiring beauty of the Grand Canyon in Arizona.', 25, 2, 'Arizona', 180),
(5, 'Explore New York City', 'Discover the bustling streets, iconic landmarks, and cultural diversity of New York City.', 20, 2, 'New York', 300),
(6, 'Hike in Yellowstone National Park', 'Embark on a hiking adventure in Yellowstone National Park, home to stunning natural wonders.', 15, 2, 'Wyoming', 240),
(7, 'Tour Buckingham Palace', 'Visit the historic Buckingham Palace in London and witness royal traditions.', 10, 4, 'London', 120),
(8, 'Explore Edinburgh Castle', 'Unfold the rich legacy of Edinburgh Castle in Scotland.', 12, 4, 'Scotland', 180),
(9, 'Hike in the Lake District', 'Hike through the picturesque Lake District in Cumbria, England.', 8, 4, 'Cumbria', 240),
(10, 'Explore the Eiffel Tower in Paris', 'Witness the iconic Eiffel Tower and explore the charming streets of Paris, France.', 12, 5, 'Paris', 180),
(11, 'Venice Canal Tour', 'Embark on a canal tour in Venice, Italy, and experience the dreamy canals of this historic city.', 15, 5, 'Venice', 120),
(12, 'Amsterdam Museum Visit', 'Discover renowned museums in Amsterdam, Netherlands, and immerse in its cultural richness.', 10, 5, 'Amsterdam', 180),
(13, 'Banff National Park Exploration', 'Explore the stunning landscapes of Banff National Park in Alberta, Canada.', 20, 7, 'Alberta', 240),
(14, 'Niagara Falls Visit', 'Witness the awe-inspiring beauty of Niagara Falls in Ontario, Canada.', 15, 7, 'Ontario', 180),
(15, 'Old Quebec Experience', 'Step back in time and explore the charming Old Quebec in Quebec City, Canada.', 10, 7, 'Quebec', 120),
(16, 'Chichen Itza Archeological Site', 'Explore the ancient wonders of Chichen Itza in Mexico.', 25, 8, 'Yucatan', 240),
(17, 'Mexico City Adventure', 'Immerse yourself in the lively streets and culture of Mexico City.', 15, 8, 'Mexico City', 180),
(18, 'Cancun Beach Relaxation', 'Relax on the pristine beaches of Cancun and enjoy the sun and sea.', 10, 8, 'Quintana Roo', 180),
(19, 'Explore Kyoto Streets', 'Discover the historic streets of Kyoto, Japan, and experience its rich cultural heritage.', 12, 9, 'Kyoto', 120),
(20, 'Tokyo City Exploration', 'Wander through the vibrant streets of Tokyo and immerse in its dynamic city life.', 18, 9, 'Tokyo', 180),
(21, 'Mount Fuji Hiking', 'Embark on a hiking adventure to witness the beauty of Mount Fuji in Shizuoka, Japan.', 15, 9, 'Shizuoka', 240),
(22, 'Great Wall of China Visit', 'Walk the iconic Great Wall of China and witness its ancient wonders.', 10, 10, 'Beijing', 180),
(23, 'Li River Cruise', 'Cruise along the breathtaking landscapes of the Li River in Guilin, China.', 20, 10, 'Guangxi', 240),
(24, 'Shanghai Exploration', 'Embrace the vibrant energy and modern marvels of Shanghai, China.', 15, 10, 'Shanghai', 180),
(25, 'Sydney Opera House Tour', 'Explore the iconic Sydney Opera House in New South Wales, Australia.', 12, 11, 'New South Wales', 120),
(26, 'Great Barrier Reef Diving', 'Dive into the dazzling marine life of the Great Barrier Reef in Queensland, Australia.', 35, 11, 'Queensland', 240),
(27, 'Great Ocean Road Drive', 'Take a scenic drive along the Great Ocean Road and witness its breathtaking landscapes.', 10, 11, 'Victoria', 300),
(28, 'Swiss Alps Adventure', 'Marvel at the stunning Swiss Alps and embark on various outdoor activities in Switzerland.', 15, 12, 'Swiss Alps', 240),
(29, 'Zurich City Tour', 'Explore the cosmopolitan atmosphere and cultural tapestry of Zurich, Switzerland.', 10, 12, 'Zurich', 120),
(30, 'Lake Geneva Scenic Visit', 'Enjoy the picturesque scenery of Lake Geneva in Switzerland.', 8, 12, 'Geneva', 180);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `coord_long` varchar(10) DEFAULT NULL,
  `coord_lat` varchar(10) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `name`, `coord_long`, `coord_lat`, `description`, `currency`) VALUES
(1, 'Israel', '35.21371', '31.76904', 'Explore Israel, a land of faith, heritage, and captivating natural beauty. Visit the sacred Western Wall in Jerusalem, a site of deep religious importance, and discover the rich cultural heritage of this ancient city. Your journey also unveils the stunning natural landscapes of Israel, from the serene Dead Sea to the Negev Desert\'s awe-inspiring beauty and the lush Galilee region.', 1),
(2, 'USA', '-74.01', '40.71', 'While you’re touring the world, don’t forget the US! America is a diverse nation where history, culture, and natural wonders come together. From the bustling streets of New York City to the innovation of Los Angeles and the beauty of national parks like Yellowstone and the Grand Canyon, it\'s a land of endless possibilities for every traveler.', 2),
(4, 'Britain', '-0.12829', '51.50740', 'Welcome to the United Kingdom, where historic landmarks like Buckingham Palace and the Tower of London beckon, and the rich legacy of Edinburgh Castle unfolds. Journey through picturesque countryside, where rolling hills and quaint villages paint a serene backdrop for exploration. Delve into the vibrant heart of London, home to iconic British heritage and culture. With a wealth of experiences waiting, from royal traditions to historic marvels, your adventure in the United Kingdom begins here.', 3),
(5, 'Europe', '2.35222', '48.85661', 'Embark on a journey through beautiful Europe, where dozens of ancient cities beckon with their own unique charm. Paris enchants with the Eiffel Tower and Louvre, Venice captivates with dreamy canals, and Amsterdam beckons with historic waterways and renowned museums. Each stop promises unique and unforgettable experiences in the heart of Europe.', 4),
(7, 'Canada', '-75.70', '45.42', 'Discover Canada\'s diverse beauty, where nature, history, and culture merge seamlessly. Be enchanted by the stunning landscapes of Banff National Park, witness the awe-inspiring Niagara Falls, and step back in time in the charming Old Quebec. Canada offers a myriad of experiences, from natural wonders to rich history, making it an unforgettable destination for every traveler.', 5),
(8, 'Mexico', '-89.16579', '21.16191', 'Embark on a journey through Mexico, a nation where history, culture, and natural beauty come together. Explore the ancient wonders of Chichen Itza, immerse yourself in the lively streets of Mexico City, and relax on the pristine beaches of Cancun. From its rich historical heritage to its stunning natural landscapes, Mexico offers a wide array of experiences for every traveler.', 6),
(9, 'Japan', '139.6917', '35.689557', 'Experience the best of Japan, where traditions harmoniously blend with modernity. Explore the historic streets of Kyoto, wander through Tokyo\'s vibrant energy, and discover natural wonders like Mount Fuji. Whether you\'re intrigued by Japan\'s rich heritage, picturesque landscapes, or dynamic city life, it\'s a captivating destination for every traveler.', 7),
(10, 'China', '116.40717', '39.90420', 'Explore China, a nation where ancient wonders meet modern marvels. Walk the iconic Great Wall, cruise along the Li River\'s breathtaking landscapes, and embrace the vibrant energy of cities like Shanghai. Whether you\'re drawn to China\'s rich history, stunning natural beauty, or dynamic urban life, it\'s a diverse and captivating destination for every traveler.', 8),
(11, 'Australia', '151.20929', '-33.86882', 'Welcome to the extraordinary beauty and boundless adventure of Australia, the Land Down Under! From the awe-inspiring landscapes of the Outback to the iconic Sydney Opera House and the dazzling marine life of the Great Barrier Reef, this diverse continent invites you to explore its natural wonders, vibrant cities, and unique wildlife. Discover ancient Aboriginal culture, savor delectable cuisine, and dive into thrilling outdoor activities, all while experiencing the warm hospitality of the Australian people.', 9),
(12, 'Switzerland', '8.2275', '46.8182', 'Discover Switzerland, a country where nature, culture, and history beautifully come together. Marvel at the Swiss Alps, stroll through the charming streets of Lucerne, and enjoy the cosmopolitan atmosphere of Zurich. From historic gems like the Old Town of Bern to the cultural tapestry of Geneva, Switzerland offers a wide range of experiences for every traveler.', 10);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `currency_id` int(11) NOT NULL,
  `name` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currency_id`, `name`) VALUES
(1, 'ILS'),
(2, 'USD'),
(3, 'GBP'),
(4, 'EUR'),
(5, 'CAD'),
(6, 'MXN'),
(7, 'JPY'),
(8, 'CNY'),
(9, 'AUD'),
(10, 'CHF');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(15) DEFAULT NULL,
  `lname` varchar(15) DEFAULT NULL,
  `password` varchar(600) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `homeCountry` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `lname`, `password`, `email`, `balance`, `homeCountry`) VALUES
(1, 'John', 'Smith', '97f31691fd16d944b07ac559a2245ff1e102f78e2e3b9b94b078714f99420036', 'JohnSmith@gmail.com', 33, 2),
(2, 'Jonathan', 'Stroud', 'd23c9ca6d6ea1c297d4e85918544724c02e8aaa8d51fb9ce75ef85448986d81c', 'JonathanStroud@gmail.com', 20.5, 1),
(3, 'Sam', 'Cooke', 'fbcdfa3bc323f5fe2984ceafb5c2236812e1565c9634d743aae24a44653bae4c', 'SamCooke@gmail.com', 20.5, 2),
(4, 'Becky', 'Juris-Stein', '259126b47f3a03723daa44fdedd7ba828d162f9037f05338227f9f614ba70111', 'BeckyJS@gmail.com', 20.5, 7),
(5, 'Terry', 'Pratchett', 'c4e0f0df1e6f34bb6d43f09f1331eeae36def94c620220c32297d4af6530a107', 'TerryPratchett@gmail.com', 20.5, 11),
(6, 'Agatha', 'Christie', '9d2a32aed5f8acb8f068de5e441c283fc6a97eadc83ed5c480b011c399fe2538', 'AgathaChristie@gmail.com', 20.5, 7),
(7, 'Michelle', 'Soffer', '7a2b1a063bd4547175ed5d1978ab42ab3bffa8525b506f0253537baea009d32a', 'boo@gmail.com', 0, 8),
(8, 'Meira', 'Soffer', '5c5561c561ca6ce7dd71f910309d70f6052045f58cafc9c75e77ecc78665430a', 'happymanjb99@gmail.com', 50, 8);

-- --------------------------------------------------------

--
-- Table structure for table `visited_activities`
--

CREATE TABLE `visited_activities` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ranking` double DEFAULT NULL,
  `review` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visited_activities`
--

INSERT INTO `visited_activities` (`id`, `activity_id`, `user_id`, `ranking`, `review`) VALUES
(1, 1, 1, 5, 'I loooooove the kotel!!!!'),
(2, 2, 2, 4.5, 'Floating in the Dead Sea was a surreal and relaxing experience.'),
(3, 3, 3, 3.5, 'Hiking in the Galilee provided breathtaking views.'),
(4, 4, 4, 5, 'The Grand Canyon is a natural wonder like no other.'),
(5, 5, 5, 4, 'New York City is a bustling metropolis with endless things to do.'),
(6, 6, 6, 3.5, 'Hiking in Yellowstone National Park was an adventure.'),
(7, 7, 1, 4, 'Buckingham Palace is a historical gem in the heart of London.'),
(8, 8, 2, 4.5, 'Edinburgh Castle offers a captivating journey through Scottish history.'),
(9, 9, 3, 3, 'The Lake District is a serene and picturesque destination.'),
(10, 10, 4, 4.5, 'The Eiffel Tower is an iconic symbol of Paris, a must-see.'),
(11, 11, 5, 3.5, 'Venice Canal Tour was a unique experience on the water.'),
(12, 12, 6, 4.5, 'Amsterdam Museum Visit was a cultural delight.'),
(13, 13, 1, 4.5, 'Banff National Park is a natural wonder with stunning landscapes.'),
(14, 14, 2, 4, 'Niagara Falls is awe-inspiring; I loved the boat tour!'),
(15, 15, 3, 3.5, 'Old Quebec is a charming step back in time.'),
(16, 16, 4, 5, 'Chichen Itza Archeological Site is a historic gem in Mexico.'),
(17, 17, 5, 4, 'Mexico City offers a lively and cultural experience.'),
(18, 18, 6, 4, 'Cancun Beach Relaxation was a perfect getaway.'),
(19, 19, 1, 5, 'Kyoto Streets are filled with rich history and beauty.'),
(20, 20, 2, 2.5, 'Tokyo City Exploration was too crowded for my liking.'),
(21, 21, 3, 4, 'Hiking Mount Fuji was a challenging but rewarding experience.'),
(22, 22, 4, 4.5, 'The Great Wall of China is an architectural marvel.'),
(23, 23, 5, 3, 'Li River Cruise offers scenic views of the Chinese countryside.'),
(24, 24, 6, 4.5, 'Shanghai\'s modernity is a sight to behold.'),
(25, 25, 1, 4.5, 'The Sydney Opera House Tour was a fantastic experience.'),
(26, 26, 2, 4, 'Diving in the Great Barrier Reef was breathtaking.'),
(27, 27, 3, 4.5, 'The Great Ocean Road Drive was a scenic adventure.'),
(28, 28, 4, 4, 'Exploring the Swiss Alps was an unforgettable experience.'),
(29, 29, 5, 4.5, 'The Zurich City Tour offered a glimpse into Swiss culture.'),
(30, 30, 6, 4, 'The Lake Geneva Scenic Visit was filled with picturesque views.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `FK_currency` (`currency`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `homeCountry` (`homeCountry`);

--
-- Indexes for table `visited_activities`
--
ALTER TABLE `visited_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_id` (`activity_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `visited_activities`
--
ALTER TABLE `visited_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`country`) REFERENCES `countries` (`country_id`);

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `FK_currency` FOREIGN KEY (`currency`) REFERENCES `currencies` (`currency_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`homeCountry`) REFERENCES `countries` (`country_id`);

--
-- Constraints for table `visited_activities`
--
ALTER TABLE `visited_activities`
  ADD CONSTRAINT `visited_activities_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activity_id`),
  ADD CONSTRAINT `visited_activities_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
