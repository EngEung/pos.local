<?php 

# Application Constants 
# Date: 2013-06-29
# Author: Sith Kong
# Copyright: Kaizen Solution LLC 

class AppConstant extends CApplicationComponent {
	#
	# menus
	#
	const MENU_HORIZONTAL_MENU = "HORIZONTAL_MENU";
	const MENU_VERTICAL_MENU = "VERTICAL_MENU";
	const MENU_ACCORDION_MENU = "ACCORDION_MENU";
	const MENU_TAB_MENU = "TAB_MENU";
	const MENU_SUB_MENU = "SUB_MENU";
	const MENU_SUB_HORIZONTAL_MENU = "SUB_HORIZONTAL_MENU";
	const MENU_SUB_HORIZONTAL_MENU_CHILD = "SUB_HORIZONTAL_MENU_CHILD";
	
	#
	# application
	#
	const APP_URL ="http://khmerauto.local/";
    const APP_SECURITY_URL = "http://khmerauto.local/security/";
    const MY_ACCOUNT_URL = "http://khmerauto.local/account/";
    const EMERGENCY_PHONE_NUMBER = "(980) 833-4732";
    const EMERGENCY_LIVE_CHAT_URL = "http://khmerauto.local/supports/livechat/";
    const R_AMDIN = 'R_ADMIN';
	#
	# vehicle feature types
	#
	const FEATURE_TYPE_COMFORT = 'COMFORT';
	const FEATURE_TYPE_SAFETY = 'SAFETY'; 
	const FEATURE_TYPE_ENTERTAINMENT = 'ENTERTAINMENT'; 
	const FEATURE_TYPE_SEATS = 'SEATS';
	const FEATURE_TYPE_WINDOWS = 'WINDOWS';
	const FEATURE_TYPE_OTHER = 'OTHER';
	# 
	# address types 
	# 
	const AT_BILLING_ADDR = 'AT_BILLING_ADDR';
	const AT_PHYSICAL_ADDR = 'AT_PHYSICAL_ADDR';
	# 
	# email types
	# 
	const ET_WORK_EMAIL = 'AT_WORK_EMAIL'; 
	const ET_PUBLIC_EMAIL = 'ET_PUBLIC_EMAIL';
	const ET_SCHOOL_EMAIL = 'ET_SCHOOL_EMAIL'; 
	const ET_GROUP_EMAIL = 'ET_GROUP_EMAIL'; 
	# 
	# state types 
	# 
	const ST_STATE = 'ST_STATE'; 
	const ST_PROV = 'ST_PROV'; 
	const ST_PREF = 'ST_PRE'; 
	#
	# company types
	# 
	const CT_DEALERSHIP = 'CT_DEALERSHIP'; 
	const CT_AUTO_FINANCE_BANK = 'CT_AUTO_FINANCE_BANK'; 
	const CT_AUTO_INSURANCE_COMPANY = 'CT_AUTO_INSURANCE_COMPANY'; 
	const CT_AUTO_SERVICE_COMPANY = 'CT_AUTO_SERVICE_COMPANY'; 
	#
	# timezone
	#
	const TIMEZONE_AST = 'AST';
	const TIMEZONE_EST = 'EST';
	const TIMEZONE_EDT = 'EDT';
	const TIMEZONE_CST = 'CST';
	const TIMEZONE_CDT = 'CDT';
	const TIMEZONE_MST = 'MST';
	const TIMEZONE_PST = 'PST';
	const TIMEZONE_PDT = 'PDT';
	const TIMEZONE_AKST = 'AKST';
	const TIMEZONE_AKDT = 'AKDT';
	const TIMEZONE_HAST = 'HAST';
	const TIMEZONE_HADT = 'HADT';
	const TIMEZONE_SST = 'SST';
	const TIMEZONE_SDT = 'SDT';
	const TIMEZONE_CHST = 'CHST';
	#
	# fax types
	# 
	const FAX_TYPE_WORK = 'FT_WORK';
	const FAX_TYPE_HOME = 'FT_HOME';
	const FAX_TYPE_OTHER = 'FT_OTHER';
	# 
	# phone types 
	# 
	const PHONE_TYPE_WORK = 'PT_WORK';
    const PHONE_TYPE_HOME = 'PT_HOME';
	const PHONE_TYPE_CELL = 'PT_CELL';
	const PHONE_TYPE_TOLL_FEE = 'PT_TOLL_FEE';
	#
	# image file extensions
	# gif|jpe?g|png
	#
	const IMAGE_EXT_GIF = 'gif';
	const IMAGE_EXT_JPEG = 'jpeg';
	const IMAGE_EXT_JPG = 'jpg';
	const IMAGE_EXT_PNG = 'png';
	#
	# countries
	#
	const COUNTRY_NAME_USA = 'USA';
	const COUNTRY_NAME_KH = 'KH';
	
	#
	# File types
	#	 
	const FILE_TYPE_PICTURE_CUSTOMER = "PICTURE_FOR_CUSTOMER";
	
	
}
