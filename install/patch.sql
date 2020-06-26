ALTER TABLE `blocked_ips` DROP `attempts_blocked`;
ALTER TABLE `bouquets` CHANGE `bouquet_name` `bouquet_name` longtext COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `bouquets` CHANGE `bouquet_channels` `bouquet_channels` longtext COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `bouquets` CHANGE `bouquet_series` `bouquet_series` longtext COLLATE utf8_unicode_ci NOT NULL;
DROP TABLE `created`;
DROP TABLE `cronjobs`;
DROP TABLE `licence`;
/*DROP TABLE `login_flood`;
DROP TABLE `login_logs`;*/
ALTER TABLE `mag_devices` DROP `ip`;
ALTER TABLE `mag_devices` ADD `hw_version_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL AFTER `hw_version`; 
ALTER TABLE `mag_devices` CHANGE `mag_player` `mag_player` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL; 
ALTER TABLE `member_groups` ADD `lock_device` tinyint(4) NOT NULL DEFAULT '0' AFTER `edit_isplock`; 
/*ALTER TABLE `member_groups` DROP `minimum_trial_credits`;*/
ALTER TABLE `member_groups` ADD `full_admin` tinyint(4) NOT NULL DEFAULT '0' AFTER `allow_download`; 
ALTER TABLE `member_groups` ADD `allow_custom_dns` TINYINT(4) NOT NULL DEFAULT '0' AFTER `full_admin`; 
/*DROP TABLE `movie_containers`;*/
ALTER TABLE `packages` CHANGE `forced_country` `forced_country` varchar(3) COLLATE utf8_unicode_ci NOT NULL; 
ALTER TABLE `panel_logs` CHANGE `log_message` `log_message` mediumtext COLLATE utf8_unicode_ci NOT NULL;
/*ALTER TABLE `reg_users` CHANGE `dark_mode` `otp` VARCHAR(10) NOT NULL;
ALTER TABLE `reg_users` CHANGE `sidebar` `cookie_value` VARCHAR(32) NOT NULL;*/
CREATE TABLE IF NOT EXISTS `restreamers_finder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reason` enum('BAD_UA','HIGH_FREQ_STREAM','MANY_COUNTRIES','DIFF_IPS') NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_reason` (`user_id`,`reason`),
  KEY `user_id` (`user_id`),
  KEY `reason` (`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `restreamers_finder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_reason` (`user_id`,`reason`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reason` (`reason`);
ALTER TABLE `restreamers_finder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `series` CHANGE `episode_run_time` `episode_run_time` INT(11) NOT NULL; 
RENAME TABLE server_activity TO server_network;
ALTER TABLE `server_network` CHANGE `source_server_id` `server_id` INT(11) NOT NULL; 
ALTER TABLE `server_network` CHANGE `dest_server_id` `sent` BIGINT(20) NOT NULL; 
ALTER TABLE `server_network` CHANGE `stream_id` `received` INT(11) NOT NULL; 
ALTER TABLE `server_network` DROP `pid`;
ALTER TABLE `server_network` DROP `bandwidth`;
ALTER TABLE `server_network` CHANGE `date_start` `date` INT(11) NOT NULL; 
ALTER TABLE `server_network` DROP `date_end`;
ALTER TABLE `settings` ADD PRIMARY KEY(`id`);
ALTER TABLE `settings` CHANGE `allowed_stb_types` `allowed_stb_types` text COLLATE utf8_unicode_ci NOT NULL DEFAULT ''; 
ALTER TABLE `settings` DROP `flood_seconds`;
ALTER TABLE `settings` DROP `flood_max_attempts`;
ALTER TABLE `settings` DROP `flood_apply_clients`; 
ALTER TABLE `settings` DROP `flood_apply_restreamers`;
ALTER TABLE `settings` DROP `flood_get_block`;
ALTER TABLE `settings` DROP `portal_block`;
ALTER TABLE `settings` DROP `streaming_block`;
ALTER TABLE `settings` DROP `client_area_plugin`
ALTER TABLE `settings` DROP `xc_support_allow`;
ALTER TABLE `settings` DROP `e2_arm7a`;
ALTER TABLE `settings` DROP `e2_mipsel`;
ALTER TABLE `settings` DROP `e2_mips32el`;
ALTER TABLE `settings` DROP `e2_sh4`;
ALTER TABLE `settings` DROP `e2_arm`;
ALTER TABLE `settings` ADD `xc_support_allow` TINYINT(2) NOT NULL DEFAULT '0' AFTER `disallow_2nd_ip_con`;
ALTER TABLE `settings` CHANGE `use_https` `use_https` LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `settings` DROP `use_buffer_table`;
ALTER TABLE `settings` DROP `toggle_menu`;
ALTER TABLE `settings` DROP `mobile_apps`;
ALTER TABLE `settings` ADD `mobile_apps` TINYINT(4) NOT NULL DEFAULT '0' AFTER `series_custom_name`;
ALTER TABLE `settings` ADD `rbackup_enable` TINYINT(4) NOT NULL DEFAULT '0' AFTER `mag_security`;
ALTER TABLE `settings` ADD `drop_key` TEXT NULL DEFAULT NULL AFTER `rbackup_enable`;
ALTER TABLE `settings` ADD `lbackup_enable` TINYINT(4) NOT NULL DEFAULT '0' AFTER `drop_key`;
ALTER TABLE `settings` ADD `lbackup_dir` TEXT NOT NULL DEFAULT '/home/streamcreed/backups' AFTER `lbackup_enable`;
ALTER TABLE `settings` ADD `adult_password` VARCHAR(255) NOT NULL AFTER `lbackup_dir`;
ALTER TABLE `settings` ADD `lb_ip_check` TINYINT(4) NOT NULL DEFAULT '0' AFTER `adult_password`;
ALTER TABLE `settings` ADD `cs_block_types` TEXT NOT NULL AFTER `lb_ip_check`;
DROP TABLE `signals`;
ALTER TABLE `streaming_servers` ADD `server_isp` VARCHAR(255) NOT NULL AFTER `server_name`;
ALTER TABLE `streaming_servers` CHANGE `domain_name` `broadcast` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `streaming_servers` MODIFY COLUMN vpn_ip VARCHAR(255) AFTER broadcast;
ALTER TABLE `streaming_servers` CHANGE `vpn_ip` `broadcast_internal` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL; 
ALTER TABLE `streaming_servers` DROP `system_os`;
ALTER TABLE `streaming_servers` DROP `can_delete`;
ALTER TABLE `streaming_servers` DROP `server_hardware`;
ALTER TABLE `streaming_servers` DROP `persistent_connections`;
ALTER TABLE `streaming_servers` MODIFY COLUMN whitelist_ips MEDIUMTEXT NOT NULL AFTER watchdog_data;
ALTER TABLE `streaming_servers` ADD `nginx_config` LONGTEXT NOT NULL AFTER `timeshift_only`; 
ALTER TABLE `streaming_servers` ADD `full_duplex` TINYINT(4) NOT NULL DEFAULT '1' AFTER `nginx_config`; 
ALTER TABLE `streaming_servers` ADD `extra_ips` LONGTEXT NOT NULL AFTER `full_duplex`; 
ALTER TABLE `streaming_servers` ADD `vod_output_folder` TEXT NOT NULL AFTER `extra_ips`; 
ALTER TABLE `streaming_servers` ADD `redis_port` INT(11) NOT NULL DEFAULT '25460' AFTER `vod_output_folder`; 
ALTER TABLE `streams` ADD `is_adult` TINYINT(4) NOT NULL DEFAULT '0' AFTER `delay_minutes`; 
ALTER TABLE `streams` ADD `is_website` TINYINT(4) NOT NULL DEFAULT '0' AFTER `is_adult`; 
DROP TABLE `streams_seasons`;
ALTER TABLE `streams_sys` ADD `vod_folder` TEXT COLLATE utf8_unicode_ci DEFAULT NULL AFTER `delay_available_at`;
ALTER TABLE `stream_logs` CHANGE `error` `error` TEXT NOT NULL; 
DROP TABLE `stream_subcategories`;
/*DROP TABLE `subreseller_setup`;*/
DROP TABLE `suspicious_logs`;
/*DROP TABLE `tmdb_async`;*/
ALTER TABLE `users` CHANGE `play_token` `play_token` VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL; 
ALTER TABLE `user_activity` CHANGE `external_device` `city` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `user_activity_now` ADD `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL AFTER `activity_id`;
ALTER TABLE `user_activity_now` CHANGE `pid` `pid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL;
ALTER TABLE `user_activity_now` CHANGE `external_device` `city` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `user_activity_now` DROP `hls_last_read`;
ALTER TABLE `user_activity_now` DROP `hls_end`;
/*DROP TABLE `watch_categories`;
DROP TABLE `watch_folders`;
DROP TABLE `watch_output`;
DROP TABLE `watch_settings`;
DROP TABLE `xtream_main`;*/
UPDATE `reg_users` SET `sidebar` = '1' WHERE `reg_users`.`id` = 1;
