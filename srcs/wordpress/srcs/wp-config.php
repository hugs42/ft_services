<?php
define( 'DB_NAME', 'wpdb' );

define( 'DB_USER', 'root' );

define( 'DB_PASSWORD', 'toor' );

define( 'DB_HOST', 'mysql' );

define( 'DB_CHARSET', 'utf8' );

define('FS_METHOD', 'direct');

define( 'DB_COLLATE', '' );

define('AUTH_KEY',         'hKJxG^$[kTa--1h,G%YoYV+0X2.l$~<~P/@ujmip5ug2if}zd+xqO4ZcaF`j+fWy');
define('SECURE_AUTH_KEY',  '^%>F0TPZ-rX:@Oh<B{= 8f-E>IzIgTfaUWbq~WhBa?{fjt<<XwS;.J-RQxe+E0~6');
define('LOGGED_IN_KEY',    'g+dO9Dq}ks&RRA3#>7Ex&-;{gZsBsQP1n8X{.`by@cETz7n*j0od[pw,k+#^3Jo%');
define('NONCE_KEY',        'Y5c=eH+|m^G<R[lR;L&86]]7E]sxY_0VK`5yT)1>zn:bma7I:Dad5f-Ptm@. J))');
define('AUTH_SALT',        'rguzq@)Y27%%]P[Qn]6g-d&s5UJ@y_3_12q~i|3%|p{x&}GWt7t^Bem40:[UU(:L');
define('SECURE_AUTH_SALT', 'rg`iY7d}uBmxc 3ByGwWOT!Q{}GO}euq=WXlFt6i_U~~-mgF|6tG$v-Q<8iYUGN}');
define('LOGGED_IN_SALT',   'Zf#{E&N[D49]Z[hO@ViSjI*(u)avNm:P:E1o{G?`mwHh]WAC=X__x8e+GjSiB1ON');
define('NONCE_SALT',       '6bAWL<cR-~g|[!($%ZiK0[*3$CKu9nKmx,lOT%-x9-pIk-?![ a|@CqT?JT:,{R;');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', __DIR__ . '/' );

require_once ABSPATH . 'wp-settings.php';
