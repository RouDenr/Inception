<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', ) );

/** Database username */
define( 'DB_USER', getenv('WD_DB_USER' );

/** Database password */
define( 'DB_PASSWORD', getenv('WD_DB_PASS' );

/** Database hostname */
define( 'DB_HOST', getenv('WD_DB_HOST' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '-Cos8o|bqE(FL$q>rso)EkaL[jtoxhA^Y(JRxH$d!D#FxleFI/XiZYIS|OIx/i|2');
define('SECURE_AUTH_KEY',  '1OYX?8-(6(V?C=~!KZ*0$j X;-n}P$:?L--SO<38D-eMzajhEbAb|Xz}Z@MK>lTg');
define('LOGGED_IN_KEY',    'MG+~@Eu6:Zz=8WQkIi2Ikmh [e[1@S83]sI|sQnNhdNWrVld|0i/jqVskXHb0#sf');
define('NONCE_KEY',        '6|* Q?X;pV%Z0):+-~-7bcxB!!K]`,&eZfK6+`}70LSo6tS-4Y>:yBv4MVNQuJCt');
define('AUTH_SALT',        '/^@%16Fz^=}<]bu( u^A9:S`hM0!7o[+ubj=H<E<]^c^_NGu^$@!KVQ`udcf=-@<');
define('SECURE_AUTH_SALT', '#avHoGJ7$4TB|Up&*[nT?9LN:_j>7!p Tf-Ch}88NJ x,~x;Kwo 5bC-|k/xD)dA');
define('LOGGED_IN_SALT',   'F+bPz{!X<Wd|@-#2?MXGCR&L2-Jx26`56y^RNFjiRpTQWP[+XX@*[{vF~,_^g-~7');
define('NONCE_SALT',       'e>g~@}O0ITce4q>{d+[3Zw|@D-YnIDe*]*aECj7bl)w;.IR|ZyfDp2sSD_`//n0{');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
