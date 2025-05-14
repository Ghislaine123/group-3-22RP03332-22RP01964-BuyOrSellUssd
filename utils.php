<?php
// USSD Application Constants
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'buy_rent_ussd');

// Session States
define('INITIAL_STATE', 'INITIAL');
define('REGISTRATION_STATE', 'REGISTRATION');
define('BUYER_MENU_STATE', 'BUYER_MENU');
define('SELLER_MENU_STATE', 'SELLER_MENU');

// Response Types
define('CONTINUE_SESSION', 'CON');
define('END_SESSION', 'END');

// Menu Options
define('GO_BACK', '0');
define('GO_TO_MAIN_MENU', '00');

// User Roles
define('BUYER_ROLE', 'buyer');
define('SELLER_ROLE', 'seller');

// House Types
define('RENT_TYPE', 'rent');
define('SALE_TYPE', 'sale');

// Request Status
define('PENDING_STATUS', 'pending');
define('ACCEPTED_STATUS', 'accepted');
define('REJECTED_STATUS', 'rejected');

// SMS Templates
define('BUYER_REGISTRATION_SMS', 'Welcome to Mini House Rental! You are now registered as a Buyer. Your PIN: %s');
define('SELLER_REGISTRATION_SMS', 'Welcome to Mini House Rental! You are now registered as a Seller. Your PIN: %s');
define('HOUSE_REQUEST_SMS', 'New request received for your property: %s from %s');
define('REQUEST_ACCEPTED_SMS', 'Good news! Your request for %s has been accepted by the seller');
define('REQUEST_REJECTED_SMS', 'Your request for %s has been rejected by the seller');
?>
