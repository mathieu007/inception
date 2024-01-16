<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('DB_WP_NAME'));

/** Database username */
define( 'DB_USER', getenv('DB_WP_USER'));

/** Database password */
define( 'DB_PASSWORD', getenv('DB_WP_PASS'));

/** Database hostname */
define( 'DB_HOST', getenv('DB_HOST') . ":" . getenv('DB_WP_PORT'));

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
define('AUTH_KEY',         'Sb-UCQ;!wvN/3Uc|U}Y%{3B|= ts=^&4g|Y9U{fWI3rOaF]#3D+ePk:9zRb-T|rw');
define('SECURE_AUTH_KEY',  'yO@j:9M*8M7o@*LTRX`bh|!s04WZaIxI&ppM/1Iky`.&:F~J$b:;p4$L3PzaJ,.9');
define('LOGGED_IN_KEY',    'vPH)q9ZX,|V9NjJ?KZACYR]JZ4R!i:F:OVu6%Z`hMZF:?F);3Q?7:|W^G|!)VL8S');
define('NONCE_KEY',        'B6,rEsKz{YFZyNecvti+h-[ ,JFhb|1!{{qbq)bRF*bzfs>pt q1OghR/]3/Z:P+');
define('AUTH_SALT',        'tnq//PNzwAMiUwpKY<o,0yS#7XRyZd]e+^B><b|H+w9k+gX%/n)*4,mQ5ln`/>ng');
define('SECURE_AUTH_SALT', 'A(Zf)OLUjV|/!rpJX!}),<@pxF/5Xc`#T/FHX~P~edS!e,%t<,T|6x+_h}o--~2f');
define('LOGGED_IN_SALT',   'eV#!CkwWBkyV/;kOfM*0wb`,=VD9jynuj7^%`oKhU6WwU+zBW$2d2PrRYiQD^M#-');
define('NONCE_SALT',       '&+!nt V-b9Z,@i]zbH+i@VCB/?kejSGi2)#(dwVvvbWP4G&:nddVAx$K!>pDGon ');

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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
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