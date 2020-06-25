CREATE TABLE `access_output` (
  `access_output_id` int(11) NOT NULL,
  `output_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `output_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `output_ext` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `blocked_ips` (
  `id` int(11) NOT NULL,
  `ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `blocked_user_agents` (
  `id` int(11) NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exact_match` int(11) NOT NULL DEFAULT 0,
  `attempts_blocked` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bouquets` (
  `id` int(11) NOT NULL,
  `bouquet_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `bouquet_channels` longtext COLLATE utf8_unicode_ci NOT NULL,
  `bouquet_series` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `client_logs` (
  `id` int(11) NOT NULL,
  `stream_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query_string` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extra_data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `credits_log` (
  `id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` int(11) NOT NULL,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `devices` (
  `device_id` int(11) NOT NULL,
  `device_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `device_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `device_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `device_header` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `device_conf` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `device_footer` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `default_output` int(11) NOT NULL DEFAULT 0,
  `copy_text` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `enigma2_actions` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `type` text NOT NULL,
  `key` text NOT NULL,
  `command` text NOT NULL,
  `command2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `enigma2_devices` (
  `device_id` int(12) NOT NULL,
  `mac` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `modem_mac` varchar(255) NOT NULL,
  `local_ip` varchar(255) NOT NULL,
  `public_ip` varchar(255) NOT NULL,
  `key_auth` varchar(255) NOT NULL,
  `enigma_version` varchar(255) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `lversion` text NOT NULL,
  `token` varchar(32) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `watchdog_timeout` int(11) NOT NULL,
  `lock_device` tinyint(4) NOT NULL DEFAULT 0,
  `telnet_enable` tinyint(4) NOT NULL DEFAULT 1,
  `ftp_enable` tinyint(4) NOT NULL DEFAULT 1,
  `ssh_enable` tinyint(4) NOT NULL DEFAULT 1,
  `dns` varchar(255) NOT NULL,
  `original_mac` varchar(255) NOT NULL,
  `rc` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `enigma2_failed` (
  `id` int(11) NOT NULL,
  `original_mac` varchar(255) NOT NULL,
  `virtual_mac` varchar(255) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `epg` (
  `id` int(11) NOT NULL,
  `epg_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epg_file` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `integrity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_updated` int(11) DEFAULT NULL,
  `days_keep` int(11) NOT NULL DEFAULT 7,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `epg_data` (
  `id` int(11) NOT NULL,
  `epg_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `channel_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `isp_addon` (
  `id` int(11) NOT NULL,
  `isp` text NOT NULL,
  `blocked` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mag_claims` (
  `id` int(11) NOT NULL,
  `mag_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `real_type` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mag_devices` (
  `mag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bright` int(10) NOT NULL DEFAULT 200,
  `contrast` int(10) NOT NULL DEFAULT 127,
  `saturation` int(10) NOT NULL DEFAULT 127,
  `aspect` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `video_out` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'rca',
  `volume` int(5) NOT NULL DEFAULT 50,
  `playback_buffer_bytes` int(50) NOT NULL DEFAULT 0,
  `playback_buffer_size` int(50) NOT NULL DEFAULT 0,
  `audio_out` int(5) NOT NULL DEFAULT 1,
  `mac` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ls` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ver` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en_GB.utf8',
  `city_id` int(11) DEFAULT 0,
  `hd` int(10) NOT NULL DEFAULT 1,
  `main_notify` int(5) NOT NULL DEFAULT 1,
  `fav_itv_on` int(5) NOT NULL DEFAULT 0,
  `now_playing_start` int(50) DEFAULT NULL,
  `now_playing_type` int(11) NOT NULL DEFAULT 0,
  `now_playing_content` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_last_play_tv` int(50) DEFAULT NULL,
  `time_last_play_video` int(50) DEFAULT NULL,
  `hd_content` int(11) NOT NULL DEFAULT 1,
  `image_version` varchar(350) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_change_status` int(11) DEFAULT NULL,
  `last_start` int(11) DEFAULT NULL,
  `last_active` int(11) DEFAULT NULL,
  `keep_alive` int(11) DEFAULT NULL,
  `playback_limit` int(11) NOT NULL DEFAULT 3,
  `screensaver_delay` int(11) NOT NULL DEFAULT 10,
  `stb_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_watchdog` int(50) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `country` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plasma_saving` int(11) NOT NULL DEFAULT 0,
  `ts_enabled` int(11) DEFAULT 0,
  `ts_enable_icon` int(11) NOT NULL DEFAULT 1,
  `ts_path` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ts_max_length` int(11) NOT NULL DEFAULT 3600,
  `ts_buffer_use` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cyclic',
  `ts_action_on_exit` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no_save',
  `ts_delay` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on_pause',
  `video_clock` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Off',
  `rtsp_type` int(11) NOT NULL DEFAULT 4,
  `rtsp_flags` int(11) NOT NULL DEFAULT 0,
  `stb_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `display_menu_after_loading` int(11) NOT NULL DEFAULT 1,
  `record_max_length` int(11) NOT NULL DEFAULT 180,
  `plasma_saving_timeout` int(11) NOT NULL DEFAULT 600,
  `now_playing_link_id` int(11) DEFAULT NULL,
  `now_playing_streamer_id` int(11) DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hw_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hw_version_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_password` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0000',
  `spdif_mode` int(11) NOT NULL DEFAULT 1,
  `show_after_loading` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main_menu',
  `play_in_preview_by_ok` int(11) NOT NULL DEFAULT 1,
  `hdmi_event_reaction` int(11) NOT NULL DEFAULT 1,
  `mag_player` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `play_in_preview_only_by_ok` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `watchdog_timeout` int(11) NOT NULL,
  `fav_channels` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `tv_archive_continued` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `tv_channel_default_aspect` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fit',
  `last_itv_id` int(11) NOT NULL DEFAULT 0,
  `units` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'metric',
  `token` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  `lock_device` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `mag_events` (
  `id` int(11) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 0,
  `mag_device_id` int(11) NOT NULL,
  `event` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `need_confirm` tinyint(3) NOT NULL DEFAULT 0,
  `msg` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `reboot_after_ok` tinyint(3) NOT NULL DEFAULT 0,
  `auto_hide_timeout` tinyint(3) DEFAULT 0,
  `send_time` int(50) NOT NULL,
  `additional_services_on` tinyint(3) NOT NULL DEFAULT 1,
  `anec` tinyint(3) NOT NULL DEFAULT 0,
  `vclub` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `mag_logs` (
  `id` int(11) NOT NULL,
  `mag_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `member_groups` (
  `group_id` int(11) NOT NULL,
  `group_name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `group_color` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `is_banned` tinyint(4) NOT NULL DEFAULT 0,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `is_reseller` tinyint(4) NOT NULL,
  `total_allowed_gen_trials` int(11) NOT NULL DEFAULT 0,
  `total_allowed_gen_in` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delete_users` tinyint(4) NOT NULL DEFAULT 0,
  `allowed_pages` text COLLATE utf8_unicode_ci NOT NULL,
  `can_delete` tinyint(4) NOT NULL DEFAULT 1,
  `reseller_force_server` tinyint(4) NOT NULL DEFAULT 0,
  `create_sub_resellers_price` float NOT NULL DEFAULT 0,
  `create_sub_resellers` tinyint(4) NOT NULL DEFAULT 0,
  `alter_packages_ids` tinyint(4) NOT NULL DEFAULT 0,
  `alter_packages_prices` tinyint(4) NOT NULL DEFAULT 0,
  `reseller_client_connection_logs` tinyint(4) NOT NULL DEFAULT 0,
  `reseller_assign_pass` tinyint(4) NOT NULL DEFAULT 0,
  `allow_change_pass` tinyint(4) NOT NULL DEFAULT 0,
  `allow_import` tinyint(4) NOT NULL DEFAULT 0,
  `allow_export` tinyint(4) NOT NULL DEFAULT 0,
  `reseller_trial_credit_allow` int(11) NOT NULL DEFAULT 0,
  `edit_mac` tinyint(4) NOT NULL DEFAULT 0,
  `edit_isplock` tinyint(4) NOT NULL DEFAULT 0,
  `lock_device` tinyint(4) NOT NULL DEFAULT 0,
  `reset_stb_data` tinyint(4) NOT NULL DEFAULT 0,
  `reseller_bonus_package_inc` tinyint(4) NOT NULL DEFAULT 0,
  `allow_download` tinyint(4) NOT NULL DEFAULT 1,
  `full_admin` tinyint(4) NOT NULL DEFAULT 0,
  `allow_custom_dns` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `package_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_trial` tinyint(4) NOT NULL,
  `is_official` tinyint(4) NOT NULL,
  `trial_credits` float NOT NULL,
  `official_credits` float NOT NULL,
  `trial_duration` int(11) NOT NULL,
  `trial_duration_in` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `official_duration` int(11) NOT NULL,
  `official_duration_in` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `groups` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `bouquets` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `can_gen_mag` tinyint(4) NOT NULL DEFAULT 0,
  `only_mag` tinyint(4) NOT NULL DEFAULT 0,
  `output_formats` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `is_isplock` tinyint(4) NOT NULL DEFAULT 0,
  `max_connections` int(11) NOT NULL DEFAULT 1,
  `is_restreamer` tinyint(4) NOT NULL DEFAULT 0,
  `force_server_id` int(11) NOT NULL DEFAULT 0,
  `can_gen_e2` tinyint(4) NOT NULL DEFAULT 0,
  `only_e2` tinyint(4) NOT NULL DEFAULT 0,
  `forced_country` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `lock_device` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `panel_logs` (
  `id` int(11) NOT NULL,
  `log_message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_userlog` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `username` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date` int(30) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_registered` int(11) NOT NULL,
  `verify_key` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `member_group_id` int(11) NOT NULL,
  `verified` int(11) NOT NULL DEFAULT 0,
  `credits` float NOT NULL DEFAULT 0,
  `notes` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `default_lang` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `reseller_dns` text COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `override_packages` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_2fa_sec` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `otp` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cookie_value` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reseller_imex` (
  `id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `header` longtext NOT NULL,
  `data` longtext NOT NULL,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `finished` tinyint(4) NOT NULL DEFAULT 0,
  `bouquet_ids` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `restreamers_finder` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` enum('BAD_UA','HIGH_FREQ_STREAM','MANY_COUNTRIES','DIFF_IPS') NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rtmp_ips` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `cover` varchar(255) NOT NULL,
  `cover_big` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `plot` text NOT NULL,
  `cast` text NOT NULL,
  `rating` int(11) NOT NULL,
  `director` varchar(255) NOT NULL,
  `releaseDate` varchar(255) NOT NULL,
  `last_modified` int(11) NOT NULL,
  `tmdb_id` int(11) NOT NULL,
  `seasons` mediumtext NOT NULL,
  `episode_run_time` int(11) NOT NULL,
  `backdrop_path` text NOT NULL,
  `youtube_trailer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `series_episodes` (
  `id` int(11) NOT NULL,
  `season_num` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `server_network` (
  `id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `sent` bigint(20) NOT NULL,
  `received` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `bouquet_name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `live_streaming_pass` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email_verify_sub` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email_verify_cont` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email_forgot_sub` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email_forgot_cont` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `mail_from` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `smtp_host` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `min_password` int(11) NOT NULL DEFAULT 5,
  `username_strlen` int(11) NOT NULL DEFAULT 15,
  `username_alpha` int(11) NOT NULL DEFAULT 1,
  `allow_multiple_accs` int(11) NOT NULL DEFAULT 0,
  `allow_registrations` int(11) NOT NULL DEFAULT 0,
  `server_name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `smtp_username` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `smtp_password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email_new_pass_sub` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `logo_url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email_new_pass_cont` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `smtp_from_name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_email` int(11) NOT NULL,
  `smtp_encryption` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `unique_id` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `copyrights_removed` tinyint(4) NOT NULL,
  `copyrights_text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `default_timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Europe/Athens',
  `default_locale` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en_GB.utf8',
  `allowed_stb_types` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `client_prebuffer` int(11) NOT NULL,
  `split_clients` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stream_max_analyze` int(11) NOT NULL DEFAULT 30,
  `show_not_on_air_video` tinyint(4) NOT NULL,
  `not_on_air_video_path` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `show_banned_video` tinyint(4) NOT NULL,
  `banned_video_path` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `show_expired_video` tinyint(4) NOT NULL,
  `expired_video_path` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `mag_container` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `probesize` int(11) NOT NULL DEFAULT 5000000,
  `allowed_ips_admin` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `block_svp` tinyint(4) NOT NULL DEFAULT 0,
  `allow_countries` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `user_auto_kick_hours` int(11) NOT NULL DEFAULT 0,
  `show_in_red_online` int(11) NOT NULL DEFAULT 0,
  `disallow_empty_user_agents` tinyint(4) DEFAULT 0,
  `show_all_category_mag` tinyint(4) NOT NULL DEFAULT 1,
  `default_lang` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `autobackup_status` int(11) NOT NULL DEFAULT 0,
  `autobackup_pass` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `flood_limit` int(11) NOT NULL DEFAULT 0,
  `flood_ips_exclude` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `reshare_deny_addon` tinyint(4) NOT NULL DEFAULT 0,
  `restart_http` tinyint(4) NOT NULL DEFAULT 0,
  `css_layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backup_source_all` int(11) NOT NULL DEFAULT 0,
  `stream_start_delay` int(11) NOT NULL DEFAULT 20000,
  `hash_lb` tinyint(4) NOT NULL DEFAULT 1,
  `vod_bitrate_plus` int(11) NOT NULL DEFAULT 60,
  `read_buffer_size` int(11) NOT NULL DEFAULT 8192,
  `tv_channel_default_aspect` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fit',
  `playback_limit` int(11) NOT NULL DEFAULT 3,
  `show_tv_channel_logo` tinyint(4) NOT NULL DEFAULT 1,
  `show_channel_logo_in_preview` tinyint(4) NOT NULL DEFAULT 1,
  `enable_connection_problem_indication` tinyint(4) NOT NULL DEFAULT 1,
  `enable_pseudo_hls` tinyint(4) NOT NULL DEFAULT 1,
  `vod_limit_at` int(11) NOT NULL DEFAULT 0,
  `persistent_connections` tinyint(4) NOT NULL DEFAULT 0,
  `record_max_length` int(11) NOT NULL DEFAULT 180,
  `total_records_length` int(11) NOT NULL DEFAULT 600,
  `max_local_recordings` int(11) NOT NULL DEFAULT 10,
  `allowed_stb_types_for_local_recording` text COLLATE utf8_unicode_ci NOT NULL,
  `allowed_stb_types_rec` text COLLATE utf8_unicode_ci NOT NULL,
  `show_captcha` int(11) NOT NULL DEFAULT 1,
  `dynamic_timezone` tinyint(4) NOT NULL DEFAULT 1,
  `stalker_theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'digital',
  `rtmp_random` tinyint(4) NOT NULL DEFAULT 1,
  `api_ips` text COLLATE utf8_unicode_ci NOT NULL,
  `crypt_load_balancing` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `use_buffer` tinyint(4) NOT NULL DEFAULT 0,
  `restreamer_prebuffer` tinyint(4) NOT NULL DEFAULT 0,
  `audio_restart_loss` tinyint(4) NOT NULL DEFAULT 0,
  `stalker_lock_images` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `channel_number_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bouquet',
  `stb_change_pass` tinyint(4) NOT NULL DEFAULT 0,
  `enable_debug_stalker` tinyint(4) NOT NULL DEFAULT 0,
  `online_capacity_interval` smallint(6) NOT NULL DEFAULT 10,
  `always_enabled_subtitles` tinyint(4) NOT NULL DEFAULT 1,
  `test_download_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `api_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message_of_day` text COLLATE utf8_unicode_ci NOT NULL,
  `double_auth` tinyint(4) NOT NULL DEFAULT 0,
  `mysql_remote_sec` tinyint(4) NOT NULL DEFAULT 0,
  `enable_isp_lock` tinyint(4) NOT NULL DEFAULT 0,
  `show_isps` tinyint(4) NOT NULL DEFAULT 1,
  `userpanel_mainpage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `save_closed_connection` tinyint(4) NOT NULL DEFAULT 1,
  `client_logs_save` tinyint(4) NOT NULL DEFAULT 1,
  `get_real_ip_client` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `case_sensitive_line` tinyint(4) NOT NULL DEFAULT 1,
  `county_override_1st` tinyint(4) NOT NULL DEFAULT 0,
  `disallow_2nd_ip_con` tinyint(4) NOT NULL DEFAULT 0,
  `xc_support_allow` tinyint(2) NOT NULL DEFAULT 0,
  `firewall` tinyint(4) NOT NULL DEFAULT 0,
  `new_sorting_bouquet` tinyint(4) NOT NULL DEFAULT 1,
  `split_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'con',
  `use_mdomain_in_lists` tinyint(4) NOT NULL DEFAULT 0,
  `use_https` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `priority_backup` tinyint(4) NOT NULL DEFAULT 0,
  `tmdb_api_key` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `stalker_container_priority` text COLLATE utf8_unicode_ci NOT NULL,
  `gen_container_priority` text COLLATE utf8_unicode_ci NOT NULL,
  `tmdb_default` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `series_custom_name` tinyint(4) NOT NULL DEFAULT 0,
  `mobile_apps` tinyint(4) NOT NULL DEFAULT 0,
  `mag_security` tinyint(4) NOT NULL DEFAULT 0,
  `rbackup_enable` tinyint(4) DEFAULT 0,
  `drop_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lbackup_enable` tinyint(4) DEFAULT 0,
  `lbackup_dir` text COLLATE utf8_unicode_ci DEFAULT '/home/streamcreed/backups',
  `adult_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lb_ip_check` tinyint(4) NOT NULL DEFAULT 0,
  `cs_block_types` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `streaming_servers` (
  `id` int(11) NOT NULL,
  `server_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `server_isp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `broadcast` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `broadcast_internal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssh_password` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssh_port` int(11) DEFAULT NULL,
  `diff_time_main` int(11) NOT NULL DEFAULT 0,
  `http_broadcast_port` int(11) NOT NULL,
  `total_clients` int(11) NOT NULL DEFAULT 0,
  `network_interface` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latency` float NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT -1,
  `enable_geoip` int(11) NOT NULL DEFAULT 0,
  `geoip_countries` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `last_check_ago` int(11) NOT NULL DEFAULT 0,
  `total_services` int(11) NOT NULL DEFAULT 3,
  `rtmp_port` int(11) NOT NULL DEFAULT 8001,
  `geoip_type` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'low_priority',
  `isp_names` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `isp_type` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'low_priority',
  `enable_isp` tinyint(4) NOT NULL DEFAULT 0,
  `boost_fpm` tinyint(4) NOT NULL DEFAULT 0,
  `http_ports_add` text COLLATE utf8_unicode_ci NOT NULL,
  `network_guaranteed_speed` int(11) NOT NULL DEFAULT 0,
  `https_broadcast_port` int(11) NOT NULL DEFAULT 25463,
  `https_ports_add` text COLLATE utf8_unicode_ci NOT NULL,
  `watchdog_data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `whitelist_ips` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `timeshift_only` tinyint(4) NOT NULL DEFAULT 0,
  `nginx_config` longtext COLLATE utf8_unicode_ci NOT NULL,
  `full_duplex` tinyint(4) NOT NULL DEFAULT 1,
  `extra_ips` longtext COLLATE utf8_unicode_ci NOT NULL,
  `vod_output_folder` text COLLATE utf8_unicode_ci NOT NULL,
  `redis_port` int(11) NOT NULL DEFAULT 25460
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `streams` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `stream_display_name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `stream_source` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_icon` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_channel_location` int(11) DEFAULT NULL,
  `enable_transcode` tinyint(4) NOT NULL DEFAULT 0,
  `transcode_attributes` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_ffmpeg` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `movie_propeties` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `movie_subtitles` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `read_native` tinyint(4) NOT NULL DEFAULT 1,
  `target_container` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_all` tinyint(4) NOT NULL DEFAULT 0,
  `remove_subtitles` tinyint(4) NOT NULL DEFAULT 0,
  `custom_sid` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epg_id` int(11) DEFAULT NULL,
  `channel_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epg_lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `auto_restart` text COLLATE utf8_unicode_ci NOT NULL,
  `transcode_profile_id` int(11) NOT NULL DEFAULT 0,
  `pids_create_channel` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `cchannel_rsources` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `gen_timestamps` tinyint(4) NOT NULL DEFAULT 1,
  `added` int(11) NOT NULL,
  `series_no` int(11) NOT NULL DEFAULT 0,
  `direct_source` tinyint(4) NOT NULL DEFAULT 0,
  `tv_archive_duration` int(11) NOT NULL DEFAULT 0,
  `tv_archive_server_id` int(11) NOT NULL DEFAULT 0,
  `tv_archive_pid` int(11) NOT NULL DEFAULT 0,
  `movie_symlink` tinyint(4) NOT NULL DEFAULT 0,
  `redirect_stream` tinyint(4) NOT NULL DEFAULT 0,
  `rtmp_output` tinyint(4) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL,
  `allow_record` tinyint(4) NOT NULL DEFAULT 0,
  `probesize_ondemand` int(11) NOT NULL DEFAULT 128000,
  `custom_map` text COLLATE utf8_unicode_ci NOT NULL,
  `external_push` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `delay_minutes` int(11) NOT NULL DEFAULT 0,
  `is_adult` tinyint(4) NOT NULL DEFAULT 0,
  `is_website` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `streams_arguments` (
  `id` int(11) NOT NULL,
  `argument_cat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `argument_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `argument_description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `argument_wprotocol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `argument_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `argument_cmd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `argument_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `argument_default_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `streams_options` (
  `id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `argument_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `streams_sys` (
  `server_stream_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `to_analyze` tinyint(4) NOT NULL DEFAULT 0,
  `stream_status` int(11) NOT NULL DEFAULT 0,
  `stream_started` int(11) DEFAULT NULL,
  `stream_info` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `monitor_pid` int(11) DEFAULT NULL,
  `current_source` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `bitrate` int(11) DEFAULT NULL,
  `progress_info` text COLLATE utf8_unicode_ci NOT NULL,
  `on_demand` tinyint(4) NOT NULL DEFAULT 0,
  `delay_pid` int(11) DEFAULT NULL,
  `delay_available_at` int(11) DEFAULT NULL,
  `vod_folder` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `streams_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_output` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `live` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `stream_categories` (
  `id` int(11) NOT NULL,
  `category_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `cat_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `stream_logs` (
  `id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `error` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `admin_read` tinyint(4) NOT NULL,
  `user_read` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tickets_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `admin_reply` tinyint(4) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `transcoding_profiles` (
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile_options` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exp_date` int(11) DEFAULT NULL,
  `admin_enabled` int(11) NOT NULL DEFAULT 1,
  `enabled` int(11) NOT NULL DEFAULT 1,
  `admin_notes` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `reseller_notes` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `bouquet` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `max_connections` int(11) NOT NULL DEFAULT 1,
  `is_restreamer` tinyint(4) NOT NULL DEFAULT 0,
  `allowed_ips` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `allowed_ua` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `is_trial` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `pair_id` int(11) DEFAULT NULL,
  `is_mag` tinyint(4) NOT NULL DEFAULT 0,
  `is_e2` tinyint(4) NOT NULL DEFAULT 0,
  `force_server_id` int(11) NOT NULL DEFAULT 0,
  `is_isplock` tinyint(4) NOT NULL DEFAULT 0,
  `as_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isp_desc` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `forced_country` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `is_stalker` tinyint(4) NOT NULL DEFAULT 0,
  `bypass_ua` tinyint(4) NOT NULL DEFAULT 0,
  `play_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_activity` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `container` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) DEFAULT NULL,
  `geoip_country_code` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `isp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `divergence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_activity_now` (
  `activity_id` int(11) NOT NULL,
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `container` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` int(11) NOT NULL,
  `geoip_country_code` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `isp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `divergence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_output` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_output_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `access_output`
  ADD PRIMARY KEY (`access_output_id`),
  ADD KEY `output_key` (`output_key`),
  ADD KEY `output_ext` (`output_ext`);

ALTER TABLE `blocked_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip_2` (`ip`),
  ADD UNIQUE KEY `ip_3` (`ip`),
  ADD KEY `ip` (`ip`),
  ADD KEY `date` (`date`);

ALTER TABLE `blocked_user_agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exact_match` (`exact_match`),
  ADD KEY `user_agent` (`user_agent`);

ALTER TABLE `bouquets`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `client_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `credits_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `admin_id` (`admin_id`);

ALTER TABLE `devices`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `device_key` (`device_key`),
  ADD KEY `default_output` (`default_output`);

ALTER TABLE `enigma2_actions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `enigma2_devices`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `mac` (`mac`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `enigma2_failed`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `epg`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `epg_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epg_id` (`epg_id`),
  ADD KEY `start` (`start`),
  ADD KEY `end` (`end`),
  ADD KEY `lang` (`lang`),
  ADD KEY `channel_id` (`channel_id`);

ALTER TABLE `isp_addon`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `mag_claims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mag_id` (`mag_id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `real_type` (`real_type`),
  ADD KEY `date` (`date`);

ALTER TABLE `mag_devices`
  ADD PRIMARY KEY (`mag_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mac` (`mac`);

ALTER TABLE `mag_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `mag_device_id` (`mag_device_id`),
  ADD KEY `event` (`event`);

ALTER TABLE `mag_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mag_id` (`mag_id`);

ALTER TABLE `member_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `is_admin` (`is_admin`),
  ADD KEY `is_banned` (`is_banned`),
  ADD KEY `is_reseller` (`is_reseller`),
  ADD KEY `can_delete` (`can_delete`);

ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_trial` (`is_trial`),
  ADD KEY `is_official` (`is_official`),
  ADD KEY `can_gen_mag` (`can_gen_mag`),
  ADD KEY `can_gen_e2` (`can_gen_e2`),
  ADD KEY `only_e2` (`only_e2`),
  ADD KEY `only_mag` (`only_mag`);

ALTER TABLE `panel_logs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reg_userlog`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reg_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_group_id` (`member_group_id`);

ALTER TABLE `reseller_imex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reg_id` (`reg_id`);

ALTER TABLE `restreamers_finder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_reason` (`user_id`,`reason`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reason` (`reason`);

ALTER TABLE `rtmp_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`);

ALTER TABLE `series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `last_modified` (`last_modified`);

ALTER TABLE `series_episodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `season_num` (`season_num`),
  ADD KEY `series_id` (`series_id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `sort` (`sort`);

ALTER TABLE `server_network`
  ADD PRIMARY KEY (`id`),
  ADD KEY `server_id` (`server_id`),
  ADD KEY `sent` (`sent`),
  ADD KEY `received` (`received`),
  ADD KEY `date` (`date`);

ALTER TABLE `streaming_servers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `server_ip` (`server_ip`,`http_broadcast_port`),
  ADD KEY `total_clients` (`total_clients`),
  ADD KEY `status` (`status`);

ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `created_channel_location` (`created_channel_location`),
  ADD KEY `enable_transcode` (`enable_transcode`),
  ADD KEY `read_native` (`read_native`),
  ADD KEY `epg_id` (`epg_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `transcode_profile_id` (`transcode_profile_id`);

ALTER TABLE `streams_arguments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `streams_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `argument_id` (`argument_id`);

ALTER TABLE `streams_sys`
  ADD PRIMARY KEY (`server_stream_id`),
  ADD UNIQUE KEY `stream_id_2` (`stream_id`,`server_id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `server_id` (`server_id`),
  ADD KEY `stream_status` (`stream_status`),
  ADD KEY `stream_started` (`stream_started`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `to_analyze` (`to_analyze`);

ALTER TABLE `streams_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `type_key` (`type_key`),
  ADD KEY `type_output` (`type_output`),
  ADD KEY `live` (`live`);

ALTER TABLE `stream_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_type` (`category_type`),
  ADD KEY `cat_order` (`cat_order`);

ALTER TABLE `stream_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `server_id` (`server_id`);

ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `status` (`status`),
  ADD KEY `admin_read` (`admin_read`),
  ADD KEY `user_read` (`user_read`);

ALTER TABLE `tickets_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

ALTER TABLE `transcoding_profiles`
  ADD PRIMARY KEY (`profile_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `exp_date` (`exp_date`),
  ADD KEY `is_restreamer` (`is_restreamer`),
  ADD KEY `admin_enabled` (`admin_enabled`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `is_trial` (`is_trial`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `pair_id` (`pair_id`),
  ADD KEY `is_mag` (`is_mag`),
  ADD KEY `username` (`username`),
  ADD KEY `password` (`password`),
  ADD KEY `is_e2` (`is_e2`);

ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `server_id` (`server_id`),
  ADD KEY `date_end` (`date_end`),
  ADD KEY `container` (`container`),
  ADD KEY `geoip_country_code` (`geoip_country_code`),
  ADD KEY `date_start` (`date_start`),
  ADD KEY `user_ip` (`user_ip`),
  ADD KEY `user_agent` (`user_agent`);

ALTER TABLE `user_activity_now`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `user_agent` (`user_agent`),
  ADD KEY `token` (`token`),
  ADD KEY `user_ip` (`user_ip`),
  ADD KEY `container` (`container`),
  ADD KEY `pid` (`pid`),
  ADD KEY `geoip_country_code` (`geoip_country_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `stream_id` (`stream_id`),
  ADD KEY `server_id` (`server_id`),
  ADD KEY `date_start` (`date_start`);

ALTER TABLE `user_output`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `access_output_id` (`access_output_id`);


ALTER TABLE `access_output`
  MODIFY `access_output_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `blocked_ips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `blocked_user_agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `bouquets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `client_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `credits_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `devices`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
ALTER TABLE `enigma2_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `enigma2_devices`
  MODIFY `device_id` int(12) NOT NULL AUTO_INCREMENT;
ALTER TABLE `enigma2_failed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `epg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `epg_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `isp_addon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `mag_claims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `mag_devices`
  MODIFY `mag_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `mag_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `mag_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `member_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `panel_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24938;
ALTER TABLE `reg_userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `reg_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `reseller_imex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `restreamers_finder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `rtmp_ips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `series_episodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `server_network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76074;
ALTER TABLE `streaming_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
ALTER TABLE `streams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `streams_arguments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
ALTER TABLE `streams_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `streams_sys`
  MODIFY `server_stream_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `streams_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE `stream_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `stream_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tickets_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `transcoding_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `user_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `user_activity_now`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `user_output`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
