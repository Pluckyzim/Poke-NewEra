-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 19/08/2020 às 18:01
-- Versão do servidor: 5.7.30-0ubuntu0.16.04.1
-- Versão do PHP: 7.0.33-0ubuntu0.16.04.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `data2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(100) DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `soulcoins` int(11) DEFAULT '0',
  `display_name` varchar(50) DEFAULT NULL,
  `referral` int(11) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `referral_points` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `lang_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `client_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `key_count` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `accounts`
--
DELIMITER $$
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN DELETE FROM `bans` WHERE `type` NOT IN(1, 2) AND `value` = OLD.`id`; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_storage`
--

CREATE TABLE `account_storage` (
  `account_id` int(11) NOT NULL,
  `key` int(11) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ball_counter`
--

CREATE TABLE `ball_counter` (
  `player_id` int(10) UNSIGNED NOT NULL,
  `pokemon_id` smallint(5) UNSIGNED NOT NULL,
  `poke` mediumint(8) UNSIGNED DEFAULT '0',
  `great` mediumint(8) UNSIGNED DEFAULT '0',
  `ultra` mediumint(8) UNSIGNED DEFAULT '0',
  `safari` mediumint(8) UNSIGNED DEFAULT '0',
  `coloured` mediumint(8) UNSIGNED DEFAULT '0',
  `avalanche` mediumint(8) UNSIGNED DEFAULT '0',
  `blaze` mediumint(8) UNSIGNED DEFAULT '0',
  `gaia` mediumint(8) UNSIGNED DEFAULT '0',
  `heremit` mediumint(8) UNSIGNED DEFAULT '0',
  `hurricane` mediumint(8) UNSIGNED DEFAULT '0',
  `spectrum` mediumint(8) UNSIGNED DEFAULT '0',
  `vital` mediumint(8) UNSIGNED DEFAULT '0',
  `voltagic` mediumint(8) UNSIGNED DEFAULT '0',
  `zen` mediumint(8) UNSIGNED DEFAULT '0',
  `white easter` mediumint(8) UNSIGNED DEFAULT '0',
  `christmas` mediumint(8) UNSIGNED DEFAULT '0',
  `enchanted` mediumint(8) UNSIGNED DEFAULT '0',
  `dive` mediumint(8) UNSIGNED DEFAULT '0',
  `dusk` mediumint(8) UNSIGNED DEFAULT '0',
  `heal` mediumint(8) UNSIGNED DEFAULT '0',
  `luxury` mediumint(8) UNSIGNED DEFAULT '0',
  `nest` mediumint(8) UNSIGNED DEFAULT '0',
  `net` mediumint(8) UNSIGNED DEFAULT '0',
  `premier` mediumint(8) UNSIGNED DEFAULT '0',
  `quick` mediumint(8) UNSIGNED DEFAULT '0',
  `repeat` mediumint(8) UNSIGNED DEFAULT '0',
  `timer` mediumint(8) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ball_pillars`
--

CREATE TABLE `ball_pillars` (
  `world_id` tinyint(4) NOT NULL DEFAULT '0',
  `positionx` mediumint(10) NOT NULL,
  `positiony` mediumint(10) NOT NULL,
  `positionz` tinyint(10) NOT NULL,
  `attributes` blob NOT NULL,
  `ball_id` smallint(5) UNSIGNED NOT NULL,
  `creature_name` varchar(100) NOT NULL,
  `creature_sex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) UNSIGNED NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `berry_trees`
--

CREATE TABLE `berry_trees` (
  `world_id` tinyint(4) NOT NULL DEFAULT '0',
  `positionx` mediumint(10) NOT NULL,
  `positiony` mediumint(10) NOT NULL,
  `positionz` tinyint(10) NOT NULL,
  `itemid` int(10) NOT NULL,
  `growdate` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text,
  `body` longtext,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `in_rss` tinyint(1) NOT NULL DEFAULT '1',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `love_count` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `image_thumb` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_post_categories`
--

CREATE TABLE `blog_post_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `rss_channel_title` varchar(255) DEFAULT NULL,
  `rss_channel_description` text,
  `blog_post_count` int(11) NOT NULL DEFAULT '0',
  `under_blog_post_count` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_post_categories_blog_posts`
--

CREATE TABLE `blog_post_categories_blog_posts` (
  `blog_post_category_id` int(11) NOT NULL,
  `blog_post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_post_comments`
--

CREATE TABLE `blog_post_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_post_loves`
--

CREATE TABLE `blog_post_loves` (
  `blog_post_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `change_emails`
--

CREATE TABLE `change_emails` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `old_email` varchar(500) NOT NULL,
  `new_email` varchar(500) NOT NULL,
  `date` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` bigint(20) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `reward` int(10) UNSIGNED NOT NULL,
  `expires` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coupon_uses`
--

CREATE TABLE `coupon_uses` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `date` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_admin_commands`
--

CREATE TABLE `datalog_admin_commands` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `command_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_anniversary_drops`
--

CREATE TABLE `datalog_anniversary_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_bank_transactions`
--

CREATE TABLE `datalog_bank_transactions` (
  `action_id` tinyint(3) UNSIGNED NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_boss_rewards`
--

CREATE TABLE `datalog_boss_rewards` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_boss_spawns`
--

CREATE TABLE `datalog_boss_spawns` (
  `world_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(500) NOT NULL,
  `posx` mediumint(8) UNSIGNED NOT NULL,
  `posy` mediumint(8) UNSIGNED NOT NULL,
  `posz` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_casino_token_bought`
--

CREATE TABLE `datalog_casino_token_bought` (
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `tokens` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_caughts`
--

CREATE TABLE `datalog_caughts` (
  `player_id` int(11) NOT NULL,
  `pokemon_number` smallint(5) UNSIGNED NOT NULL,
  `tries` mediumint(8) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_christmas_drops`
--

CREATE TABLE `datalog_christmas_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_coin_uses`
--

CREATE TABLE `datalog_coin_uses` (
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `use` tinyint(3) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_colosseum_arena`
--

CREATE TABLE `datalog_colosseum_arena` (
  `account_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_delivery_packages`
--

CREATE TABLE `datalog_delivery_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_duel_bet`
--

CREATE TABLE `datalog_duel_bet` (
  `leader_a` int(11) NOT NULL,
  `leader_b` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `amount` mediumint(9) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_easter_drops`
--

CREATE TABLE `datalog_easter_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_egg_generate`
--

CREATE TABLE `datalog_egg_generate` (
  `player_id` int(11) NOT NULL,
  `egg` varchar(100) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `tries` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_egg_move_generate`
--

CREATE TABLE `datalog_egg_move_generate` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `pokemon_name` varchar(255) NOT NULL,
  `pokemon_level` smallint(6) NOT NULL,
  `pokemon_extrapoints` smallint(6) NOT NULL,
  `egg_move` varchar(255) NOT NULL,
  `from_egg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_egg_move_regenerate`
--

CREATE TABLE `datalog_egg_move_regenerate` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `pokemon_name` varchar(255) NOT NULL,
  `pokemon_level` smallint(6) NOT NULL,
  `pokemon_extrapoints` smallint(6) NOT NULL,
  `egg_move` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_halloween_drops`
--

CREATE TABLE `datalog_halloween_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_julyvacation_drops`
--

CREATE TABLE `datalog_julyvacation_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_logins`
--

CREATE TABLE `datalog_logins` (
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_map_items`
--

CREATE TABLE `datalog_map_items` (
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `date` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_mastery_token_bought`
--

CREATE TABLE `datalog_mastery_token_bought` (
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `tokens` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_online`
--

CREATE TABLE `datalog_online` (
  `world_id` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `online` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_player_items`
--

CREATE TABLE `datalog_player_items` (
  `player_id` int(10) UNSIGNED NOT NULL,
  `on_logout_count` int(10) UNSIGNED DEFAULT NULL,
  `on_logout_date` bigint(20) UNSIGNED DEFAULT NULL,
  `on_login_count` int(11) DEFAULT NULL,
  `on_login_date` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_player_ups`
--

CREATE TABLE `datalog_player_ups` (
  `player_id` int(11) NOT NULL,
  `from_level` smallint(5) UNSIGNED NOT NULL,
  `to_level` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `posx` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `posy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `posz` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_pokemon_market`
--

CREATE TABLE `datalog_pokemon_market` (
  `seller` int(11) NOT NULL DEFAULT '0',
  `buyer` int(11) NOT NULL DEFAULT '0',
  `date` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `ball_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `value` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_pokemon_ups`
--

CREATE TABLE `datalog_pokemon_ups` (
  `player_id` int(11) NOT NULL,
  `pokemon_number` smallint(5) UNSIGNED NOT NULL,
  `from_level` smallint(5) UNSIGNED NOT NULL,
  `to_level` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `posx` int(10) NOT NULL DEFAULT '0',
  `posy` int(10) NOT NULL DEFAULT '0',
  `posz` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_poketrader_boughts`
--

CREATE TABLE `datalog_poketrader_boughts` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_poke_nick_change`
--

CREATE TABLE `datalog_poke_nick_change` (
  `player_id` int(11) NOT NULL,
  `old_nickname` varchar(100) DEFAULT NULL,
  `new_nickname` varchar(100) DEFAULT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_rangerclub_boss`
--

CREATE TABLE `datalog_rangerclub_boss` (
  `player_id` int(11) NOT NULL,
  `boss_id` mediumint(9) NOT NULL,
  `date` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_rangerclub_boss_rewards`
--

CREATE TABLE `datalog_rangerclub_boss_rewards` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_rangerclub_task`
--

CREATE TABLE `datalog_rangerclub_task` (
  `player_id` int(11) NOT NULL,
  `task_id` mediumint(9) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_referral_exchange`
--

CREATE TABLE `datalog_referral_exchange` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_slot_machine`
--

CREATE TABLE `datalog_slot_machine` (
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `gain` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_surprise_box`
--

CREATE TABLE `datalog_surprise_box` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `datalog_token_bought`
--

CREATE TABLE `datalog_token_bought` (
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `use` tinyint(3) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `daycare_female`
--

CREATE TABLE `daycare_female` (
  `id` int(10) NOT NULL,
  `player_id` int(11) DEFAULT '0',
  `date` bigint(20) UNSIGNED DEFAULT NULL,
  `pokemon_name` varchar(100) DEFAULT NULL,
  `pokemon_level` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_experience` int(10) UNSIGNED DEFAULT '0',
  `pokemon_energy` mediumint(8) UNSIGNED DEFAULT '0',
  `pokemon_maxenergy` mediumint(8) UNSIGNED DEFAULT '0',
  `pokemon_nickname` varchar(100) DEFAULT NULL,
  `pokemon_sex` tinyint(3) UNSIGNED DEFAULT '0',
  `pokemon_extrapoints` smallint(5) UNSIGNED DEFAULT '0',
  `ball_id` smallint(5) UNSIGNED DEFAULT '12159',
  `max_training_minutes` int(10) UNSIGNED DEFAULT '2880',
  `pokemon_specialability` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_tm1` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_tm1_slot` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_tm2` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_tm2_slot` smallint(5) UNSIGNED DEFAULT '0',
  `ball_seal` smallint(5) UNSIGNED DEFAULT '0',
  `attributes` blob
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `daycare_male`
--

CREATE TABLE `daycare_male` (
  `id` int(10) NOT NULL,
  `player_id` int(11) DEFAULT '0',
  `date` bigint(20) UNSIGNED DEFAULT NULL,
  `pokemon_name` varchar(100) DEFAULT NULL,
  `pokemon_level` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_experience` int(10) UNSIGNED DEFAULT '0',
  `pokemon_energy` mediumint(8) UNSIGNED DEFAULT '0',
  `pokemon_maxenergy` mediumint(8) UNSIGNED DEFAULT '0',
  `pokemon_nickname` varchar(100) DEFAULT NULL,
  `pokemon_sex` tinyint(3) UNSIGNED DEFAULT '0',
  `pokemon_extrapoints` smallint(5) UNSIGNED DEFAULT '0',
  `ball_id` smallint(5) UNSIGNED DEFAULT '12159',
  `max_training_minutes` int(10) UNSIGNED DEFAULT '2880',
  `pokemon_specialability` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_tm1` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_tm1_slot` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_tm2` smallint(5) UNSIGNED DEFAULT '0',
  `pokemon_tm2_slot` smallint(5) UNSIGNED DEFAULT '0',
  `ball_seal` smallint(5) UNSIGNED DEFAULT '0',
  `attributes` blob
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `daycare_plates`
--

CREATE TABLE `daycare_plates` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `delete_players`
--

CREATE TABLE `delete_players` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `donates`
--

CREATE TABLE `donates` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `value` decimal(10,0) NOT NULL DEFAULT '0',
  `ref` varchar(500) NOT NULL DEFAULT '0',
  `date` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `egg_counter`
--

CREATE TABLE `egg_counter` (
  `player_id` int(10) UNSIGNED NOT NULL,
  `pokemon_id` smallint(5) UNSIGNED NOT NULL,
  `tries` mediumint(8) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `elite_four_champions`
--

CREATE TABLE `elite_four_champions` (
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `lookbody` smallint(5) UNSIGNED NOT NULL,
  `lookfeet` smallint(5) UNSIGNED NOT NULL,
  `lookhead` smallint(5) UNSIGNED NOT NULL,
  `looklegs` smallint(5) UNSIGNED NOT NULL,
  `looktype` smallint(5) UNSIGNED NOT NULL,
  `lookaddons` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='lookbody\r\nlookfeet\r\nlookhead\r\nlooklegs\r\nlooktype\r\nlookaddons';

-- --------------------------------------------------------

--
-- Estrutura para tabela `elite_four_champion_pokemons`
--

CREATE TABLE `elite_four_champion_pokemons` (
  `player_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `sex` tinyint(3) UNSIGNED NOT NULL,
  `extra_points` tinyint(3) UNSIGNED NOT NULL,
  `special_ability` smallint(5) UNSIGNED NOT NULL,
  `moveset` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `environment_killers`
--

CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '0',
  `description` text,
  `love_count` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`); INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`); INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`); END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
	
	DELETE FROM `guild_ranks` WHERE `guild_ranks`.`guild_id` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_loves`
--

CREATE TABLE `guild_loves` (
  `guild_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `doors` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `beds` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tiles` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `guild` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `clear` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_auctions`
--

CREATE TABLE `house_auctions` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `limit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `endtime` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_data`
--

CREATE TABLE `house_data` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `instant_payment_notifications`
--

CREATE TABLE `instant_payment_notifications` (
  `id` char(36) NOT NULL,
  `notify_version` varchar(64) DEFAULT NULL,
  `verify_sign` varchar(127) DEFAULT NULL,
  `test_ipn` int(11) DEFAULT NULL,
  `address_city` varchar(40) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_country_code` varchar(2) DEFAULT NULL,
  `address_name` varchar(128) DEFAULT NULL,
  `address_state` varchar(40) DEFAULT NULL,
  `address_status` varchar(20) DEFAULT NULL,
  `address_street` varchar(200) DEFAULT NULL,
  `address_zip` varchar(20) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `payer_business_name` varchar(127) DEFAULT NULL,
  `payer_email` varchar(127) DEFAULT NULL,
  `payer_id` varchar(13) DEFAULT NULL,
  `payer_status` varchar(20) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `residence_country` varchar(2) DEFAULT NULL,
  `business` varchar(127) DEFAULT NULL,
  `item_name` varchar(127) DEFAULT NULL,
  `item_number` varchar(127) DEFAULT NULL,
  `quantity` varchar(127) DEFAULT NULL,
  `receiver_email` varchar(127) DEFAULT NULL,
  `receiver_id` varchar(13) DEFAULT NULL,
  `custom` varchar(255) DEFAULT NULL,
  `invoice` varchar(127) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `option_name1` varchar(64) DEFAULT NULL,
  `option_name2` varchar(64) DEFAULT NULL,
  `option_selection1` varchar(200) DEFAULT NULL,
  `option_selection2` varchar(200) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `auth_id` varchar(19) DEFAULT NULL,
  `auth_exp` varchar(28) DEFAULT NULL,
  `auth_amount` int(11) DEFAULT NULL,
  `auth_status` varchar(20) DEFAULT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `parent_txn_id` varchar(19) DEFAULT NULL,
  `payment_date` varchar(28) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL,
  `pending_reason` varchar(20) DEFAULT NULL,
  `reason_code` varchar(20) DEFAULT NULL,
  `remaining_settle` int(11) DEFAULT NULL,
  `shipping_method` varchar(64) DEFAULT NULL,
  `shipping` decimal(10,2) DEFAULT NULL,
  `transaction_entity` varchar(20) DEFAULT NULL,
  `txn_id` varchar(19) DEFAULT NULL,
  `txn_type` varchar(20) DEFAULT NULL,
  `exchange_rate` decimal(10,2) DEFAULT NULL,
  `mc_currency` varchar(3) DEFAULT NULL,
  `mc_fee` decimal(10,2) DEFAULT NULL,
  `mc_gross` decimal(10,2) DEFAULT NULL,
  `mc_handling` decimal(10,2) DEFAULT NULL,
  `mc_shipping` decimal(10,2) DEFAULT NULL,
  `payment_fee` decimal(10,2) DEFAULT NULL,
  `payment_gross` decimal(10,2) DEFAULT NULL,
  `settle_amount` decimal(10,2) DEFAULT NULL,
  `settle_currency` varchar(3) DEFAULT NULL,
  `auction_buyer_id` varchar(64) DEFAULT NULL,
  `auction_closing_date` varchar(28) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` varchar(10) DEFAULT NULL,
  `subscr_date` varchar(28) DEFAULT NULL,
  `subscr_effective` varchar(28) DEFAULT NULL,
  `period1` varchar(10) DEFAULT NULL,
  `period2` varchar(10) DEFAULT NULL,
  `period3` varchar(10) DEFAULT NULL,
  `amount1` decimal(10,2) DEFAULT NULL,
  `amount2` decimal(10,2) DEFAULT NULL,
  `amount3` decimal(10,2) DEFAULT NULL,
  `mc_amount1` decimal(10,2) DEFAULT NULL,
  `mc_amount2` decimal(10,2) DEFAULT NULL,
  `mc_amount3` decimal(10,2) DEFAULT NULL,
  `recurring` varchar(1) DEFAULT NULL,
  `reattempt` varchar(1) DEFAULT NULL,
  `retry_at` varchar(28) DEFAULT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(24) DEFAULT NULL,
  `subscr_id` varchar(19) DEFAULT NULL,
  `case_id` varchar(28) DEFAULT NULL,
  `case_type` varchar(28) DEFAULT NULL,
  `case_creation_date` varchar(28) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `killers`
--

CREATE TABLE `killers` (
  `id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `loyalty_ranks`
--

CREATE TABLE `loyalty_ranks` (
  `id` int(10) UNSIGNED NOT NULL,
  `required_points` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_historic`
--

CREATE TABLE `market_historic` (
  `player_id` int(11) DEFAULT NULL,
  `historic` varchar(5000) NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_items`
--

CREATE TABLE `market_items` (
  `item_code` varchar(255) NOT NULL,
  `playerseller_id` int(11) NOT NULL,
  `playerseller_name` varchar(255) NOT NULL,
  `itemid` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `attributes` blob NOT NULL,
  `world_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `parcels`
--

CREATE TABLE `parcels` (
  `id` int(10) NOT NULL,
  `from_player_id` int(10) UNSIGNED DEFAULT '0',
  `to_player_id` int(10) UNSIGNED DEFAULT '0',
  `date` bigint(20) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_requests`
--

CREATE TABLE `password_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `token` varchar(30) NOT NULL,
  `expires` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paypal_items`
--

CREATE TABLE `paypal_items` (
  `id` varchar(36) NOT NULL,
  `instant_payment_notification_id` varchar(36) NOT NULL,
  `item_name` varchar(127) DEFAULT NULL,
  `item_number` varchar(127) DEFAULT NULL,
  `quantity` varchar(127) DEFAULT NULL,
  `mc_gross` float(10,2) DEFAULT NULL,
  `mc_shipping` float(10,2) DEFAULT NULL,
  `mc_handling` float(10,2) DEFAULT NULL,
  `tax` float(10,2) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` int(11) NOT NULL DEFAULT '151200000',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(1000) DEFAULT 'None',
  `lasteggtime` bigint(20) UNSIGNED DEFAULT '0',
  `pvparenafrags` int(10) UNSIGNED DEFAULT '0',
  `pvparenadeaths` int(10) UNSIGNED DEFAULT '0',
  `firstpokemon` tinyint(10) DEFAULT '-1',
  `tournament_score` int(10) UNSIGNED DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `tournament_weekly_score` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `players`
--
DELIMITER $$
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players` FOR EACH ROW BEGIN
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 0);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 0);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 0);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 0);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 0);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 0);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 0);

	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 1, 101, 13206, 1);
			INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 4, 104, 13453, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 5, 105, 12280, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 6, 106, 12281, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 7, 107, 12853, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 10, 108, 13499, 1);
	
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 104, 109, 13805, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 104, 110, 13805, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 104, 111, 13805, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 104, 112, 13805, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 104, 113, 13805, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 104, 114, 13805, 1);
	
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 105, 115, 12214, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 105, 116, 12216, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 105, 117, 12218, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 105, 118, 12220, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 105, 119, 12222, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 105, 120, 12224, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 105, 121, 12226, 1);
	INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`) VALUES (NEW.`id`, 105, 122, 12228, 1);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` = 2 AND `value` = OLD.`id`;
	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
	DELETE FROM `ball_counter` WHERE `ball_counter`.`player_id` = OLD.`id`;
	DELETE FROM `datalog_caughts` WHERE `datalog_caughts`.`player_id` = OLD.`id`;
	DELETE FROM `datalog_coin_uses` WHERE `datalog_coin_uses`.`player_id` = OLD.`id`;
	DELETE FROM `datalog_egg_generate` WHERE `datalog_egg_generate`.`player_id` = OLD.`id`;
	DELETE FROM `datalog_poke_nick_change` WHERE `datalog_poke_nick_change`.`player_id` = OLD.`id`;
	DELETE FROM `daycare_female` WHERE `daycare_female`.`player_id` = OLD.`id`;
	DELETE FROM `daycare_male` WHERE `daycare_male`.`player_id` = OLD.`id`;
	DELETE FROM `parcels` WHERE `parcels`.`from_player_id` = OLD.`id`;
	DELETE FROM `player_achievements` WHERE `player_achievements`.`player_id` = OLD.`id`;
	DELETE FROM `player_depotitems` WHERE `player_depotitems`.`player_id` = OLD.`id`;
	DELETE FROM `player_highscores` WHERE `player_highscores`.`player_id` = OLD.`id`;
	DELETE FROM `player_namelocks` WHERE `player_namelocks`.`player_id` = OLD.`id`;
	DELETE FROM `player_skills` WHERE `player_skills`.`player_id` = OLD.`id`;
	DELETE FROM `player_statistics` WHERE `player_statistics`.`player_id` = OLD.`id`;
	DELETE FROM `player_storage` WHERE `player_storage`.`player_id` = OLD.`id`;
	DELETE FROM `tournament_bans` WHERE `tournament_bans`.`player_id` = OLD.`id`;
	DELETE FROM `player_items` WHERE `player_items`.`player_id` = OLD.`id`;
	DELETE FROM `player_depotitems` WHERE `player_depotitems`.`player_id` = OLD.`id`;
	DELETE FROM `player_storage` WHERE `player_storage`.`player_id` = OLD.`id`;
	DELETE FROM `player_skills` WHERE `player_skills`.`player_id` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_achievements`
--

CREATE TABLE `player_achievements` (
  `player_id` int(11) NOT NULL,
  `key` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_highscores`
--

CREATE TABLE `player_highscores` (
  `player_id` int(11) NOT NULL,
  `score_id` mediumint(8) UNSIGNED NOT NULL,
  `value` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_killers`
--

CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_pokemon`
--

CREATE TABLE `player_pokemon` (
  `player_id` int(11) NOT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL,
  `pokemon_number` smallint(5) UNSIGNED NOT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_skills`
--

CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_statistics`
--

CREATE TABLE `player_statistics` (
  `player_id` int(11) NOT NULL,
  `key` mediumint(8) UNSIGNED NOT NULL,
  `value` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `player_viplist`
--

CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pokemon_market`
--

CREATE TABLE `pokemon_market` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL DEFAULT '0',
  `date` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `pokemon_name` varchar(100) NOT NULL DEFAULT '0',
  `pokemon_level` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `pokemon_extrapoints` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `pokemon_sex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `pokemon_specialability` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ball_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pokemon_eggmove` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `poketrader_bids`
--

CREATE TABLE `poketrader_bids` (
  `player_id` int(11) NOT NULL,
  `offert_id` int(10) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `poketrader_offerts`
--

CREATE TABLE `poketrader_offerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `min_bid` int(10) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `deadline` bigint(20) UNSIGNED NOT NULL,
  `world_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `polls`
--

CREATE TABLE `polls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `question` tinytext NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deadline` datetime NOT NULL,
  `text_mode` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `poll_options`
--

CREATE TABLE `poll_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `poll_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `poll_texts`
--

CREATE TABLE `poll_texts` (
  `poll_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `poll_votes`
--

CREATE TABLE `poll_votes` (
  `poll_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `poll_option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rank_caught_species`
--

CREATE TABLE `rank_caught_species` (
  `player_id` int(11) NOT NULL,
  `value` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rank_generals`
--

CREATE TABLE `rank_generals` (
  `player_id` int(11) NOT NULL,
  `value` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rank_pvps`
--

CREATE TABLE `rank_pvps` (
  `player_id` int(11) NOT NULL,
  `value` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `referral_friends`
--

CREATE TABLE `referral_friends` (
  `account_referral` int(11) NOT NULL,
  `account_friend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servers`
--

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `world_id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_motd`
--

CREATE TABLE `server_motd` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_record`
--

CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `server_reports`
--

CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `account_id` mediumint(11) NOT NULL,
  `open` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ticket_categories`
--

CREATE TABLE `ticket_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `from_user` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tiles`
--

CREATE TABLE `tiles` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `house_id` int(10) UNSIGNED NOT NULL,
  `x` int(5) UNSIGNED NOT NULL,
  `y` int(5) UNSIGNED NOT NULL,
  `z` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tile_items`
--

CREATE TABLE `tile_items` (
  `tile_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournaments`
--

CREATE TABLE `tournaments` (
  `id` int(10) NOT NULL,
  `last_winner` int(11) NOT NULL DEFAULT '0',
  `last_date` bigint(20) NOT NULL DEFAULT '0',
  `number` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `tournament_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `next_date` bigint(20) NOT NULL DEFAULT '0',
  `world_id` int(10) NOT NULL DEFAULT '0',
  `min_level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `max_level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gatilhos `tournaments`
--
DELIMITER $$
CREATE TRIGGER `ondelete_tournaments` BEFORE DELETE ON `tournaments` FOR EACH ROW BEGIN
	DELETE FROM `tournament_inscriptions` WHERE `tournament_inscriptions`.`tournament_id` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournament_bans`
--

CREATE TABLE `tournament_bans` (
  `id` int(10) NOT NULL,
  `player_id` int(11) DEFAULT '0',
  `expires` bigint(20) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournament_histories`
--

CREATE TABLE `tournament_histories` (
  `id` int(11) NOT NULL,
  `tournament_id` int(10) NOT NULL,
  `winner` int(11) NOT NULL,
  `loser` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `round` tinyint(4) NOT NULL DEFAULT '0',
  `show` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournament_history_pokemon`
--

CREATE TABLE `tournament_history_pokemon` (
  `tournament_history_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `pokemon_number` int(11) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournament_inscriptions`
--

CREATE TABLE `tournament_inscriptions` (
  `id` int(10) NOT NULL,
  `tournament_id` int(10) DEFAULT '0',
  `player_id` int(11) DEFAULT '0',
  `account_id` int(11) DEFAULT '0',
  `world_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournament_teams`
--

CREATE TABLE `tournament_teams` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournament_team_players`
--

CREATE TABLE `tournament_team_players` (
  `team_id` int(11) UNSIGNED DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournament_weekly_winners`
--

CREATE TABLE `tournament_weekly_winners` (
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tournament_winners`
--

CREATE TABLE `tournament_winners` (
  `id` int(11) NOT NULL,
  `tournament_id` int(10) NOT NULL,
  `winner` int(11) NOT NULL,
  `date` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `account_storage`
--
ALTER TABLE `account_storage`
  ADD UNIQUE KEY `account_id_key` (`account_id`,`key`);

--
-- Índices de tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id` (`world_id`);

--
-- Índices de tabela `ball_counter`
--
ALTER TABLE `ball_counter`
  ADD PRIMARY KEY (`player_id`,`pokemon_id`);

--
-- Índices de tabela `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`value`),
  ADD KEY `active` (`active`);

--
-- Índices de tabela `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `blog_post_categories`
--
ALTER TABLE `blog_post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices de tabela `blog_post_categories_blog_posts`
--
ALTER TABLE `blog_post_categories_blog_posts`
  ADD PRIMARY KEY (`blog_post_category_id`,`blog_post_id`);

--
-- Índices de tabela `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_blog_post_comments_accounts` (`account_id`),
  ADD KEY `FK_blog_post_comments_blog_posts` (`post_id`);

--
-- Índices de tabela `blog_post_loves`
--
ALTER TABLE `blog_post_loves`
  ADD PRIMARY KEY (`blog_post_id`,`account_id`),
  ADD UNIQUE KEY `post_id_account_id` (`blog_post_id`,`account_id`);

--
-- Índices de tabela `change_emails`
--
ALTER TABLE `change_emails`
  ADD KEY `id` (`id`);

--
-- Índices de tabela `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `coupon_uses`
--
ALTER TABLE `coupon_uses`
  ADD UNIQUE KEY `coupon_id_account_id` (`coupon_id`,`account_id`),
  ADD KEY `FK_coupon_uses_accounts` (`account_id`);

--
-- Índices de tabela `datalog_admin_commands`
--
ALTER TABLE `datalog_admin_commands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_datalog_admin_commands_players` (`player_id`);

--
-- Índices de tabela `datalog_anniversary_drops`
--
ALTER TABLE `datalog_anniversary_drops`
  ADD KEY `FK_datalog_anniversary_drops_players` (`player_id`);

--
-- Índices de tabela `datalog_boss_rewards`
--
ALTER TABLE `datalog_boss_rewards`
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `datalog_casino_token_bought`
--
ALTER TABLE `datalog_casino_token_bought`
  ADD KEY `datalog_casino_token_bought_ibfk_1` (`player_id`);

--
-- Índices de tabela `datalog_caughts`
--
ALTER TABLE `datalog_caughts`
  ADD KEY `datalog_caughts_ibfk_1` (`player_id`);

--
-- Índices de tabela `datalog_christmas_drops`
--
ALTER TABLE `datalog_christmas_drops`
  ADD KEY `FK_datalog_christmas_drops_players` (`player_id`);

--
-- Índices de tabela `datalog_coin_uses`
--
ALTER TABLE `datalog_coin_uses`
  ADD KEY `datalog_coin_uses_ibfk_1` (`player_id`);

--
-- Índices de tabela `datalog_colosseum_arena`
--
ALTER TABLE `datalog_colosseum_arena`
  ADD KEY `FK_datalog_colosseum_arena_accounts` (`account_id`);

--
-- Índices de tabela `datalog_delivery_packages`
--
ALTER TABLE `datalog_delivery_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_datalog_delivery_packages_players` (`player_id`);

--
-- Índices de tabela `datalog_duel_bet`
--
ALTER TABLE `datalog_duel_bet`
  ADD KEY `FK_datalog_duel_bet_players` (`leader_a`),
  ADD KEY `FK_datalog_duel_bet_players_2` (`leader_b`),
  ADD KEY `FK_datalog_duel_bet_players_3` (`player_id`);

--
-- Índices de tabela `datalog_easter_drops`
--
ALTER TABLE `datalog_easter_drops`
  ADD KEY `FK_datalog_easter_drops_players` (`player_id`);

--
-- Índices de tabela `datalog_egg_generate`
--
ALTER TABLE `datalog_egg_generate`
  ADD KEY `datalog_egg_generate_ibfk_1` (`player_id`);

--
-- Índices de tabela `datalog_egg_move_generate`
--
ALTER TABLE `datalog_egg_move_generate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_datalog_egg_move_generate_players` (`player_id`);

--
-- Índices de tabela `datalog_egg_move_regenerate`
--
ALTER TABLE `datalog_egg_move_regenerate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_datalog_egg_move_regenerate_players` (`player_id`);

--
-- Índices de tabela `datalog_halloween_drops`
--
ALTER TABLE `datalog_halloween_drops`
  ADD KEY `FK_datalog_halloween_drops_players` (`player_id`);

--
-- Índices de tabela `datalog_julyvacation_drops`
--
ALTER TABLE `datalog_julyvacation_drops`
  ADD KEY `FK_datalog_julyvacation_drops_players` (`player_id`);

--
-- Índices de tabela `datalog_logins`
--
ALTER TABLE `datalog_logins`
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `datalog_mastery_token_bought`
--
ALTER TABLE `datalog_mastery_token_bought`
  ADD KEY `datalog_mastery_token_bought_ibfk_1` (`player_id`);

--
-- Índices de tabela `datalog_player_ups`
--
ALTER TABLE `datalog_player_ups`
  ADD KEY `datalog_player_ups_ibfk_1` (`player_id`);

--
-- Índices de tabela `datalog_pokemon_market`
--
ALTER TABLE `datalog_pokemon_market`
  ADD KEY `datalog_pokemon_market_ibfk_1` (`seller`),
  ADD KEY `datalog_pokemon_market_ibfk_2` (`buyer`);

--
-- Índices de tabela `datalog_pokemon_ups`
--
ALTER TABLE `datalog_pokemon_ups`
  ADD KEY `datalog_pokemon_ups_ibfk_1` (`player_id`);

--
-- Índices de tabela `datalog_poketrader_boughts`
--
ALTER TABLE `datalog_poketrader_boughts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_datalog_poketrader_boughts_players` (`player_id`);

--
-- Índices de tabela `datalog_poke_nick_change`
--
ALTER TABLE `datalog_poke_nick_change`
  ADD KEY `datalog_poke_nick_change_ibfk_1` (`player_id`);

--
-- Índices de tabela `datalog_rangerclub_boss`
--
ALTER TABLE `datalog_rangerclub_boss`
  ADD KEY `FK_datalog_rangerclub_boss_players` (`player_id`);

--
-- Índices de tabela `datalog_rangerclub_boss_rewards`
--
ALTER TABLE `datalog_rangerclub_boss_rewards`
  ADD KEY `FK_datalog_rangerclub_boss_rewards_players` (`player_id`);

--
-- Índices de tabela `datalog_rangerclub_task`
--
ALTER TABLE `datalog_rangerclub_task`
  ADD KEY `FK_datalog_rangerclub_task_players` (`player_id`);

--
-- Índices de tabela `datalog_referral_exchange`
--
ALTER TABLE `datalog_referral_exchange`
  ADD KEY `datalog_referral_exchange_players` (`player_id`);

--
-- Índices de tabela `datalog_slot_machine`
--
ALTER TABLE `datalog_slot_machine`
  ADD KEY `FK_datalog_slot_machine_players` (`player_id`);

--
-- Índices de tabela `datalog_surprise_box`
--
ALTER TABLE `datalog_surprise_box`
  ADD KEY `FK_datalog_surprise_box_players` (`player_id`);

--
-- Índices de tabela `datalog_token_bought`
--
ALTER TABLE `datalog_token_bought`
  ADD KEY `datalog_token_bought_ibfk_1` (`player_id`);

--
-- Índices de tabela `daycare_female`
--
ALTER TABLE `daycare_female`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `daycare_male`
--
ALTER TABLE `daycare_male`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `daycare_plates`
--
ALTER TABLE `daycare_plates`
  ADD UNIQUE KEY `player_id` (`player_id`);

--
-- Índices de tabela `delete_players`
--
ALTER TABLE `delete_players`
  ADD KEY `id` (`id`);

--
-- Índices de tabela `donates`
--
ALTER TABLE `donates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_donates_accounts` (`account_id`);

--
-- Índices de tabela `egg_counter`
--
ALTER TABLE `egg_counter`
  ADD PRIMARY KEY (`player_id`,`pokemon_id`);

--
-- Índices de tabela `elite_four_champions`
--
ALTER TABLE `elite_four_champions`
  ADD UNIQUE KEY `player_id` (`player_id`);

--
-- Índices de tabela `elite_four_champion_pokemons`
--
ALTER TABLE `elite_four_champion_pokemons`
  ADD KEY `FK_elite_four_champion_pokemons_players` (`player_id`);

--
-- Índices de tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD KEY `kill_id` (`kill_id`);

--
-- Índices de tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`,`world_id`),
  ADD UNIQUE KEY `key_2` (`key`,`world_id`),
  ADD UNIQUE KEY `key_3` (`key`,`world_id`),
  ADD UNIQUE KEY `key_4` (`key`,`world_id`);

--
-- Índices de tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`world_id`),
  ADD UNIQUE KEY `name_2` (`name`,`world_id`),
  ADD UNIQUE KEY `name_3` (`name`,`world_id`),
  ADD UNIQUE KEY `name_4` (`name`,`world_id`);

--
-- Índices de tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `guild_loves`
--
ALTER TABLE `guild_loves`
  ADD PRIMARY KEY (`guild_id`,`account_id`),
  ADD UNIQUE KEY `guild_id_account_id` (`guild_id`,`account_id`),
  ADD KEY `FK_guild_loves_accounts` (`account_id`);

--
-- Índices de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices de tabela `houses`
--
ALTER TABLE `houses`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD UNIQUE KEY `id_2` (`id`,`world_id`),
  ADD UNIQUE KEY `id_3` (`id`,`world_id`),
  ADD UNIQUE KEY `id_4` (`id`,`world_id`);

--
-- Índices de tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `house_data`
--
ALTER TABLE `house_data`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`);

--
-- Índices de tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`),
  ADD UNIQUE KEY `house_id_2` (`house_id`,`world_id`,`listid`),
  ADD UNIQUE KEY `house_id_3` (`house_id`,`world_id`,`listid`),
  ADD UNIQUE KEY `house_id_4` (`house_id`,`world_id`,`listid`);

--
-- Índices de tabela `instant_payment_notifications`
--
ALTER TABLE `instant_payment_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `killers`
--
ALTER TABLE `killers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `death_id` (`death_id`);

--
-- Índices de tabela `loyalty_ranks`
--
ALTER TABLE `loyalty_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `market_historic`
--
ALTER TABLE `market_historic`
  ADD UNIQUE KEY `player_id` (`player_id`);

--
-- Índices de tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices de tabela `market_items`
--
ALTER TABLE `market_items`
  ADD PRIMARY KEY (`item_code`),
  ADD UNIQUE KEY `item_code` (`item_code`);

--
-- Índices de tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `password_requests`
--
ALTER TABLE `password_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `FK_password_requests_accounts` (`account_id`);

--
-- Índices de tabela `paypal_items`
--
ALTER TABLE `paypal_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`deleted`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `online` (`online`),
  ADD KEY `deleted` (`deleted`);

--
-- Índices de tabela `player_achievements`
--
ALTER TABLE `player_achievements`
  ADD UNIQUE KEY `player_id_key` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `date` (`date`);

--
-- Índices de tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_highscores`
--
ALTER TABLE `player_highscores`
  ADD PRIMARY KEY (`player_id`,`score_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_items`
--
ALTER TABLE `player_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD KEY `kill_id` (`kill_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_pokemon`
--
ALTER TABLE `player_pokemon`
  ADD UNIQUE KEY `player_id_slot` (`player_id`,`slot`);

--
-- Índices de tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_statistics`
--
ALTER TABLE `player_statistics`
  ADD UNIQUE KEY `player_id_key` (`player_id`,`key`);

--
-- Índices de tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vip_id` (`vip_id`);

--
-- Índices de tabela `pokemon_market`
--
ALTER TABLE `pokemon_market`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices de tabela `poketrader_bids`
--
ALTER TABLE `poketrader_bids`
  ADD UNIQUE KEY `player_id_offert_id` (`player_id`,`offert_id`),
  ADD KEY `FK_poketrader_bids_poketrader_offerts` (`offert_id`);

--
-- Índices de tabela `poketrader_offerts`
--
ALTER TABLE `poketrader_offerts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_poll_options_polls` (`poll_id`);

--
-- Índices de tabela `poll_texts`
--
ALTER TABLE `poll_texts`
  ADD UNIQUE KEY `poll_id_account_id` (`poll_id`,`account_id`),
  ADD KEY `FK_poll_texts_accounts` (`account_id`);

--
-- Índices de tabela `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD UNIQUE KEY `poll_id_account_id` (`poll_id`,`account_id`),
  ADD KEY `FK_poll_votes_accounts` (`account_id`),
  ADD KEY `FK_poll_votes_poll_options` (`poll_option_id`);

--
-- Índices de tabela `rank_caught_species`
--
ALTER TABLE `rank_caught_species`
  ADD UNIQUE KEY `player_id` (`player_id`),
  ADD KEY `FK_rank_caught_especies_players` (`player_id`);

--
-- Índices de tabela `rank_generals`
--
ALTER TABLE `rank_generals`
  ADD UNIQUE KEY `player_id` (`player_id`);

--
-- Índices de tabela `rank_pvps`
--
ALTER TABLE `rank_pvps`
  ADD UNIQUE KEY `player_id` (`player_id`),
  ADD KEY `FK_rank_pvp_players` (`player_id`);

--
-- Índices de tabela `referral_friends`
--
ALTER TABLE `referral_friends`
  ADD UNIQUE KEY `account_referral_account_friend` (`account_referral`,`account_friend`),
  ADD KEY `FK_referral_friends_accounts_2` (`account_friend`);

--
-- Índices de tabela `server_config`
--
ALTER TABLE `server_config`
  ADD UNIQUE KEY `config` (`config`);

--
-- Índices de tabela `server_motd`
--
ALTER TABLE `server_motd`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD UNIQUE KEY `id_2` (`id`,`world_id`),
  ADD UNIQUE KEY `id_3` (`id`,`world_id`),
  ADD UNIQUE KEY `id_4` (`id`,`world_id`);

--
-- Índices de tabela `server_record`
--
ALTER TABLE `server_record`
  ADD UNIQUE KEY `record` (`record`,`world_id`,`timestamp`),
  ADD UNIQUE KEY `timestamp` (`timestamp`,`record`,`world_id`),
  ADD UNIQUE KEY `timestamp_2` (`timestamp`,`record`,`world_id`),
  ADD UNIQUE KEY `timestamp_3` (`timestamp`,`record`,`world_id`);

--
-- Índices de tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `world_id` (`world_id`),
  ADD KEY `reads` (`reads`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id_2` (`world_id`),
  ADD KEY `world_id_3` (`world_id`),
  ADD KEY `world_id_4` (`world_id`);

--
-- Índices de tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tickets_ticket_categories` (`category_id`);

--
-- Índices de tabela `ticket_categories`
--
ALTER TABLE `ticket_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tiles`
--
ALTER TABLE `tiles`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD UNIQUE KEY `id_2` (`id`,`world_id`),
  ADD UNIQUE KEY `id_3` (`id`,`world_id`),
  ADD UNIQUE KEY `id_4` (`id`,`world_id`),
  ADD KEY `x` (`x`,`y`,`z`),
  ADD KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `x_2` (`x`,`y`,`z`),
  ADD KEY `x_3` (`x`,`y`,`z`),
  ADD KEY `x_4` (`x`,`y`,`z`);

--
-- Índices de tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  ADD UNIQUE KEY `tile_id_2` (`tile_id`,`world_id`,`sid`),
  ADD UNIQUE KEY `tile_id_3` (`tile_id`,`world_id`,`sid`),
  ADD UNIQUE KEY `tile_id_4` (`tile_id`,`world_id`,`sid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `sid_2` (`sid`),
  ADD KEY `sid_3` (`sid`),
  ADD KEY `sid_4` (`sid`);

--
-- Índices de tabela `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tournament_bans`
--
ALTER TABLE `tournament_bans`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tournament_histories`
--
ALTER TABLE `tournament_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tournament_histories_tournaments` (`tournament_id`);

--
-- Índices de tabela `tournament_history_pokemon`
--
ALTER TABLE `tournament_history_pokemon`
  ADD KEY `FK_tournament_history_pokemon_tournament_histories` (`tournament_history_id`),
  ADD KEY `FK_tournament_history_pokemon_players` (`player_id`);

--
-- Índices de tabela `tournament_inscriptions`
--
ALTER TABLE `tournament_inscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tournament_teams`
--
ALTER TABLE `tournament_teams`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tournament_team_players`
--
ALTER TABLE `tournament_team_players`
  ADD KEY `FK_tournament_team_players_players` (`player_id`),
  ADD KEY `FK_tournament_team_players_tournament_teams` (`team_id`);

--
-- Índices de tabela `tournament_weekly_winners`
--
ALTER TABLE `tournament_weekly_winners`
  ADD KEY `FK_tournament_weekly_winners_players` (`player_id`);

--
-- Índices de tabela `tournament_winners`
--
ALTER TABLE `tournament_winners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tournament_winners_tournaments` (`tournament_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79960;
--
-- AUTO_INCREMENT de tabela `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de tabela `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `blog_post_categories`
--
ALTER TABLE `blog_post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `change_emails`
--
ALTER TABLE `change_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=625;
--
-- AUTO_INCREMENT de tabela `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `datalog_admin_commands`
--
ALTER TABLE `datalog_admin_commands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1511;
--
-- AUTO_INCREMENT de tabela `datalog_delivery_packages`
--
ALTER TABLE `datalog_delivery_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1512;
--
-- AUTO_INCREMENT de tabela `datalog_egg_move_generate`
--
ALTER TABLE `datalog_egg_move_generate`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `datalog_egg_move_regenerate`
--
ALTER TABLE `datalog_egg_move_regenerate`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `datalog_poketrader_boughts`
--
ALTER TABLE `datalog_poketrader_boughts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `daycare_female`
--
ALTER TABLE `daycare_female`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164232;
--
-- AUTO_INCREMENT de tabela `daycare_male`
--
ALTER TABLE `daycare_male`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55712;
--
-- AUTO_INCREMENT de tabela `delete_players`
--
ALTER TABLE `delete_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1375;
--
-- AUTO_INCREMENT de tabela `donates`
--
ALTER TABLE `donates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT de tabela `killers`
--
ALTER TABLE `killers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `loyalty_ranks`
--
ALTER TABLE `loyalty_ranks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38648;
--
-- AUTO_INCREMENT de tabela `password_requests`
--
ALTER TABLE `password_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103234;
--
-- AUTO_INCREMENT de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `pokemon_market`
--
ALTER TABLE `pokemon_market`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `poketrader_offerts`
--
ALTER TABLE `poketrader_offerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12617;
--
-- AUTO_INCREMENT de tabela `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `server_reports`
--
ALTER TABLE `server_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ticket_categories`
--
ALTER TABLE `ticket_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `tournament_bans`
--
ALTER TABLE `tournament_bans`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de tabela `tournament_histories`
--
ALTER TABLE `tournament_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `tournament_inscriptions`
--
ALTER TABLE `tournament_inscriptions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;
--
-- AUTO_INCREMENT de tabela `tournament_teams`
--
ALTER TABLE `tournament_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `tournament_winners`
--
ALTER TABLE `tournament_winners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `account_storage`
--
ALTER TABLE `account_storage`
  ADD CONSTRAINT `FK_account_storage_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD CONSTRAINT `FK_blog_post_comments_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_blog_post_comments_blog_posts` FOREIGN KEY (`post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `coupon_uses`
--
ALTER TABLE `coupon_uses`
  ADD CONSTRAINT `FK_coupon_uses_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_coupon_uses_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_admin_commands`
--
ALTER TABLE `datalog_admin_commands`
  ADD CONSTRAINT `FK_datalog_admin_commands_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_anniversary_drops`
--
ALTER TABLE `datalog_anniversary_drops`
  ADD CONSTRAINT `FK_datalog_anniversary_drops_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_boss_rewards`
--
ALTER TABLE `datalog_boss_rewards`
  ADD CONSTRAINT `FK__players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_casino_token_bought`
--
ALTER TABLE `datalog_casino_token_bought`
  ADD CONSTRAINT `datalog_casino_token_bought_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_caughts`
--
ALTER TABLE `datalog_caughts`
  ADD CONSTRAINT `datalog_caughts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_christmas_drops`
--
ALTER TABLE `datalog_christmas_drops`
  ADD CONSTRAINT `FK_datalog_christmas_drops_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_coin_uses`
--
ALTER TABLE `datalog_coin_uses`
  ADD CONSTRAINT `datalog_coin_uses_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_colosseum_arena`
--
ALTER TABLE `datalog_colosseum_arena`
  ADD CONSTRAINT `FK_datalog_colosseum_arena_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_delivery_packages`
--
ALTER TABLE `datalog_delivery_packages`
  ADD CONSTRAINT `FK_datalog_delivery_packages_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_duel_bet`
--
ALTER TABLE `datalog_duel_bet`
  ADD CONSTRAINT `FK_datalog_duel_bet_players` FOREIGN KEY (`leader_a`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_datalog_duel_bet_players_2` FOREIGN KEY (`leader_b`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_datalog_duel_bet_players_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_easter_drops`
--
ALTER TABLE `datalog_easter_drops`
  ADD CONSTRAINT `FK_datalog_easter_drops_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_egg_generate`
--
ALTER TABLE `datalog_egg_generate`
  ADD CONSTRAINT `datalog_egg_generate_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_egg_move_generate`
--
ALTER TABLE `datalog_egg_move_generate`
  ADD CONSTRAINT `FK_datalog_egg_move_generate_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_egg_move_regenerate`
--
ALTER TABLE `datalog_egg_move_regenerate`
  ADD CONSTRAINT `FK_datalog_egg_move_regenerate_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_halloween_drops`
--
ALTER TABLE `datalog_halloween_drops`
  ADD CONSTRAINT `FK_datalog_halloween_drops_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_julyvacation_drops`
--
ALTER TABLE `datalog_julyvacation_drops`
  ADD CONSTRAINT `FK_datalog_julyvacation_drops_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_mastery_token_bought`
--
ALTER TABLE `datalog_mastery_token_bought`
  ADD CONSTRAINT `datalog_mastery_token_bought_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_player_ups`
--
ALTER TABLE `datalog_player_ups`
  ADD CONSTRAINT `datalog_player_ups_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_pokemon_market`
--
ALTER TABLE `datalog_pokemon_market`
  ADD CONSTRAINT `datalog_pokemon_market_ibfk_1` FOREIGN KEY (`seller`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `datalog_pokemon_market_ibfk_2` FOREIGN KEY (`buyer`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_pokemon_ups`
--
ALTER TABLE `datalog_pokemon_ups`
  ADD CONSTRAINT `datalog_pokemon_ups_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_poketrader_boughts`
--
ALTER TABLE `datalog_poketrader_boughts`
  ADD CONSTRAINT `FK_datalog_poketrader_boughts_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_poke_nick_change`
--
ALTER TABLE `datalog_poke_nick_change`
  ADD CONSTRAINT `datalog_poke_nick_change_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_rangerclub_boss`
--
ALTER TABLE `datalog_rangerclub_boss`
  ADD CONSTRAINT `FK_datalog_rangerclub_boss_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_rangerclub_boss_rewards`
--
ALTER TABLE `datalog_rangerclub_boss_rewards`
  ADD CONSTRAINT `FK_datalog_rangerclub_boss_rewards_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_rangerclub_task`
--
ALTER TABLE `datalog_rangerclub_task`
  ADD CONSTRAINT `FK_datalog_rangerclub_task_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_referral_exchange`
--
ALTER TABLE `datalog_referral_exchange`
  ADD CONSTRAINT `FK_datalog_referral_exchange_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_slot_machine`
--
ALTER TABLE `datalog_slot_machine`
  ADD CONSTRAINT `FK_datalog_slot_machine_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `datalog_surprise_box`
--
ALTER TABLE `datalog_surprise_box`
  ADD CONSTRAINT `FK_datalog_surprise_box_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `datalog_token_bought`
--
ALTER TABLE `datalog_token_bought`
  ADD CONSTRAINT `datalog_token_bought_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `daycare_plates`
--
ALTER TABLE `daycare_plates`
  ADD CONSTRAINT `FK_daycare_plates_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `donates`
--
ALTER TABLE `donates`
  ADD CONSTRAINT `FK_donates_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `elite_four_champions`
--
ALTER TABLE `elite_four_champions`
  ADD CONSTRAINT `FK_elite_four_champions_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `elite_four_champion_pokemons`
--
ALTER TABLE `elite_four_champion_pokemons`
  ADD CONSTRAINT `FK_elite_four_champion_pokemons_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_4` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `guild_loves`
--
ALTER TABLE `guild_loves`
  ADD CONSTRAINT `FK_guild_loves_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_guild_loves_guilds` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `password_requests`
--
ALTER TABLE `password_requests`
  ADD CONSTRAINT `FK_password_requests_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `player_achievements`
--
ALTER TABLE `player_achievements`
  ADD CONSTRAINT `player_achievements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `player_highscores`
--
ALTER TABLE `player_highscores`
  ADD CONSTRAINT `player_highscores_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `player_pokemon`
--
ALTER TABLE `player_pokemon`
  ADD CONSTRAINT `FK_player_pokemon_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `player_statistics`
--
ALTER TABLE `player_statistics`
  ADD CONSTRAINT `player_statistics_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pokemon_market`
--
ALTER TABLE `pokemon_market`
  ADD CONSTRAINT `FK_pokemon_market_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `poketrader_bids`
--
ALTER TABLE `poketrader_bids`
  ADD CONSTRAINT `FK_poketrader_bids_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_poketrader_bids_poketrader_offerts` FOREIGN KEY (`offert_id`) REFERENCES `poketrader_offerts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `FK_poll_options_polls` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `poll_texts`
--
ALTER TABLE `poll_texts`
  ADD CONSTRAINT `FK_poll_texts_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_poll_texts_polls` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `FK_poll_votes_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_poll_votes_poll_options` FOREIGN KEY (`poll_option_id`) REFERENCES `poll_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_poll_votes_polls` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `rank_caught_species`
--
ALTER TABLE `rank_caught_species`
  ADD CONSTRAINT `FK_rank_caught_species_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `rank_generals`
--
ALTER TABLE `rank_generals`
  ADD CONSTRAINT `FK_rank_general_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `rank_pvps`
--
ALTER TABLE `rank_pvps`
  ADD CONSTRAINT `FK_rank_pvp_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `referral_friends`
--
ALTER TABLE `referral_friends`
  ADD CONSTRAINT `FK_referral_friends_accounts` FOREIGN KEY (`account_referral`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_referral_friends_accounts_2` FOREIGN KEY (`account_friend`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `FK_tickets_ticket_categories` FOREIGN KEY (`category_id`) REFERENCES `ticket_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `tournament_history_pokemon`
--
ALTER TABLE `tournament_history_pokemon`
  ADD CONSTRAINT `FK_tournament_history_pokemon_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tournament_history_pokemon_tournament_histories` FOREIGN KEY (`tournament_history_id`) REFERENCES `tournament_histories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tournament_team_players`
--
ALTER TABLE `tournament_team_players`
  ADD CONSTRAINT `FK_tournament_team_players_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tournament_team_players_tournament_teams` FOREIGN KEY (`team_id`) REFERENCES `tournament_teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Restrições para tabelas `tournament_weekly_winners`
--
ALTER TABLE `tournament_weekly_winners`
  ADD CONSTRAINT `FK_tournament_weekly_winners_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tournament_winners`
--
ALTER TABLE `tournament_winners`
  ADD CONSTRAINT `FK_tournament_winners_tournaments` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
