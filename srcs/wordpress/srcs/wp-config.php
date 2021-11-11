<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wpdb' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'toor' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

define('FS_METHOD', 'direct');

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'hKJxG^$[kTa--1h,G%YoYV+0X2.l$~<~P/@ujmip5ug2if}zd+xqO4ZcaF`j+fWy');
define('SECURE_AUTH_KEY',  '^%>F0TPZ-rX:@Oh<B{= 8f-E>IzIgTfaUWbq~WhBa?{fjt<<XwS;.J-RQxe+E0~6');
define('LOGGED_IN_KEY',    'g+dO9Dq}ks&RRA3#>7Ex&-;{gZsBsQP1n8X{.`by@cETz7n*j0od[pw,k+#^3Jo%');
define('NONCE_KEY',        'Y5c=eH+|m^G<R[lR;L&86]]7E]sxY_0VK`5yT)1>zn:bma7I:Dad5f-Ptm@. J))');
define('AUTH_SALT',        'rguzq@)Y27%%]P[Qn]6g-d&s5UJ@y_3_12q~i|3%|p{x&}GWt7t^Bem40:[UU(:L');
define('SECURE_AUTH_SALT', 'rg`iY7d}uBmxc 3ByGwWOT!Q{}GO}euq=WXlFt6i_U~~-mgF|6tG$v-Q<8iYUGN}');
define('LOGGED_IN_SALT',   'Zf#{E&N[D49]Z[hO@ViSjI*(u)avNm:P:E1o{G?`mwHh]WAC=X__x8e+GjSiB1ON');
define('NONCE_SALT',       '6bAWL<cR-~g|[!($%ZiK0[*3$CKu9nKmx,lOT%-x9-pIk-?![ a|@CqT?JT:,{R;');

/**#@-*/

/**
 * WordPress Database Table prefix.
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', __DIR__ . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
