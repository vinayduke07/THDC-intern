-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2023 at 12:50 PM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `complaint`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@admin.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cate_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cate_id`, `category`) VALUES
(1, 'Electrical'),
(2, 'Civil'),
(3, 'Plumbaring'),
(4, 'Carpenter'),
(5, 'Drainage'),
(6, 'biogas');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `co_id` int(11) NOT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `c_level` int(1) DEFAULT NULL,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`co_id`, `cate_id`, `c_level`, `description`) VALUES
(2, 1, 1, 'Tube Light Not Working'),
(3, 3, 2, 'Pipe Leakage'),
(4, 1, 1, 'Fan Not Working'),
(5, 1, 1, 'Power Cut'),
(6, 2, 1, 'Fan Not Working'),
(7, 1, 1, 'Switch Board Not Working'),
(8, 2, 1, 'Wall Damage'),
(9, 2, 1, 'Toles Broken'),
(10, 3, 1, 'Tap Leakage'),
(11, 4, 1, 'Door damaged'),
(12, 4, 1, 'Window broken'),
(13, 5, 1, 'Cleaning'),
(14, 1, 1, 'wire damaged'),
(15, 1, 1, 'fan regulator broken'),
(16, 2, 1, 'silling damaged'),
(17, 2, 1, 'Tiles damaged'),
(18, 3, 1, 'Water Tank broken'),
(19, 3, 1, 'washbasin pipe jammed'),
(20, 2, 1, 'washbasin broken'),
(22, 5, 1, 'Drain full ');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_location`
--

CREATE TABLE `complaint_location` (
  `loc_id` int(11) NOT NULL,
  `c_id` varchar(20) NOT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_location`
--

INSERT INTO `complaint_location` (`loc_id`, `c_id`, `location`) VALUES
(1, '2018-06-04-001', 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_register`
--

CREATE TABLE `complaint_register` (
  `c_id` varchar(20) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `u_id` varchar(10) NOT NULL,
  `c_description` longtext NOT NULL,
  `c_date` date NOT NULL DEFAULT '1996-05-02',
  `s_date` date DEFAULT NULL,
  `c_status` int(1) DEFAULT NULL,
  `solution_duration` int(11) DEFAULT NULL,
  `w_id` int(11) DEFAULT NULL,
  `f_date` date DEFAULT NULL,
  `satisfaction_level` int(1) DEFAULT NULL,
  `f_status` tinyint(1) NOT NULL,
  `f_available` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_register`
--

INSERT INTO `complaint_register` (`c_id`, `cate_id`, `u_id`, `c_description`, `c_date`, `s_date`, `c_status`, `solution_duration`, `w_id`, `f_date`, `satisfaction_level`, `f_status`, `f_available`) VALUES
('2018-06-04-001', 1, '101', 'Fan Stop Working', '2017-05-04', '2018-06-04', 5, NULL, 1, '2018-06-05', 2, 1, 0);


-- --------------------------------------------------------

--
-- Table structure for table `deptmst`
--

CREATE TABLE `deptmst` (
  `deptid` int(11) NOT NULL,
  `Dept_Name` varchar(100) NOT NULL,
  `HOD` varchar(50) NOT NULL,
  `Pho_No` varchar(20) NOT NULL,
  `Email` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deptmst`
--

INSERT INTO `deptmst` (`deptid`, `Dept_Name`, `HOD`, `Pho_No`, `Email`) VALUES
(1, 'Computer Science', 'Vivek Kumar', '9874563210', 'hod.cs@thdcihet.ac.in');

-- --------------------------------------------------------

--
-- Stand-in structure for view `monthly_report`
--
CREATE TABLE `monthly_report` (
`cate_id` int(11)
,`c_date` date
,`c_description` longtext
,`c_status` int(1)
,`w_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `quarterly_report`
--
CREATE TABLE `quarterly_report` (
`c_status` int(1)
,`c_date` date
,`c_description` longtext
,`cate_id` int(11)
,`w_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `c_id` varchar(20) NOT NULL,
  `w_id` int(11) NOT NULL,
  `comment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remark`
--

INSERT INTO `remark` (`c_id`, `w_id`, `comment`) VALUES
('2018-06-22-001', 1, 'door');

-- --------------------------------------------------------

--
-- Stand-in structure for view `six_monthly_report`
--
CREATE TABLE `six_monthly_report` (
`c_status` int(1)
,`c_date` date
,`c_description` longtext
,`cate_id` int(11)
,`w_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `studmst`
--

CREATE TABLE `studmst` (
  `Stud_ID` varchar(10) NOT NULL,
  `Pwd` varchar(20) NOT NULL,
  `Stud_Name` varchar(200) NOT NULL,
  `stud_name_eng` varchar(200) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Add_Yr` varchar(40) NOT NULL,
  `Mo` varchar(15) NOT NULL,
  `bdate` date NOT NULL,
  `Dept_Name` varchar(200) NOT NULL,
  `Pro_Name` varchar(20) NOT NULL,
  `Loc_Add` varchar(200) NOT NULL,
  `Per_Add` varchar(200) NOT NULL,
  `Caste` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Grad_Yr` varchar(30) NOT NULL,
  `Univ_Name` varchar(150) NOT NULL,
  `Campus` varchar(20) NOT NULL,
  `user_type` enum('student','department','','') NOT NULL,
  `curr_sem` int(2) NOT NULL,
  `Repeat_sem` varchar(15) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `studImage` blob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studmst`
--

INSERT INTO `studmst` (`Stud_ID`, `Pwd`, `Stud_Name`, `stud_name_eng`, `Email`, `Add_Yr`, `Mo`, `bdate`, `Dept_Name`, `Pro_Name`, `Loc_Add`, `Per_Add`, `Caste`, `Gender`, `Grad_Yr`, `Univ_Name`, `Campus`, `user_type`, `curr_sem`, `Repeat_sem`, `activated`, `studImage`) VALUES
('190970101014', 'abcd', 'Aman Kala', 'Nil', 'aman@test.com', '', '975258745', '0000-00-00', '', '', '', '', '', '', '', '', '', 'student', 0, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` varchar(10) NOT NULL,
  `full_name` varchar(60) NOT NULL,
  `emp_no` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pho_no` varchar(13) NOT NULL,
  `address` longtext NOT NULL,
  `u_type` varchar(10) NOT NULL,
  `gender` char(1) NOT NULL,
  `user_photo` varchar(45) NOT NULL,
  `password` varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `full_name`, `emp_no`, `email`, `pho_no`, `address`, `u_type`, `gender`, `user_photo`, `password`) VALUES
('201', 'goswami vishwas kailash', '201', 'vishwas@gmail.com', '9898989898', 'Post Graduation Hostel', 'student', 'M', 'profile201.png', 'vishwas1234');

-- --------------------------------------------------------

--
-- Table structure for table `user_dept`
--

CREATE TABLE `user_dept` (
  `u_id` int(11) NOT NULL,
  `deptid` int(11) NOT NULL,
  `office_location` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_dept`
--

INSERT INTO `user_dept` (`u_id`, `deptid`, `office_location`) VALUES
(101, 1, 'Computer Science'),
(201, 8, 'USIC department Usic department');

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

CREATE TABLE `worker` (
  `w_id` int(11) NOT NULL,
  `w_name` varchar(60) NOT NULL,
  `ph_no` varchar(13) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `skill` int(11) NOT NULL,
  `w_status` varchar(15) NOT NULL,
  `password` varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `worker`
--

INSERT INTO `worker` (`w_id`, `w_name`, `ph_no`, `email`, `address`, `skill`, `w_status`, `password`) VALUES
(1, 'Ramesh', '9657452365', 'ramesh@gmail.com', '110,Usmanpura Ahmedabad,\nAhmedabad- 380014', 1, 'Active', ''),
(2, 'Suresh', '9657452366', 'suresh@gmail.com', '92,Incometax Ahmedabad,\nAhmedabad- 380014', 3, 'Active', 'suresh'),
(9, 'Shahnavaz Saiyadmiyan Saiyed', '9726321433', 'ssaiyed173@gmail.com', 'Vansda', 4, 'Active', ''),
(3, 'khushboo', '9786543252', 'khushboo@gmail.com', 'navrangpura', 5, 'Active', '1234567'),
(10, 'Mahesh ', '9874623510', 'mahesh@gmail.com', '92,NavrangpuraAhmedabad, Ahmedabad- 380014	', 2, 'Active', 'mahesh');

-- --------------------------------------------------------

--
-- Stand-in structure for view `yearly_report`
--
CREATE TABLE `yearly_report` (
`cate_id` int(11)
,`c_date` date
,`c_description` longtext
,`c_status` int(1)
,`w_id` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `monthly_report`
--
DROP TABLE IF EXISTS `monthly_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `monthly_report`  AS  select `complaint_register`.`cate_id` AS `cate_id`,`complaint_register`.`c_date` AS `c_date`,`complaint_register`.`c_description` AS `c_description`,`complaint_register`.`c_status` AS `c_status`,`complaint_register`.`w_id` AS `w_id` from `complaint_register` where ((month(`complaint_register`.`c_date`) = month(curdate())) and (year(`complaint_register`.`c_date`) = year(curdate()))) ;

-- --------------------------------------------------------

--
-- Structure for view `quarterly_report`
--
DROP TABLE IF EXISTS `quarterly_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `quarterly_report`  AS  select `complaint_register`.`c_status` AS `c_status`,`complaint_register`.`c_date` AS `c_date`,`complaint_register`.`c_description` AS `c_description`,`complaint_register`.`cate_id` AS `cate_id`,`complaint_register`.`w_id` AS `w_id` from `complaint_register` where ((`complaint_register`.`c_date` >= (now() - interval 2 month)) and (year(`complaint_register`.`c_date`) = year(curdate()))) ;

-- --------------------------------------------------------

--
-- Structure for view `six_monthly_report`
--
DROP TABLE IF EXISTS `six_monthly_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `six_monthly_report`  AS  select `complaint_register`.`c_status` AS `c_status`,`complaint_register`.`c_date` AS `c_date`,`complaint_register`.`c_description` AS `c_description`,`complaint_register`.`cate_id` AS `cate_id`,`complaint_register`.`w_id` AS `w_id` from `complaint_register` where ((`complaint_register`.`c_date` >= (now() - interval 5 month)) and (year(`complaint_register`.`c_date`) = year(curdate()))) ;

-- --------------------------------------------------------

--
-- Structure for view `yearly_report`
--
DROP TABLE IF EXISTS `yearly_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yearly_report`  AS  select `complaint_register`.`cate_id` AS `cate_id`,`complaint_register`.`c_date` AS `c_date`,`complaint_register`.`c_description` AS `c_description`,`complaint_register`.`c_status` AS `c_status`,`complaint_register`.`w_id` AS `w_id` from `complaint_register` where (year(`complaint_register`.`c_date`) = year(curdate())) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`co_id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- Indexes for table `complaint_location`
--
ALTER TABLE `complaint_location`
  ADD PRIMARY KEY (`loc_id`,`c_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `complaint_register`
--
ALTER TABLE `complaint_register`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `ct_id` (`cate_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `w_id` (`w_id`);

--
-- Indexes for table `deptmst`
--
ALTER TABLE `deptmst`
  ADD PRIMARY KEY (`deptid`),
  ADD UNIQUE KEY `Dept_Name` (`Dept_Name`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`c_id`,`w_id`) USING BTREE;

--
-- Indexes for table `studmst`
--
ALTER TABLE `studmst`
  ADD PRIMARY KEY (`Stud_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `email` (`email`,`pho_no`);

--
-- Indexes for table `user_dept`
--
ALTER TABLE `user_dept`
  ADD PRIMARY KEY (`u_id`,`deptid`),
  ADD KEY `deptid` (`deptid`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`w_id`),
  ADD UNIQUE KEY `ph_no` (`ph_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `complaint_location`
--
ALTER TABLE `complaint_location`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `deptmst`
--
ALTER TABLE `deptmst`
  MODIFY `deptid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `worker`
--
ALTER TABLE `worker`
  MODIFY `w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
