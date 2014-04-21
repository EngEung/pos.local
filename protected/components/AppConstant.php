<?php 

# Application Constants 
# Date: 2013-06-29
# Author: Sith Kong
# Copyright: Kaizen Solution LLC 

class AppConstant extends CApplicationComponent {
	#
	# menus
	#
	const MENU_TOP_MENU = "TOP_MENU";
	const MENU_LEFT_SIDE_NAV_MANU = "LEFT_SIDE_NAV_MENU";
	const MENU_ADMIN_TOP_MENU = "ADMIN_TOP_MENU";
	const MENU_ADMIN_LEFT_SIDE_NAV_MENU = "ADMIN_LEFT_SIDE_NAV_MENU";
	const MENU_ACCOUNT_CONFIG_MENU = "ACCOUNT_CONFIG_MENU";
	const MENU_ACCOUNT_DATA_ANALYSIS_MENU = "ACCOUNT_DATA_ANALYSIS_MENU";
	const MENU_ACCOUNT_MARKETING_RESEARCH_MENU = "ACCOUNT_MARKETING_RESEARCH_MENU";
	
	const MENU_CONFIG_TEXT  = 'Configurations';
	const MENU_DATA_ANALYSIS_TEXT = 'Data Analysis';
	const MENU_MARKETING_RESEARCH_TEXT = 'Marketing Researches';

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
	# TV channels
	# 
	const CHANNEL_TV3 = "TV3";
	const CHANNEL_TV5 = "TV5";
	const CHANNEL_TVK = "TVK";
	const CHANNEL_TV9 = "TV9";
	const CHANNEL_TV11 = "TV11";
	const CHANNEL_BAYON = "BAYON";
	const CHANNEL_BAYON_NEWS = "BAYON.NEWS";
	const CHANNEL_CTN = "CTN";
	const CHANNEL_MYTV = "MYTV";
	const CHANNEL_CNC = "CNC";
	const CHANNEL_HANGMEAS = "HANGMEAS";
	const CHANNEL_SEATV = "SEATV";
	const CHANNEL_CTV8 = "CTV8";
	const CHANNEL_PPCTV = "PPCTV";
	const CHANNEL_CCTV = "CCTV";
	const CHANNEL_RSBB = "RSBB";
	const CHANNEL_SUN = "SUN";
	const CHANNEL_RSHMBB = "RSHMBB";
	const CHANNEL_CTVKPC = "CTVKPC";
	const CHANNEL_ANGKOR = "ANGKOR";
	const CHANNEL_RMSTAR = "RMSTAR";
	const CHANNEL_KAMCO = "KAMCO";
	const CHANNEL_THAI = "THAI";
	const CHANNEL_VN = "VN";
	const CHANNEL_XXCB = "XXCB";
	#
	# File types
	#	 
	const FILE_TYPE_PICTURE_CUSTOMER= "PICTURE_FOR_CUSTOMER";
	
}
