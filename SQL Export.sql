SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Events`
--

-- --------------------------------------------------------

--
-- Table structure for table `belongsto`
--

CREATE TABLE `belongsto` (
  `person_name` varchar(60) NOT NULL,
  `group_name` varchar(60) NOT NULL,
  `dateofJoining` date NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(10) UNSIGNED NOT NULL,
  `categoryName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cityName` varchar(20) NOT NULL,
  `countyNo` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `county`
--

CREATE TABLE `county` (
  `countyNo` varchar(2) NOT NULL,
  `countyName` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventName` varchar(40) NOT NULL,
  `year` year(4) NOT NULL,
  `priceAdult` decimal(4,2) NOT NULL,
  `priceChild` decimal(4,2) NOT NULL,
  `name` varchar(40) NOT NULL,
  `blockNO` int(10) UNSIGNED NOT NULL,
  `street` varchar(20) NOT NULL,
  `zipCode` int(9) NOT NULL,
  `categoryId` int(10) UNSIGNED NOT NULL,
  `organizerId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `performerName` varchar(60) NOT NULL,
  `formationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organizer`
--

CREATE TABLE `organizer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `contactPerson` varchar(60) NOT NULL,
  `phoneNo` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `middleName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `performanceNo` int(10) UNSIGNED NOT NULL,
  `eventName` varchar(40) NOT NULL,
  `eventYear` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `performer`
--

CREATE TABLE `performer` (
  `performerName` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `performing`
--

CREATE TABLE `performing` (
  `performanceNo` int(10) UNSIGNED NOT NULL,
  `perfName` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `performerName` varchar(60) NOT NULL,
  `dateofBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `participantId` int(10) UNSIGNED NOT NULL,
  `phoneNo` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `participantId` int(10) UNSIGNED NOT NULL,
  `notifyType` enum('sms','email') NOT NULL,
  `performerName` varchar(60) NOT NULL,
  `name` varchar(40) NOT NULL,
  `blockNo` int(10) UNSIGNED NOT NULL,
  `street` varchar(20) NOT NULL,
  `zipCode` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registering`
--

CREATE TABLE `registering` (
  `participantId` int(10) UNSIGNED NOT NULL,
  `eventName` varchar(40) NOT NULL,
  `eventYear` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `dateofEvent` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `eventName` varchar(40) NOT NULL,
  `eventYear` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `name` varchar(40) NOT NULL,
  `blockNo` int(10) UNSIGNED NOT NULL,
  `street` varchar(20) NOT NULL,
  `zipCode` int(9) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `cityName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belongsto`
--
ALTER TABLE `belongsto`
  ADD PRIMARY KEY (`person_name`,`group_name`),
  ADD KEY `group_name` (`group_name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityName`,`countyNo`),
  ADD KEY `countyNo` (`countyNo`);

--
-- Indexes for table `county`
--
ALTER TABLE `county`
  ADD PRIMARY KEY (`countyNo`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventName`,`year`),
  ADD KEY `name` (`name`,`blockNO`,`street`,`zipCode`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `organizerId` (`organizerId`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`performerName`);

--
-- Indexes for table `organizer`
--
ALTER TABLE `organizer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`performanceNo`,`eventName`,`eventYear`),
  ADD KEY `eventName` (`eventName`,`eventYear`);

--
-- Indexes for table `performer`
--
ALTER TABLE `performer`
  ADD PRIMARY KEY (`performerName`);

--
-- Indexes for table `performing`
--
ALTER TABLE `performing`
  ADD PRIMARY KEY (`performanceNo`,`perfName`),
  ADD KEY `perfName` (`perfName`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`performerName`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`participantId`,`phoneNo`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`participantId`,`notifyType`),
  ADD KEY `performerName` (`performerName`),
  ADD KEY `name` (`name`,`blockNo`,`street`,`zipCode`);

--
-- Indexes for table `registering`
--
ALTER TABLE `registering`
  ADD PRIMARY KEY (`participantId`,`eventName`,`eventYear`),
  ADD KEY `eventName` (`eventName`,`eventYear`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`dateofEvent`,`startTime`,`eventName`,`eventYear`),
  ADD KEY `eventName` (`eventName`,`eventYear`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`name`,`blockNo`,`street`,`zipCode`),
  ADD KEY `cityName` (`cityName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongsto`
--
ALTER TABLE `belongsto`
  ADD CONSTRAINT `belongsto_ibfk_1` FOREIGN KEY (`person_name`) REFERENCES `person` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `belongsto_ibfk_2` FOREIGN KEY (`group_name`) REFERENCES `group` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countyNo`) REFERENCES `county` (`countyNo`) ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`name`,`blockNO`,`street`,`zipCode`) REFERENCES `venue` (`name`, `blockNo`, `street`, `zipCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `event_ibfk_3` FOREIGN KEY (`organizerId`) REFERENCES `organizer` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `group_ibfk_1` FOREIGN KEY (`performerName`) REFERENCES `performer` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`eventName`,`eventYear`) REFERENCES `event` (`eventName`, `year`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `performing`
--
ALTER TABLE `performing`
  ADD CONSTRAINT `performing_ibfk_1` FOREIGN KEY (`performanceNo`) REFERENCES `performance` (`performanceNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `performing_ibfk_2` FOREIGN KEY (`perfName`) REFERENCES `performer` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`performerName`) REFERENCES `performer` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`participantId`) REFERENCES `participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `preference`
--
ALTER TABLE `preference`
  ADD CONSTRAINT `preference_ibfk_1` FOREIGN KEY (`participantId`) REFERENCES `participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preference_ibfk_2` FOREIGN KEY (`performerName`) REFERENCES `performer` (`performerName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preference_ibfk_3` FOREIGN KEY (`name`,`blockNo`,`street`,`zipCode`) REFERENCES `venue` (`name`, `blockNo`, `street`, `zipCode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registering`
--
ALTER TABLE `registering`
  ADD CONSTRAINT `registering_ibfk_1` FOREIGN KEY (`participantId`) REFERENCES `participant` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `registering_ibfk_2` FOREIGN KEY (`eventName`,`eventYear`) REFERENCES `event` (`eventName`, `year`) ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`eventName`,`eventYear`) REFERENCES `event` (`eventName`, `year`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venue`
--
ALTER TABLE `venue`
  ADD CONSTRAINT `venue_ibfk_1` FOREIGN KEY (`cityName`) REFERENCES `city` (`cityName`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
