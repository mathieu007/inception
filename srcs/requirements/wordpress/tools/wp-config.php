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
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'math123456' );

/** Database password */
define( 'DB_PASSWORD', 'pass123456' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306');

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
define( 'AUTH_KEY',         '/D*Ai:UH/M-4nZb):Atv40H2?BPyT2mmW/[E(Uc*M_}vf[;p*0(/ZaQ*v:k:nuy,UXWD%7bQaPj6a/AHqTk)p)_3Wy9eLPq_{4JD' );
define( 'SECURE_AUTH_KEY',  'cc.m*0H[Y#[=F68M]z@u3ekFGaT40SuJ$_,0_m#QF$a621Ed6f1h4vS=ZTEVCjh{RkF}@b-B4{LZ&hNyy_,yY3;#Mf?aWL{Gf//U' );
define( 'LOGGED_IN_KEY',    'z2iL}L{}q[dR%CTgg{YeTD32[?Y*f92(raJPd)Zu5&GbEbf[.+j9H*3jr$ue,%nZeM8yLwf&-Y+y.Wm{8*uGq6G3}Ya5t?+19MyN' );
define( 'NONCE_KEY',        '9k/b!6{F-04V5!GnHLE20e1Vy%qXjH=(=y);#&Q:ck8qP)KAY23-GL5$!;]fnjEa8B}Byu2GnN5YYARXzC&gD[Zxb$DLdiHC+EHF' );
define( 'AUTH_SALT',        '86wUrN3W=qW,C};*%SNN}y*c_t5eK?+W/Zfj&Y7j&W.0FS0H;i#v1%UQ5qW:1hVWi)([Ymg1i,9fehF6,vE{xR3P?$=b2Xdm3{Kq' );
define( 'SECURE_AUTH_SALT', '*/g98j7jgR(@hDNxduF7Q/*hVm2hJ-.r4*WFbBF7aTkL;UC394J0Aq9]8z5Bwa=H@T]D?@N(/C0tNvQt0{xZASkS7B9WVc4*t{,(' );
define( 'LOGGED_IN_SALT',   '9aC]Ze_UMvqjR02gjZ)4E8Me]3dQZ0LLB&]LXV[2)Brt!@6ZT3baSTR9x)e-5n&Jjg6zWQ#8B{vn=%Gh6KeuEeV#xQ6Uc-:ZN_C0' );
define( 'NONCE_SALT',       ')zS%)jSX2MAb-eHzhtfR__%n}6LF5#z:.AfRDBC*(GaxN:uWZ#ME6neaSXJYkvz8w-,t#=yH7&.?ST/ZS{HK5]c}50uY*-GRBGd%' );

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