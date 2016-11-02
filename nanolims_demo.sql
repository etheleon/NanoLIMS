CREATE DATABASE nanolims_demo;
USE nanolims_demo;

-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2016 at 07:49 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nanolims_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `analysis`
--

CREATE TABLE IF NOT EXISTS `analysis` (
  `analysis_name` varchar(200) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analysis`
--

INSERT INTO `analysis` (`analysis_name`, `visible`) VALUES
('MEGAN Analysis - Metagenome', 1),
('MEGAN Analysis - Metagenome (update db 2016/5)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `application` varchar(30) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`application`, `visible`) VALUES
('Amplicon sequencing', 0),
('ChIP-sequencing', 1),
('Exome sequencing', 1),
('Metagenome PacBio', 1),
('Metagenome sequencing', 1),
('Metatranscriptome sequencing', 1),
('PacBio Isolates', 1),
('Small RNA sequencing', 1),
('Transcriptome Sequencing', 1),
('Whole genome sequencing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `container_type`
--

CREATE TABLE IF NOT EXISTS `container_type` (
  `container_type` varchar(15) NOT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `container_type`
--

INSERT INTO `container_type` (`container_type`, `visible`) VALUES
('384 well plate', 1),
('96 well plate', 1),
('Tube', 1);

-- --------------------------------------------------------

--
-- Table structure for table `create_user_things`
--

CREATE TABLE IF NOT EXISTS `create_user_things` (
  `thing_id` varchar(9) NOT NULL,
  `label_name` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `select_values` varchar(150) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `required` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `create_user_things`
--

INSERT INTO `create_user_things` (`thing_id`, `label_name`, `type`, `select_values`, `visible`, `required`) VALUES
('thing1', 'Test Field', 'text_input', NULL, 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `daily_data2`
--

CREATE TABLE IF NOT EXISTS `daily_data2` (
  `daily_date` date NOT NULL,
  `location` varchar(150) NOT NULL,
  `notes` varchar(300) DEFAULT NULL,
  `entered_by` varchar(30) NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orig_time_stamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_data2`
--

INSERT INTO `daily_data2` (`daily_date`, `location`, `notes`, `entered_by`, `updated_by`, `update_timestamp`, `orig_time_stamp`) VALUES
('2016-05-23', 'Office', '', 'Cassie Heinle', NULL, '2016-05-24 06:16:46', '2016-05-24 06:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `daily_data2_particle_counter`
--

CREATE TABLE IF NOT EXISTS `daily_data2_particle_counter` (
  `daily_date` date NOT NULL,
  `part_sens_name` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `avg_measurement` decimal(6,2) NOT NULL,
  `record_source` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_data2_particle_counter`
--

INSERT INTO `daily_data2_particle_counter` (`daily_date`, `part_sens_name`, `location`, `start_time`, `end_time`, `avg_measurement`, `record_source`) VALUES
('2016-05-23', 'LabData Velocicalc', 'Office', '07:00:00', '18:00:00', '6.00', 'e');

-- --------------------------------------------------------

--
-- Table structure for table `dna_extraction`
--

CREATE TABLE IF NOT EXISTS `dna_extraction` (
  `d_kit_name` varchar(150) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dna_extraction`
--

INSERT INTO `dna_extraction` (`d_kit_name`, `visible`) VALUES
('MoBio Power Soil Kit', 1),
('MoBio Power Water Kit', 1),
('Qiagen DNeasy Kity', 1);

-- --------------------------------------------------------

--
-- Table structure for table `drawer`
--

CREATE TABLE IF NOT EXISTS `drawer` (
  `drawer_id` varchar(40) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drawer`
--

INSERT INTO `drawer` (`drawer_id`, `visible`) VALUES
('Alice', 1),
('Dan', 1),
('F1', 1),
('F2', 1),
('Used', 1);

-- --------------------------------------------------------

--
-- Table structure for table `freezer`
--

CREATE TABLE IF NOT EXISTS `freezer` (
  `freezer_id` varchar(30) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `freezer`
--

INSERT INTO `freezer` (`freezer_id`, `visible`) VALUES
('-80C', 1),
('20C', 1),
('Used', 1);

-- --------------------------------------------------------

--
-- Table structure for table `freezer_drawer`
--

CREATE TABLE IF NOT EXISTS `freezer_drawer` (
  `freezer_id` varchar(30) NOT NULL,
  `drawer_id` varchar(40) NOT NULL,
  `visible_flag` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `freezer_drawer`
--

INSERT INTO `freezer_drawer` (`freezer_id`, `drawer_id`, `visible_flag`) VALUES
('-80C', 'F1', 1),
('-80C', 'F2', 1),
('20C', 'Alice', 1),
('20C', 'Dan', 1),
('Used', 'Used', 1);

-- --------------------------------------------------------

--
-- Table structure for table `library_prep_kit`
--

CREATE TABLE IF NOT EXISTS `library_prep_kit` (
  `lib_prep_kit` varchar(40) NOT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `library_prep_kit`
--

INSERT INTO `library_prep_kit` (`lib_prep_kit`, `visible`) VALUES
('Low Input Library Prep Kit', 1),
('Nextera DNA Library Preparation Kit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `loc_name` varchar(200) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL,
  `loc_type` varchar(150) NOT NULL,
  `environmental_type` varchar(200) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`loc_name`, `address`, `loc_type`, `environmental_type`, `latitude`, `longitude`, `visible`) VALUES
('(pooled)', '', '', '', '', '', 1),
('Beach', '987 Beach St', 'Rural', 'Open', '00 00 00', '00 00 00', 1),
('Office', '1234 Office Blvd', 'Residential', 'Closed', '00 00 00 N', '00 00 00 N', 1),
('Pond', '123 Lakeview road ', 'Outside', 'Open', '00 00 00 N', '00 00 00 N', 1);

-- --------------------------------------------------------

--
-- Table structure for table `media_type`
--

CREATE TABLE IF NOT EXISTS `media_type` (
  `media_type` varchar(150) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media_type`
--

INSERT INTO `media_type` (`media_type`, `visible`) VALUES
('(pooled)', 1),
('Eswab', 1),
('Life Guard', 1),
('MEA', 1),
('MilliQ', 1),
('N/A', 1),
('TSA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `number_of_seq_submissions`
--

CREATE TABLE IF NOT EXISTS `number_of_seq_submissions` (
  `sample_name` varchar(150) NOT NULL,
  `A` int(3) NOT NULL DEFAULT '0',
  `C` int(3) NOT NULL DEFAULT '0',
  `E` int(3) NOT NULL DEFAULT '0',
  `MP` int(3) DEFAULT '0',
  `M` int(3) NOT NULL DEFAULT '0',
  `MT` int(3) NOT NULL DEFAULT '0',
  `S` int(3) NOT NULL DEFAULT '0',
  `T` int(3) NOT NULL DEFAULT '0',
  `G` int(3) NOT NULL DEFAULT '0',
  `P` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `number_of_seq_submissions`
--

INSERT INTO `number_of_seq_submissions` (`sample_name`, `A`, `C`, `E`, `MP`, `M`, `MT`, `S`, `T`, `G`, `P`) VALUES
('2016/05/23first-projectA001', 0, 0, 0, 0, 2, 0, 0, 0, 0, 0),
('2016/05/23first-projectB004', 0, 0, 0, 0, 2, 0, 0, 0, 0, 0),
('2016/05/24first-projectA002', 0, 0, 0, 0, 2, 0, 0, 0, 0, 0),
('2016/05/24first-projectB003', 0, 0, 0, 0, 2, 0, 0, 0, 0, 0),
('2016/06/21second-projectB002', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2016/06/21second-projectB004', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2016/06/21second-projectB006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2016/06/21second-projectW001', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2016/06/21second-projectW003', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2016/06/21second-projectW005', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `particle_counter`
--

CREATE TABLE IF NOT EXISTS `particle_counter` (
  `part_sens_name` varchar(150) NOT NULL,
  `sensor_type` varchar(150) NOT NULL,
  `serial_num` varchar(150) NOT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `particle_counter`
--

INSERT INTO `particle_counter` (`part_sens_name`, `sensor_type`, `serial_num`, `visible`) VALUES
('LabData Velocicalc', 'Wind Speed, Temperature, Humidity', '1', 1),
('OPC', 'Optical Particle Counter', '1', 1),
('Rotronics CO2 Monitor', 'CO2 Monitor', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pooled_sample_lookup`
--

CREATE TABLE IF NOT EXISTS `pooled_sample_lookup` (
  `new_pooled_samp_name` varchar(150) NOT NULL,
  `orig_sample_name` varchar(150) NOT NULL,
  `date_entered` date NOT NULL,
  `entered_by` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_name`
--

CREATE TABLE IF NOT EXISTS `project_name` (
  `project_name` varchar(200) NOT NULL,
  `added_by` varchar(30) NOT NULL,
  `description` varchar(150) NOT NULL,
  `seq_id_start` varchar(6) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_name`
--

INSERT INTO `project_name` (`project_name`, `added_by`, `description`, `seq_id_start`, `time_stamp`, `visible`) VALUES
('first-project', 'Cassie Heinle', 'First project created for Demo', 'FSTPJ', '2016-05-23 03:06:31', 1),
('second-project', 'Cassie Heinle', 'Second Project For Demo', 'SCNPJ', '2016-05-23 03:46:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quantitation_method`
--

CREATE TABLE IF NOT EXISTS `quantitation_method` (
  `quant_method` varchar(10) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quant_instruments`
--

CREATE TABLE IF NOT EXISTS `quant_instruments` (
  `kit_name` varchar(150) NOT NULL,
  `visible` varchar(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quant_instruments`
--

INSERT INTO `quant_instruments` (`kit_name`, `visible`) VALUES
('PicoGreen', '1'),
('Qubit', '1');

-- --------------------------------------------------------

--
-- Table structure for table `read_length`
--

CREATE TABLE IF NOT EXISTS `read_length` (
  `read_length` varchar(20) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `read_length`
--

INSERT INTO `read_length` (`read_length`, `visible`) VALUES
('100bp (HiSeq)', 1),
('150bp (HiSeq)', 1),
('150bp (MiSeq)', 1),
('250bp (HiSeq)', 1),
('300bp (MiSeq)', 1),
('50bp (HiSeq)', 1),
('50bp (MiSeq)', 1),
('75bp (HiSeq)', 1),
('75bp (MiSeq)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `read_submission`
--

CREATE TABLE IF NOT EXISTS `read_submission` (
  `sample_name` varchar(150) NOT NULL,
  `subm_id` varchar(15) NOT NULL DEFAULT '',
  `subm_db` varchar(15) DEFAULT NULL,
  `subm_date` date DEFAULT NULL,
  `submitter` varchar(150) DEFAULT NULL,
  `type_exp` varchar(150) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `read_subm_database`
--

CREATE TABLE IF NOT EXISTS `read_subm_database` (
  `database_name` varchar(15) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `read_subm_database`
--

INSERT INTO `read_subm_database` (`database_name`, `visible`) VALUES
('DDBJ', 1),
('ENA', 1),
('GenBank', 1);

-- --------------------------------------------------------

--
-- Table structure for table `read_subm_exp_types`
--

CREATE TABLE IF NOT EXISTS `read_subm_exp_types` (
  `exp_types` varchar(150) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `read_subm_exp_types`
--

INSERT INTO `read_subm_exp_types` (`exp_types`, `visible`) VALUES
(' Eukaryotic Genomic Sequences MIGS -Genome, metagenome or marker sequences (MIxS compliant)', 1),
('Cultured Bacterial/Archaeal Genomic Sequences MIGS-Genome, metagenome or marker sequences (MIxS compliant)', 1),
('Environmental/Metagenome Genomic Sequences MIMS -Genome, metagenome or marker sequences (MIxS compliant)', 1),
('Human sample ', 1),
('Invertebrate ', 1),
('Metagenome or environmental sample ', 1),
('Microbe ', 1),
('Model organism or animal sample ', 1),
('Pathogen affecting public health', 1),
('Plant sample ', 1),
('Specimen Marker Sequences MIMARKS-Genome, metagenome or marker sequences (MIxS compliant)', 1),
('Survey-related Marker Sequences MIMARKS-Genome, metagenome or marker sequences (MIxS compliant)', 1),
('Viral Genomic Sequences MIGS-Genome, metagenome or marker sequences (MIxS compliant)', 1),
('Virus sample', 1);

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE IF NOT EXISTS `records` (
  `records` varchar(150) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`records`, `visible`) VALUES
('Rotronics CO2 Meter 1', 1),
('Velocicalc unit1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `relt_location`
--

CREATE TABLE IF NOT EXISTS `relt_location` (
  `loc_name` varchar(150) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relt_location`
--

INSERT INTO `relt_location` (`loc_name`, `visible`) VALUES
('(pooled)', 1),
('10 M Below Surface', 1),
('30 M Below Surface', 1),
('50 cm from ceiling', 1),
('Bookshelf', 1),
('Desk', 1),
('Dock', 1),
('Floor', 1),
('Qubit', 1),
('Surf', 1),
('Surface Water', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rna_extraction`
--

CREATE TABLE IF NOT EXISTS `rna_extraction` (
  `r_kit_name` varchar(150) NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rna_extraction`
--

INSERT INTO `rna_extraction` (`r_kit_name`, `visible`) VALUES
('QIAGEN-RNeasy Mini Kit', 0),
('RNA PowerSoil Total RNA Isolation Kit Sample', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE IF NOT EXISTS `sample` (
  `sample_name` varchar(150) NOT NULL,
  `sample_num` int(3) NOT NULL,
  `sample_sort` varchar(150) NOT NULL,
  `analysis_name` varchar(200) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `collector_name` varchar(150) NOT NULL,
  `d_conc` decimal(10,2) DEFAULT NULL,
  `d_conc_instrument` varchar(150) DEFAULT NULL,
  `d_extraction_date` date DEFAULT NULL,
  `dExtrName` varchar(150) DEFAULT NULL,
  `d_volume` float DEFAULT NULL,
  `d_volume_quant` float DEFAULT NULL,
  `dna_extract_kit_name` varchar(150) DEFAULT NULL,
  `daily_data` date DEFAULT NULL,
  `end_samp_date_time` datetime DEFAULT NULL,
  `entered_by` varchar(30) NOT NULL,
  `flow_rate` decimal(5,2) DEFAULT NULL,
  `flow_rate_eod` decimal(5,2) DEFAULT NULL,
  `location_name` varchar(200) NOT NULL,
  `media_type` varchar(150) DEFAULT NULL,
  `notes` text,
  `orig_time_stamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `part_of_pool` varchar(1) NOT NULL DEFAULT 'N',
  `pool_extracts_id` varchar(150) DEFAULT NULL,
  `pooled_flag` varchar(2) NOT NULL DEFAULT 'NP',
  `project_name` varchar(200) NOT NULL,
  `r_conc` decimal(10,2) DEFAULT NULL,
  `r_conc_instrument` varchar(150) DEFAULT NULL,
  `r_extraction_date` date DEFAULT NULL,
  `rExtrName` varchar(150) DEFAULT NULL,
  `r_volume` float DEFAULT NULL,
  `r_volume_quant` float DEFAULT NULL,
  `rna_extract_kit_name` varchar(150) DEFAULT NULL,
  `relt_loc_name` varchar(150) NOT NULL,
  `sample_type` varchar(3) DEFAULT NULL,
  `sampler_name` varchar(150) NOT NULL,
  `sampling_height` decimal(8,2) NOT NULL,
  `part_sens_name` varchar(150) DEFAULT NULL,
  `particle_ct_csv_file` varchar(200) DEFAULT NULL,
  `seq_id` varchar(8) NOT NULL,
  `seq_dna_conc` decimal(7,2) DEFAULT NULL,
  `seq_vol` float DEFAULT NULL,
  `sequencing_info` varchar(150) DEFAULT NULL,
  `start_samp_date_time` datetime DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_samp_time` float(10,4) DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample`
--

INSERT INTO `sample` (`sample_name`, `sample_num`, `sample_sort`, `analysis_name`, `barcode`, `collector_name`, `d_conc`, `d_conc_instrument`, `d_extraction_date`, `dExtrName`, `d_volume`, `d_volume_quant`, `dna_extract_kit_name`, `daily_data`, `end_samp_date_time`, `entered_by`, `flow_rate`, `flow_rate_eod`, `location_name`, `media_type`, `notes`, `orig_time_stamp`, `part_of_pool`, `pool_extracts_id`, `pooled_flag`, `project_name`, `r_conc`, `r_conc_instrument`, `r_extraction_date`, `rExtrName`, `r_volume`, `r_volume_quant`, `rna_extract_kit_name`, `relt_loc_name`, `sample_type`, `sampler_name`, `sampling_height`, `part_sens_name`, `particle_ct_csv_file`, `seq_id`, `seq_dna_conc`, `seq_vol`, `sequencing_info`, `start_samp_date_time`, `time_stamp`, `total_samp_time`, `updated_by`) VALUES
('2016/05/23first-projectA001', 1, 'first-project001', 'MEGAN Analysis - Metagenome', NULL, 'Alice', '10.00', 'PicoGreen', '2016-05-27', 'Alice', 60, 20, 'MoBio Power Water Kit', '0000-00-00', '2016-05-23 18:00:00', 'Cassie Heinle', '0.00', '0.00', 'Office', 'Eswab', NULL, '2016-05-23 03:41:27', 'N', NULL, 'NP', 'first-project', NULL, NULL, NULL, '', NULL, NULL, NULL, 'Bookshelf', 'A', '', '200.00', NULL, NULL, 'FSTPJ001', NULL, NULL, '', '2016-05-23 07:00:00', '2016-05-23 04:29:12', 11.0000, 'cheinle@ntu.edu.sg'),
('2016/05/23first-projectB004', 4, 'first-project004', NULL, NULL, 'Alice', '30.00', 'PicoGreen', '2016-05-27', 'Alice', 60, 20, 'MoBio Power Water Kit', NULL, '2016-05-23 07:00:00', 'Cassie Heinle', '0.00', '0.00', 'Office', 'Eswab', NULL, '2016-05-23 03:45:48', 'N', NULL, 'NP', 'first-project', NULL, NULL, NULL, '', NULL, NULL, NULL, 'Bookshelf', 'B', '', '200.00', NULL, NULL, 'FSTPJ004', NULL, NULL, '', '2016-05-23 07:00:00', '2016-05-23 03:54:29', 0.0000, 'Cassie Heinle'),
('2016/05/24first-projectA002', 2, 'first-project002', NULL, NULL, 'Alice', '20.00', 'PicoGreen', '2016-05-27', 'Alice', 60, 20, 'MoBio Power Water Kit', NULL, '2016-05-24 18:00:00', 'Cassie Heinle', '0.00', '0.00', 'Office', 'Eswab', NULL, '2016-05-23 03:45:16', 'N', NULL, 'NP', 'first-project', NULL, NULL, NULL, '', NULL, NULL, NULL, 'Bookshelf', 'A', '', '200.00', NULL, NULL, 'FSTPJ002', NULL, NULL, '', '2016-05-24 07:00:00', '2016-05-23 04:19:32', 11.0000, 'Cassie Heinle'),
('2016/05/24first-projectB003', 3, 'first-project003', NULL, NULL, 'Alice', '15.00', 'PicoGreen', '2016-05-27', 'Alice', 60, 20, 'MoBio Power Water Kit', NULL, '2016-05-24 07:00:00', 'Cassie Heinle', '0.00', '0.00', 'Office', 'Eswab', '', '2016-05-23 03:45:38', 'N', NULL, 'NP', 'first-project', NULL, NULL, NULL, '', NULL, NULL, NULL, 'Bookshelf', 'B', '', '200.00', NULL, NULL, 'FSTPJ003', NULL, NULL, '', '2016-05-24 07:00:00', '2016-05-23 03:45:38', 0.0000, NULL),
('2016/06/21second-projectB002', 2, 'second-project002', NULL, NULL, 'Dan', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-06-21 07:00:00', 'Cassie Heinle', '0.00', '0.00', 'Beach', 'N/A', '', '2016-05-23 03:47:54', 'N', NULL, 'NP', 'second-project', NULL, NULL, NULL, '', NULL, NULL, NULL, 'Surface Water', 'B', '', '0.00', NULL, NULL, 'SCNPJ002', NULL, NULL, '', '2016-06-21 07:00:00', '2016-05-23 03:47:54', 0.0000, NULL),
('2016/06/21second-projectB004', 4, 'second-project004', NULL, NULL, 'Dan', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-06-21 07:00:00', 'Cassie Heinle', '0.00', '0.00', 'Beach', 'N/A', '', '2016-05-23 03:48:58', 'N', NULL, 'NP', 'second-project', NULL, NULL, NULL, '', NULL, NULL, NULL, '10 M Below Surface', 'B', '', '0.00', NULL, NULL, 'SCNPJ004', NULL, NULL, '', '2016-06-21 07:00:00', '2016-05-23 03:48:58', 0.0000, NULL),
('2016/06/21second-projectB006', 6, 'second-project006', NULL, NULL, 'Dan', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-06-21 07:00:00', 'Cassie Heinle', '0.00', '0.00', 'Beach', 'N/A', '', '2016-05-23 03:49:45', 'N', NULL, 'NP', 'second-project', NULL, NULL, NULL, '', NULL, NULL, NULL, '30 M Below Surface', 'B', '', '0.00', NULL, NULL, 'SCNPJ006', NULL, NULL, '', '2016-06-21 07:00:00', '2016-05-23 03:49:45', 0.0000, NULL),
('2016/06/21second-projectW001', 1, 'second-project001', NULL, NULL, 'Dan', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-06-21 07:05:00', 'Cassie Heinle', '0.00', '0.00', 'Beach', 'N/A', '', '2016-05-23 03:47:32', 'N', NULL, 'NP', 'second-project', NULL, NULL, NULL, '', NULL, NULL, NULL, 'Surface Water', 'W', '', '0.00', NULL, NULL, 'SCNPJ001', NULL, NULL, '', '2016-06-21 07:00:00', '2016-05-23 03:47:32', 0.0800, NULL),
('2016/06/21second-projectW003', 3, 'second-project003', NULL, NULL, 'Dan', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-06-21 07:05:00', 'Cassie Heinle', '0.00', '0.00', 'Beach', 'N/A', '', '2016-05-23 03:48:29', 'N', NULL, 'NP', 'second-project', NULL, NULL, NULL, '', NULL, NULL, NULL, '10 M Below Surface', 'W', '', '0.00', NULL, NULL, 'SCNPJ003', NULL, NULL, '', '2016-06-21 07:00:00', '2016-05-23 03:48:29', 0.0800, NULL),
('2016/06/21second-projectW005', 5, 'second-project005', NULL, NULL, 'Dan', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-06-21 07:05:00', 'Cassie Heinle', '0.00', '0.00', 'Beach', 'N/A', '', '2016-05-23 03:49:36', 'N', NULL, 'NP', 'second-project', NULL, NULL, NULL, '', NULL, NULL, NULL, '30 M Below Surface', 'W', '', '0.00', NULL, NULL, 'SCNPJ005', NULL, NULL, '', '2016-06-21 07:00:00', '2016-05-23 03:49:36', 0.0800, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sampler`
--

CREATE TABLE IF NOT EXISTS `sampler` (
  `sampler_name` varchar(150) NOT NULL,
  `serial_num` varchar(200) DEFAULT NULL,
  `sampler_identifier` varchar(50) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sampler`
--

INSERT INTO `sampler` (`sampler_name`, `serial_num`, `sampler_identifier`, `visible`) VALUES
('(pooled)', NULL, '', 1),
('Andersen Single Stage Impactor N6', NULL, 'N6', 1),
('Bucket', NULL, '', 1),
('Pump', NULL, '', 1),
('Rosette', NULL, '', 1),
('Vaccum Pump1', NULL, '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sample_sampler`
--

CREATE TABLE IF NOT EXISTS `sample_sampler` (
  `sample_name` varchar(150) NOT NULL,
  `sampler_name` varchar(150) NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `total_date_time` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample_sampler`
--

INSERT INTO `sample_sampler` (`sample_name`, `sampler_name`, `start_date_time`, `end_date_time`, `total_date_time`) VALUES
('2016/05/23first-projectA001', 'Vaccum Pump1', '2016-05-23 07:00:00', '2016-05-23 18:00:00', 11),
('2016/05/23first-projectB004', 'Vaccum Pump1', '2016-05-23 07:00:00', '2016-05-23 07:00:00', 0),
('2016/05/24first-projectA002', 'Vaccum Pump1', '2016-05-24 07:00:00', '2016-05-24 18:00:00', 11),
('2016/05/24first-projectB003', 'Vaccum Pump1', '2016-05-24 07:00:00', '2016-05-24 07:00:00', 0),
('2016/06/21second-projectB002', 'Rosette', '2016-06-21 07:00:00', '2016-06-21 07:00:00', 0),
('2016/06/21second-projectB004', 'Rosette', '2016-06-21 07:00:00', '2016-06-21 07:00:00', 0),
('2016/06/21second-projectB006', 'Rosette', '2016-06-21 07:00:00', '2016-06-21 07:00:00', 0),
('2016/06/21second-projectW001', 'Rosette', '2016-06-21 07:00:00', '2016-06-21 07:05:00', 0.08),
('2016/06/21second-projectW003', 'Rosette', '2016-06-21 07:00:00', '2016-06-21 07:05:00', 0.08),
('2016/06/21second-projectW005', 'Rosette', '2016-06-21 07:00:00', '2016-06-21 07:05:00', 0.08);

-- --------------------------------------------------------

--
-- Table structure for table `sample_sequencing2`
--

CREATE TABLE IF NOT EXISTS `sample_sequencing2` (
  `sample_name` varchar(150) NOT NULL,
  `seq_id` varchar(150) NOT NULL,
  `seq_sub_name` varchar(150) DEFAULT NULL,
  `dna_conc` decimal(6,3) DEFAULT NULL,
  `vol` decimal(5,2) DEFAULT NULL,
  `wellLoc` varchar(5) DEFAULT NULL,
  `sampBuffer` varchar(150) DEFAULT NULL,
  `nano` decimal(6,3) DEFAULT NULL,
  `a_280` decimal(6,3) DEFAULT NULL,
  `a_230` decimal(6,3) DEFAULT NULL,
  `dnaCont` int(3) DEFAULT NULL,
  `RIN` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample_sequencing2`
--

INSERT INTO `sample_sequencing2` (`sample_name`, `seq_id`, `seq_sub_name`, `dna_conc`, `vol`, `wellLoc`, `sampBuffer`, `nano`, `a_280`, `a_230`, `dnaCont`, `RIN`) VALUES
('2016/05/23first-projectA001', '2016-05-23_49cc2_submission', 'FSTPJ001-M-02', '10.000', '100.00', '', 'Tris', NULL, NULL, NULL, NULL, NULL),
('2016/05/23first-projectA001', '2016-05-23_f9f27_submission', 'FSTPJ001-M-01', '10.000', '100.00', '', 'Tris', NULL, NULL, NULL, NULL, NULL),
('2016/05/23first-projectB004', '2016-05-23_49cc2_submission', 'FSTPJ004-M-02', '85.000', '100.00', '', 'Tris', NULL, NULL, NULL, NULL, NULL),
('2016/05/23first-projectB004', '2016-05-23_f9f27_submission', 'FSTPJ004-M-01', '85.000', '100.00', '', 'Tris', NULL, NULL, NULL, NULL, NULL),
('2016/05/24first-projectA002', '2016-05-23_49cc2_submission', 'FSTPJ002-M-02', '50.000', '100.00', '', 'Tris', NULL, NULL, NULL, NULL, NULL),
('2016/05/24first-projectA002', '2016-05-23_f9f27_submission', 'FSTPJ002-M-01', '50.000', '100.00', '', 'Tris', NULL, NULL, NULL, NULL, NULL),
('2016/05/24first-projectB003', '2016-05-23_49cc2_submission', 'FSTPJ003-M-02', '80.000', '100.00', '', 'Tris', NULL, NULL, NULL, NULL, NULL),
('2016/05/24first-projectB003', '2016-05-23_f9f27_submission', 'FSTPJ003-M-01', '80.000', '100.00', '', 'Tris', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sample_type`
--

CREATE TABLE IF NOT EXISTS `sample_type` (
  `sample_type_id` varchar(3) NOT NULL,
  `sample_type_name` varchar(30) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample_type`
--

INSERT INTO `sample_type` (`sample_type_id`, `sample_type_name`, `visible`) VALUES
('A', 'Air', 1),
('B', 'Blank-Sterilization', 1),
('P', 'Pooled', 1),
('S', 'Soil', 1),
('W', 'Water', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sequencing2`
--

CREATE TABLE IF NOT EXISTS `sequencing2` (
  `sequencing_info` varchar(150) NOT NULL,
  `container_type` varchar(15) DEFAULT NULL,
  `date_submitted` date DEFAULT NULL,
  `dna_conc_of_subm` decimal(5,2) DEFAULT NULL,
  `entered_by` varchar(150) DEFAULT NULL,
  `library_prep_kit` varchar(150) DEFAULT NULL,
  `sample_type` varchar(20) DEFAULT NULL,
  `seqOther` varchar(150) DEFAULT NULL,
  `sequencer_name` varchar(150) DEFAULT NULL,
  `sequencing_method` varchar(20) DEFAULT NULL,
  `sequencing_type` varchar(150) DEFAULT NULL,
  `submitted_by` varchar(150) DEFAULT NULL,
  `primerL` varchar(150) DEFAULT NULL,
  `primerR` varchar(150) DEFAULT NULL,
  `quant_method` varchar(10) DEFAULT NULL,
  `read_length` varchar(20) DEFAULT NULL,
  `volume_of_aliquot` float DEFAULT NULL,
  `seq_pool` varchar(3) DEFAULT NULL,
  `amplicon_type` varchar(150) DEFAULT NULL,
  `results_recieved` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sequencing2`
--

INSERT INTO `sequencing2` (`sequencing_info`, `container_type`, `date_submitted`, `dna_conc_of_subm`, `entered_by`, `library_prep_kit`, `sample_type`, `seqOther`, `sequencer_name`, `sequencing_method`, `sequencing_type`, `submitted_by`, `primerL`, `primerR`, `quant_method`, `read_length`, `volume_of_aliquot`, `seq_pool`, `amplicon_type`, `results_recieved`) VALUES
('2016-05-23_49cc2_submission', 'Tube', '2016-05-23', NULL, 'Cassie Heinle', 'Low Input Library Prep Kit', 'Genomic DNA', NULL, NULL, 'Indexed Paired End', 'Metagenome sequencing', 'cheinle@ntu.edu.sg', NULL, NULL, NULL, '100bp (HiSeq)', NULL, 'Yes', NULL, NULL),
('2016-05-23_f9f27_submission', 'Tube', '2016-05-23', NULL, 'Cassie Heinle', 'Low Input Library Prep Kit', 'Genomic DNA', NULL, NULL, 'Indexed Paired End', 'Metagenome sequencing', 'cheinle@ntu.edu.sg', NULL, NULL, NULL, '100bp (HiSeq)', NULL, 'Yes', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sequencing_method`
--

CREATE TABLE IF NOT EXISTS `sequencing_method` (
  `method` varchar(20) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sequencing_method`
--

INSERT INTO `sequencing_method` (`method`, `visible`) VALUES
('Indexed Paired End', 1),
('Indexed Single Read', 1),
('Paired End', 1),
('Single Read', 1);

-- --------------------------------------------------------

--
-- Table structure for table `storage_info`
--

CREATE TABLE IF NOT EXISTS `storage_info` (
  `sample_name` varchar(150) NOT NULL,
  `original` varchar(150) NOT NULL,
  `remaining` varchar(150) DEFAULT NULL,
  `orig_sample_exists` varchar(5) NOT NULL,
  `dna_extr` varchar(150) DEFAULT NULL,
  `DNA_sample_exists` varchar(5) DEFAULT 'two',
  `rna_extr` varchar(150) DEFAULT NULL,
  `RNA_sample_exists` varchar(5) NOT NULL DEFAULT 'two',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storage_info`
--

INSERT INTO `storage_info` (`sample_name`, `original`, `remaining`, `orig_sample_exists`, `dna_extr`, `DNA_sample_exists`, `rna_extr`, `RNA_sample_exists`, `time_stamp`) VALUES
('2016/05/23first-projectA001', '20C,Alice', NULL, 'true', '-80C,F1', 'one', '0,0', 'two', '2016-05-23 03:41:28'),
('2016/05/23first-projectB004', '20C,Alice', NULL, 'true', '-80C,F1', 'one', '0,0', 'two', '2016-05-23 03:45:48'),
('2016/05/24first-projectA002', '20C,Alice', NULL, 'true', '-80C,F1', 'one', '0,0', 'two', '2016-05-23 03:45:16'),
('2016/05/24first-projectB003', '20C,Alice', NULL, 'true', '-80C,F1', 'one', '0,0', 'two', '2016-05-23 03:45:38'),
('2016/06/21second-projectB002', '-80C,F1', NULL, 'false', '0,0', 'two', '0,0', 'two', '2016-05-23 03:47:54'),
('2016/06/21second-projectB004', '-80C,F1', NULL, 'false', '0,0', 'two', '0,0', 'two', '2016-05-23 03:48:58'),
('2016/06/21second-projectB006', '-80C,F1', NULL, 'false', '0,0', 'two', '0,0', 'two', '2016-05-23 03:49:45'),
('2016/06/21second-projectW001', '-80C,F1', NULL, 'false', '0,0', 'two', '0,0', 'two', '2016-05-23 03:47:32'),
('2016/06/21second-projectW003', '-80C,F1', NULL, 'false', '0,0', 'two', '0,0', 'two', '2016-05-23 03:48:29'),
('2016/06/21second-projectW005', '-80C,F1', NULL, 'false', '0,0', 'two', '0,0', 'two', '2016-05-23 03:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `store_user_things`
--

CREATE TABLE IF NOT EXISTS `store_user_things` (
  `sample_name` varchar(150) NOT NULL,
  `thing1` varchar(150) DEFAULT NULL,
  `thing2` varchar(150) DEFAULT NULL,
  `thing3` varchar(150) DEFAULT NULL,
  `thing4` varchar(150) DEFAULT NULL,
  `thing5` varchar(150) DEFAULT NULL,
  `thing6` varchar(150) DEFAULT NULL,
  `thing7` varchar(150) DEFAULT NULL,
  `thing8` varchar(150) DEFAULT NULL,
  `thing9` varchar(150) DEFAULT NULL,
  `thing10` varchar(150) DEFAULT NULL,
  `thing12` decimal(5,2) DEFAULT NULL,
  `thing13` decimal(5,2) DEFAULT NULL,
  `thing14` decimal(5,2) DEFAULT NULL,
  `thing15` decimal(5,2) DEFAULT NULL,
  `thing11` decimal(5,2) DEFAULT NULL,
  `thing16` decimal(5,2) DEFAULT NULL,
  `thing17` decimal(5,2) DEFAULT NULL,
  `thing18` decimal(5,2) DEFAULT NULL,
  `thing19` decimal(5,2) DEFAULT NULL,
  `thing20` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_user_things`
--

INSERT INTO `store_user_things` (`sample_name`, `thing1`, `thing2`, `thing3`, `thing4`, `thing5`, `thing6`, `thing7`, `thing8`, `thing9`, `thing10`, `thing12`, `thing13`, `thing14`, `thing15`, `thing11`, `thing16`, `thing17`, `thing18`, `thing19`, `thing20`) VALUES
('2016/05/23first-projectA001', 'I am a test field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/05/23first-projectB004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/05/24first-projectA002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/05/24first-projectB003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/06/21second-projectB002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/06/21second-projectB004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/06/21second-projectB006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/06/21second-projectW001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/06/21second-projectW003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2016/06/21second-projectW005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_seq_sample`
--

CREATE TABLE IF NOT EXISTS `type_seq_sample` (
  `sample_type` varchar(20) NOT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_seq_sample`
--

INSERT INTO `type_seq_sample` (`sample_type`, `visible`) VALUES
('Amplicon', 1),
('cDNA', 1),
('Genomic DNA', 1),
('Library', 1),
('Purified mRNA', 1),
('Purified small RNA', 1),
('Single-stranded DNA', 1),
('Total RNA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` varchar(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `session_id` varchar(200) NOT NULL,
  `time` float NOT NULL,
  `status` varchar(7) NOT NULL,
  `pkey` varchar(150) NOT NULL,
  `visible` varchar(1) DEFAULT '1',
  `admin` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analysis`
--
ALTER TABLE `analysis`
 ADD PRIMARY KEY (`analysis_name`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
 ADD PRIMARY KEY (`application`);

--
-- Indexes for table `container_type`
--
ALTER TABLE `container_type`
 ADD PRIMARY KEY (`container_type`);

--
-- Indexes for table `create_user_things`
--
ALTER TABLE `create_user_things`
 ADD PRIMARY KEY (`thing_id`);

--
-- Indexes for table `daily_data2`
--
ALTER TABLE `daily_data2`
 ADD PRIMARY KEY (`daily_date`,`location`);

--
-- Indexes for table `daily_data2_particle_counter`
--
ALTER TABLE `daily_data2_particle_counter`
 ADD PRIMARY KEY (`daily_date`,`location`,`part_sens_name`), ADD KEY `part_sens_name` (`part_sens_name`);

--
-- Indexes for table `dna_extraction`
--
ALTER TABLE `dna_extraction`
 ADD PRIMARY KEY (`d_kit_name`);

--
-- Indexes for table `drawer`
--
ALTER TABLE `drawer`
 ADD PRIMARY KEY (`drawer_id`);

--
-- Indexes for table `freezer`
--
ALTER TABLE `freezer`
 ADD PRIMARY KEY (`freezer_id`);

--
-- Indexes for table `freezer_drawer`
--
ALTER TABLE `freezer_drawer`
 ADD PRIMARY KEY (`freezer_id`,`drawer_id`), ADD KEY `drawer_id` (`drawer_id`);

--
-- Indexes for table `library_prep_kit`
--
ALTER TABLE `library_prep_kit`
 ADD PRIMARY KEY (`lib_prep_kit`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
 ADD PRIMARY KEY (`loc_name`);

--
-- Indexes for table `media_type`
--
ALTER TABLE `media_type`
 ADD PRIMARY KEY (`media_type`);

--
-- Indexes for table `number_of_seq_submissions`
--
ALTER TABLE `number_of_seq_submissions`
 ADD PRIMARY KEY (`sample_name`);

--
-- Indexes for table `particle_counter`
--
ALTER TABLE `particle_counter`
 ADD PRIMARY KEY (`part_sens_name`);

--
-- Indexes for table `pooled_sample_lookup`
--
ALTER TABLE `pooled_sample_lookup`
 ADD PRIMARY KEY (`new_pooled_samp_name`,`orig_sample_name`), ADD KEY `orig_sample_name` (`orig_sample_name`);

--
-- Indexes for table `project_name`
--
ALTER TABLE `project_name`
 ADD PRIMARY KEY (`project_name`);

--
-- Indexes for table `quantitation_method`
--
ALTER TABLE `quantitation_method`
 ADD PRIMARY KEY (`quant_method`);

--
-- Indexes for table `quant_instruments`
--
ALTER TABLE `quant_instruments`
 ADD PRIMARY KEY (`kit_name`);

--
-- Indexes for table `read_length`
--
ALTER TABLE `read_length`
 ADD PRIMARY KEY (`read_length`);

--
-- Indexes for table `read_submission`
--
ALTER TABLE `read_submission`
 ADD PRIMARY KEY (`sample_name`,`subm_id`), ADD KEY `subm_db` (`subm_db`), ADD KEY `type_exp` (`type_exp`);

--
-- Indexes for table `read_subm_database`
--
ALTER TABLE `read_subm_database`
 ADD PRIMARY KEY (`database_name`);

--
-- Indexes for table `read_subm_exp_types`
--
ALTER TABLE `read_subm_exp_types`
 ADD PRIMARY KEY (`exp_types`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
 ADD PRIMARY KEY (`records`);

--
-- Indexes for table `relt_location`
--
ALTER TABLE `relt_location`
 ADD PRIMARY KEY (`loc_name`);

--
-- Indexes for table `rna_extraction`
--
ALTER TABLE `rna_extraction`
 ADD PRIMARY KEY (`r_kit_name`);

--
-- Indexes for table `sample`
--
ALTER TABLE `sample`
 ADD PRIMARY KEY (`sample_name`), ADD KEY `analysis_name` (`analysis_name`), ADD KEY `media_type` (`media_type`), ADD KEY `location_name` (`location_name`), ADD KEY `relt_loc_name` (`relt_loc_name`), ADD KEY `project_name` (`project_name`), ADD KEY `sample_type` (`sample_type`), ADD KEY `d_volume_quant` (`d_volume_quant`), ADD KEY `dna_extract_kit_name` (`dna_extract_kit_name`), ADD KEY `d_conc_instrument` (`d_conc_instrument`), ADD KEY `r_conc_instrument` (`r_conc_instrument`), ADD KEY `rna_extract_kit_name` (`rna_extract_kit_name`), ADD KEY `d_conc_instrument_2` (`d_conc_instrument`), ADD KEY `dna_extract_kit_name_2` (`dna_extract_kit_name`), ADD KEY `r_conc_instrument_2` (`r_conc_instrument`), ADD KEY `rna_extract_kit_name_2` (`rna_extract_kit_name`);

--
-- Indexes for table `sampler`
--
ALTER TABLE `sampler`
 ADD PRIMARY KEY (`sampler_name`);

--
-- Indexes for table `sample_sampler`
--
ALTER TABLE `sample_sampler`
 ADD PRIMARY KEY (`sample_name`,`sampler_name`), ADD KEY `sampler_name` (`sampler_name`);

--
-- Indexes for table `sample_sequencing2`
--
ALTER TABLE `sample_sequencing2`
 ADD PRIMARY KEY (`sample_name`,`seq_id`), ADD KEY `seq_id` (`seq_id`);

--
-- Indexes for table `sample_type`
--
ALTER TABLE `sample_type`
 ADD PRIMARY KEY (`sample_type_id`);

--
-- Indexes for table `sequencing2`
--
ALTER TABLE `sequencing2`
 ADD PRIMARY KEY (`sequencing_info`), ADD KEY `container_type` (`container_type`), ADD KEY `library_prep_kit` (`library_prep_kit`), ADD KEY `sample_type` (`sample_type`), ADD KEY `sequencer_name` (`sequencer_name`), ADD KEY `sequencing_method` (`sequencing_method`), ADD KEY `quant_method` (`quant_method`), ADD KEY `read_length` (`read_length`), ADD KEY `sequencing_type` (`sequencing_type`);

--
-- Indexes for table `sequencing_method`
--
ALTER TABLE `sequencing_method`
 ADD PRIMARY KEY (`method`);

--
-- Indexes for table `storage_info`
--
ALTER TABLE `storage_info`
 ADD PRIMARY KEY (`sample_name`);

--
-- Indexes for table `store_user_things`
--
ALTER TABLE `store_user_things`
 ADD PRIMARY KEY (`sample_name`);

--
-- Indexes for table `type_seq_sample`
--
ALTER TABLE `type_seq_sample`
 ADD PRIMARY KEY (`sample_type`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daily_data2_particle_counter`
--
ALTER TABLE `daily_data2_particle_counter`
ADD CONSTRAINT `daily_data2_particle_counter_ibfk_1` FOREIGN KEY (`daily_date`) REFERENCES `daily_data2` (`daily_date`) ON UPDATE CASCADE,
ADD CONSTRAINT `daily_data2_particle_counter_ibfk_2` FOREIGN KEY (`part_sens_name`) REFERENCES `particle_counter` (`part_sens_name`);

--
-- Constraints for table `freezer_drawer`
--
ALTER TABLE `freezer_drawer`
ADD CONSTRAINT `freezer_drawer_ibfk_1` FOREIGN KEY (`freezer_id`) REFERENCES `freezer` (`freezer_id`) ON UPDATE CASCADE,
ADD CONSTRAINT `freezer_drawer_ibfk_2` FOREIGN KEY (`drawer_id`) REFERENCES `drawer` (`drawer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `number_of_seq_submissions`
--
ALTER TABLE `number_of_seq_submissions`
ADD CONSTRAINT `number_of_seq_submissions_ibfk_1` FOREIGN KEY (`sample_name`) REFERENCES `sample` (`sample_name`) ON UPDATE CASCADE;

--
-- Constraints for table `pooled_sample_lookup`
--
ALTER TABLE `pooled_sample_lookup`
ADD CONSTRAINT `pooled_sample_lookup_ibfk_1` FOREIGN KEY (`new_pooled_samp_name`) REFERENCES `sample` (`sample_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `pooled_sample_lookup_ibfk_2` FOREIGN KEY (`orig_sample_name`) REFERENCES `sample` (`sample_name`) ON UPDATE CASCADE;

--
-- Constraints for table `read_submission`
--
ALTER TABLE `read_submission`
ADD CONSTRAINT `read_submission_ibfk_1` FOREIGN KEY (`type_exp`) REFERENCES `read_subm_exp_types` (`exp_types`) ON UPDATE CASCADE,
ADD CONSTRAINT `read_submission_ibfk_2` FOREIGN KEY (`subm_db`) REFERENCES `read_subm_database` (`database_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `read_submission_ibfk_3` FOREIGN KEY (`sample_name`) REFERENCES `sample` (`sample_name`) ON UPDATE CASCADE;

--
-- Constraints for table `sample`
--
ALTER TABLE `sample`
ADD CONSTRAINT `sample_ibfk_1` FOREIGN KEY (`analysis_name`) REFERENCES `analysis` (`analysis_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_10` FOREIGN KEY (`r_conc_instrument`) REFERENCES `quant_instruments` (`kit_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_11` FOREIGN KEY (`rna_extract_kit_name`) REFERENCES `rna_extraction` (`r_kit_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_3` FOREIGN KEY (`media_type`) REFERENCES `media_type` (`media_type`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_4` FOREIGN KEY (`location_name`) REFERENCES `location` (`loc_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_5` FOREIGN KEY (`relt_loc_name`) REFERENCES `relt_location` (`loc_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_6` FOREIGN KEY (`project_name`) REFERENCES `project_name` (`project_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_7` FOREIGN KEY (`sample_type`) REFERENCES `sample_type` (`sample_type_id`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_8` FOREIGN KEY (`d_conc_instrument`) REFERENCES `quant_instruments` (`kit_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_ibfk_9` FOREIGN KEY (`dna_extract_kit_name`) REFERENCES `dna_extraction` (`d_kit_name`) ON UPDATE CASCADE;

--
-- Constraints for table `sample_sampler`
--
ALTER TABLE `sample_sampler`
ADD CONSTRAINT `sample_sampler_ibfk_1` FOREIGN KEY (`sampler_name`) REFERENCES `sampler` (`sampler_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_sampler_ibfk_2` FOREIGN KEY (`sample_name`) REFERENCES `sample` (`sample_name`) ON UPDATE CASCADE;

--
-- Constraints for table `sample_sequencing2`
--
ALTER TABLE `sample_sequencing2`
ADD CONSTRAINT `sample_sequencing2_ibfk_1` FOREIGN KEY (`sample_name`) REFERENCES `sample` (`sample_name`) ON UPDATE CASCADE,
ADD CONSTRAINT `sample_sequencing2_ibfk_2` FOREIGN KEY (`seq_id`) REFERENCES `sequencing2` (`sequencing_info`) ON UPDATE CASCADE;

--
-- Constraints for table `sequencing2`
--
ALTER TABLE `sequencing2`
ADD CONSTRAINT `sequencing2_ibfk_1` FOREIGN KEY (`container_type`) REFERENCES `container_type` (`container_type`) ON UPDATE CASCADE,
ADD CONSTRAINT `sequencing2_ibfk_2` FOREIGN KEY (`sample_type`) REFERENCES `type_seq_sample` (`sample_type`) ON DELETE CASCADE,
ADD CONSTRAINT `sequencing2_ibfk_3` FOREIGN KEY (`library_prep_kit`) REFERENCES `library_prep_kit` (`lib_prep_kit`),
ADD CONSTRAINT `sequencing2_ibfk_4` FOREIGN KEY (`sequencing_method`) REFERENCES `sequencing_method` (`method`) ON UPDATE CASCADE,
ADD CONSTRAINT `sequencing2_ibfk_5` FOREIGN KEY (`quant_method`) REFERENCES `quantitation_method` (`quant_method`) ON UPDATE CASCADE,
ADD CONSTRAINT `sequencing2_ibfk_6` FOREIGN KEY (`read_length`) REFERENCES `read_length` (`read_length`) ON UPDATE CASCADE,
ADD CONSTRAINT `sequencing2_ibfk_7` FOREIGN KEY (`sequencing_type`) REFERENCES `application` (`application`) ON UPDATE CASCADE;

--
-- Constraints for table `storage_info`
--
ALTER TABLE `storage_info`
ADD CONSTRAINT `storage_info_ibfk_1` FOREIGN KEY (`sample_name`) REFERENCES `sample` (`sample_name`) ON UPDATE CASCADE;

--
-- Constraints for table `store_user_things`
--
ALTER TABLE `store_user_things`
ADD CONSTRAINT `store_user_things_ibfk_1` FOREIGN KEY (`sample_name`) REFERENCES `sample` (`sample_name`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE USER 'nanolims'@'localhost' IDENTIFIED BY '1231234';
GRANT INSERT ON nanolims_demo.* TO 'nanolims'@'localhost';
GRANT SELECT ON nanolims_demo.* TO 'nanolims'@'localhost';
GRANT UPDATE ON nanolims_demo.* TO 'nanolims'@'localhost';
GRANT DELETE ON nanolims_demo.* TO 'nanolims'@'localhost';
FLUSH PRIVILEGES;

