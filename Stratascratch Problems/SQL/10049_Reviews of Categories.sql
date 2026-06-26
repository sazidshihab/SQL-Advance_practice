create database `10049_reviews_of_categories`;
use `10049_reviews_of_categories`;

create table yelp_business(
address text,
business_id text,
categories text,
city text,
is_open bigint,
latitude double,
longitude double,
name text,
neighborhood text,
postal_code text,
review_count bigint,
stars double,
state text
);

insert into yelp_business(business_id,	name,	neighborhood,	address,	city,	state,	postal_code,	latitude,	longitude,	stars,	review_count,	is_open,	categories) values
('G5ERFWvPfHy7IDAUYlWL2A', 'All Colors Mobile Bumper Repair', NULL, '7137 N 28th Ave', 'Phoenix', 'AZ', '85051', 33.45, -112.07, 1, 4, 1, 'Auto Detailing;Automotive'),
('0jDvRJS-z9zdMgOUXgr6rA', 'Sunfare', NULL, '811 W Deer Valley Rd', 'Phoenix', 'AZ', '85027', 33.68, -112.08, 5, 27, 1, 'Personal Chefs;Food;Gluten-Free;Food Delivery Services;Event Planning & Services;Restaurants'),
('6HmDqeNNZtHMK0t2glF_gg', 'Dry Clean Vegas', 'Southeast', '2550 Windmill Ln, Ste 100', 'Las Vegas', 'NV', '89123', 36.04, -115.12, 1, 4, 1, 'Dry Cleaning & Laundry;Laundry Services;Local Services;Dry Cleaning'),
('pbt3SBcEmxCfZPdnmU9tNA', 'The Cuyahoga Room', NULL, '740 Munroe Falls Ave', 'Cuyahoga Falls', 'OH', '44221', 41.14, -81.47, 1, 3, 0, 'Wedding Planning;Caterers;Event Planning & Services;Venues & Event Spaces'),
('CX8pfLn7Bk9o2-8yDMp_2w', 'The UPS Store', NULL, '4815 E Carefree Hwy, Ste 108', 'Cave Creek', 'AZ', '85331', 33.8, -111.98, 1.5, 5, 1, 'Notaries;Printing Services;Local Services;Shipping Centers'),
('yzAB_pRwk8FJl3aILiiySA', 'CenturyLink', 'Spring Valley', '4850 S Fort Apache Rd, Ste 100', 'Las Vegas', 'NV', '89147', 36.1, -115.3, 1.5, 35, 0, 'Home Services;Television Service Providers;Professional Services;Internet Service Providers;Utilities'),
('p8keQs0xw0TzP0JjYPiZPQ', 'The Enfield Fox', NULL, '285 Enfield Place', 'Mississauga', 'ON', 'L5B 3Y6', 43.59, -79.64, 1.5, 3, 0, 'Bars;Restaurants;Pubs;British;Nightlife'),
('lbxfIXUNUdSRO2t7z2PxPA', 'Budget Car Rental', NULL, '7125 E Shea Blvd, Ste 101', 'Scottsdale', 'AZ', '85254', 33.58, -111.93, 2, 6, 1, 'Hotels & Travel;Car Rental'),
('xxCrRqqICzQyR0Q-iqCrNw', 'Subway', 'Plaza Midwood', '1300 The Plz', 'Charlotte', 'NC', '28205', 35.22, -80.81, 2, 13, 1, 'Fast Food;Sandwiches;Restaurants'),
('WdQP8kl9SzcOdubWz0Rs5g', 'Red Beard Bodywork And Structural Integration', 'Capitol', '301 S Bedford St', 'Madison', 'WI', '53703', 43.07, -89.39, 5, 10, 1, 'Rolfing;Health & Medical;Beauty & Spas;Massage'),
('g6KfICYxIFoXnz7KHzQDpw', 'Chase Bank', NULL, '705 S Green Valley Pkwy', 'Henderson', 'NV', '89052', 36, -115.08, 2, 6, 1, 'Financial Services;Banks & Credit Unions'),
('Lhtl6hEr4BaAR4aA3RQDNQ', 'Dairy Queen', NULL, '475 W Craig Rd', 'North Las Vegas', 'NV', '89032', 36.24, -115.15, 2, 57, 1, 'Food;Ice Cream & Frozen Yogurt'),
('6FmJM2SYWoUv_DC8FA7hpg', '1st Choice Storage Solutions', 'Southeast', '6360 S Pecos Rd, Ste 14', 'Las Vegas', 'NV', '89120', 36.07, -115.1, 2, 7, 0, 'Shopping;Home & Garden;Home Services;Cabinetry;Furniture Stores'),
('JJWQxF7ljXKVvCxn3ug-CA', 'Applebee''s Neighborhood Grill & Bar', NULL, '13756 W Bell Rd', 'Surprise', 'AZ', '85374', 33.64, -112.36, 2.5, 56, 1, 'Burgers;Bars;American (Traditional);Nightlife;Restaurants;Sports Bars;Steakhouses'),
('3rptIkeGoVRdPF4v6omLOg', 'Sunless Boutique', 'The Lakes', '9921 Mahogany Grove Ln', 'Las Vegas', 'NV', '89117', 36.14, -115.31, 5, 20, 1, 'Hair Removal;Beauty & Spas;Skin Care;Tanning;Spray Tanning;Hair Salons'),
('JGvyv9jO8kfEnf4WtnpzfQ', 'Dairy Queen', NULL, '13623 W Camino Del Sol', 'Sun City West', 'AZ', '85375', 33.65, -112.36, 2.5, 16, 1, 'Restaurants;Ice Cream & Frozen Yogurt;Fast Food;Food'),
('dRb2Xq8jorJV6tDCgmaQUg', 'Papa John''s Pizza', NULL, '703 E Bell Rd', 'Phoenix', 'AZ', '85022', 33.64, -112.07, 5, 3, 1, 'Restaurants;Pizza'),
('r7MJN_4aJdNP_mx6u_4czQ', 'Red Roof Inn', NULL, '7400 W Boston St', 'Chandler', 'AZ', '85226', 33.3, -111.97, 2.5, 3, 0, 'Hotels;Hotels & Travel;Event Planning & Services'),
('_QEwts97jzVcvfVo4qveFA', 'Integrated Pain Specialists', 'Spring Valley', '9333 W Sunset Rd, Ste A', 'Las Vegas', 'NV', '89148', 36.07, -115.3, 2.5, 8, 0, 'Health & Medical;Physical Therapy'),
('-M9S1wlZTvv6T9EOo5X2Yw', 'Grandeur Palace', 'Scarborough', '2301 Brimley Road, Unit 128', 'Toronto', 'ON', 'M1S 5B8', 43.8, -79.27, 2.5, 46, 1, 'Restaurants;Seafood;Chinese;Dim Sum'),
('-03HVYxkeYWaafEpNJo1SA', 'GoodLife Vapes', 'Mount Pleasant and Davisville', '2095 Yonge Street', 'Toronto', 'ON', 'M4S 2A5', 43.7, -79.4, 5, 5, 1, 'Vape Shops;Shopping;Electronics;Tobacco Shops'),
('Wd81DI2DICRtANydqJlFtQ', 'Brock Doors and Windows', NULL, '278 Orenda Road', 'Brampton', 'ON', 'L6T 4X6', 43.7, -79.72, 5, 3, 1, 'Home Services;Windows Installation;Garage Door Services;Contractors'),
('zXY_rBLlE2Kb_D1FZ8bH9g', 'Crabby Joe''s', NULL, '450 Holland Street W', 'Bradford', 'ON', 'L3Z 0G1', 44.11, -79.59, 2.5, 5, 1, 'Bars;Restaurants;Nightlife;American (Traditional);Burgers'),
('aYSSqa0M5DZHjLT_jK5ezw', 'Amego Electric Vehicles', NULL, '533 Richmond Street W', 'Toronto', 'ON', 'M5V 3Y1', 43.65, -79.4, 2.5, 3, 1, 'Bike Rentals;Motorcycle Dealers;Active Life;Shopping;Bikes;Sporting Goods;Automotive'),
('diH4Pf4mYd1P-zZsQErVTQ', 'PetSmart', NULL, '7077 E Mayo Blvd Ste 140', 'Phoenix', 'AZ', '85054', 33.65, -111.93, 3, 28, 1, 'Pet Training;Pet Stores;Pets;Pet Groomers;Pet Services;Pet Sitting'),
('OZC42gnhlJ_auXduDRfMoQ', 'Scratch', NULL, '1011 N 3rd St', 'Phoenix', 'AZ', '85004', 33.46, -112.07, 3, 40, 0, 'French;Restaurants'),
('m5h7_IeiGaY4Z1ns1y8veQ', 'Arizona Custom Canine', NULL, '', 'Phoenix', 'AZ', '85086', 33.84, -112.12, 5, 13, 1, 'Dog Walkers;Pet Training;Pet Services;Pets;Pet Sitting'),
('U1QABk2PSkzTfHfPb_tZgA', 'Visionworks', NULL, 'Fiesta Mall, 1445 W Southern Ave, Ste 2192', 'Mesa', 'AZ', '85202', 33.39, -111.86, 3, 8, 0, 'Health & Medical;Shopping;Eyewear & Opticians;Optometrists'),
('IiKKDb5sS1KIAf5jjfmApg', 'Sun Valley Hand Surgery', NULL, '15830 N 35th Ave, Ste 2', 'Phoenix', 'AZ', '85053', 33.63, -112.13, 5, 4, 0, 'Doctors;Orthopedists;Health & Medical;Sports Medicine'),
('rkSUOnANSaB3E9qMHhfpcA', 'Schwan''s', NULL, '', 'Phoenix', 'AZ', NULL, 33.45, -112.07, 3, 3, 1, 'Ice Cream & Frozen Yogurt;Food'),
('xhzUfaJ9BTa3EbD0bTeKWQ', 'IHOP', NULL, '10662 E Southern Ave', 'Mesa', 'AZ', '85209', 33.39, -111.6, 3, 45, 1, 'Breakfast & Brunch;Restaurants;American (New);American (Traditional)'),
('JbWQtVLQDEOBlvbVWk2OFg', 'Chipotle Mexican Grill', NULL, '903 W Anthony Dr, Ste A', 'Champaign', 'IL', '61820', 40.14, -88.26, 5, 40, 1, 'Fast Food;Mexican;Restaurants'),
('J8DxZ7enKZ0aAuF40e3rew', 'Charlotte Dentist: Joseph LoParo, DMD', 'Uptown', '400 S Tryon St, Ste M-4', 'Charlotte', 'NC', '28202', 35.22, -80.85, 3, 4, 1, 'Health & Medical;Cosmetic Dentists;Dentists;General Dentistry'),
('zPSPUa9cgl68ydGNZt6gYQ', 'Thrifty Car Rental', NULL, '5330 Wilkinson Blvd', 'Charlotte', 'NC', '28208', 35.23, -80.93, 3, 9, 1, 'Car Rental;Hotels & Travel'),
('ct1uN_FOIyY1er8iLTsS6w', 'Eyeglass World', 'Westside', '3819 W Sahara Ave', 'Las Vegas', 'NV', '89102', 36.14, -115.19, 5, 52, 1, 'Ophthalmologists;Health & Medical;Eyewear & Opticians;Shopping;Optometrists;Doctors'),
('qngp1XfBYWi7lB5S9Mg5ZA', 'Metropolitan Home Design', NULL, '15220 Madison Ave', 'Lakewood', 'OH', '44107', 41.48, -81.8, 5, 3, 0, 'Interior Design;Home Services;Home & Garden;Shopping;Real Estate;Home Staging;Home Decor'),
('cDpUshHyJHDEc19TSTulJw', 'Urbana Acupuncture', NULL, '155-A Lincoln Square Mall', 'Urbana', 'IL', '61801', 40.11, -88.21, 5, 8, 1, 'Naturopathic/Holistic;Traditional Chinese Medicine;Doctors;Acupuncture;Health & Medical'),
('YjfRCKCTqkcL1yTKPIwDlg', 'Savers', NULL, '3121 N Rancho Dr', 'Las Vegas', 'NV', '89130', 36.22, -115.21, 3, 29, 1, 'Shopping;Thrift Stores;Fashion;Used;Vintage & Consignment'),
('4m5g6GUGDN9NqkfA0dk9fA', 'Test America Preview Studios', 'The Strip', '3667 Las Vegas Blvd S, Ste H-82, Desert Passage Mall at the Aladdin', 'Las Vegas', 'NV', '89109', 36.11, -115.17, 3, 10, 1, 'Arts & Entertainment;Local Services'),
('cMlHcrlADb5gRWwFaNKhjg', 'Samurai Sam''s', 'Anthem', '10075 S Eastern Ave, Ste 116', 'Henderson', 'NV', '89052', 36.01, -115.11, 3, 19, 0, 'Asian Fusion;Japanese;Restaurants;Salad'),
('Ett_hy5k5_hI4GvPN9cyHg', 'Ulta Beauty', 'Southeast', '6689 Las Vegas Blvd S', 'Las Vegas', 'NV', '89119', 36.07, -115.17, 5, 24, 1, 'Hair Salons;Blow Dry/Out Services;Beauty & Spas;Cosmetics & Beauty Supply;Hair Extensions;Shopping'),
('MYB1ZMspBk1Xc_awp_PtSw', 'Naked City Pizza Express', 'Southwest', '6935 Blue Diamond Rd', 'Las Vegas', 'NV', '89178', 36.02, -115.24, 3, 46, 1, 'Sandwiches;Chicken Wings;Restaurants;Pizza'),
('FBptd43MkPFZxVLRMz0PFw', 'Orangetheory Fitness Solon', NULL, '6025 Kruse Dr', 'Solon', 'OH', '44139', 41.39, -81.44, 3, 4, 1, 'Fitness & Instruction;Active Life;Gyms;Trainers;Interval Training Gyms;Boot Camps'),
('iQfx6lghJJbrb-fz-toOCQ', 'Swarovski Canada', 'Etobicoke', '25 The West Mall', 'Etobicoke', 'ON', 'M9C 1B8', 43.61, -79.56, 3, 3, 1, 'Home Decor;Shopping;Jewelry;Home & Garden'),
('9O0jWqGnHkBsXMOd-KOl4w', 'Hot and Sour', 'East Credit', '1010 Dreamcrest Road, Unit 2', 'Mississauga', 'ON', 'L5V 3A4', 43.59, -79.68, 3, 20, 1, 'Restaurants;Asian Fusion;Halal;Chinese'),
('z7ns1g4S82kaBdIAC_RMRw', 'Subway', NULL, '1000 Airport Blvd', 'Pittsburgh', 'PA', '15231', 40.49, -80.25, 3, 5, 1, 'Sandwiches;Fast Food;Restaurants'),
('VdoNOOcO8HmLHbmxE_3psA', 'Sonora Quest Laboratories', NULL, '9305 W Thomas Rd, Ste 300', 'Phoenix', 'AZ', '85037', 33.48, -112.26, 3.5, 7, 1, 'Medical Centers;Diagnostic Services;Health & Medical;Laboratory Testing'),
('D3Tpd4SrPAnZ1PaGVRGBfQ', 'Weinstube Klink', NULL, 'Epplestr. 1 C', 'Stuttgart', 'BW', '70597', 48.75, 9.17, 3.5, 3, 1, 'German;Bars;Nightlife;Wine Bars;Restaurants'),
('p3My4o49oL_aOY2M2QLu8w', 'The Chanter', 'Old Town', '30 - 32 Bread Street', 'Edinburgh', 'EDH', 'EH3 9AF', 55.95, -3.2, 5, 21, 1, 'Bars;Nightlife;Pubs'),
('XVDR44P_74FmA0ANanm4CQ', 'House of Pizza', 'Plaza Midwood', '3640 Central Ave', 'Charlotte', 'NC', '28205', 35.22, -80.78, 3.5, 75, 0, 'Greek;Restaurants;Pizza;Italian');



with recursive cte as(
select review_count, substring_index(categories,';',1) as txt, 
substr(categories,length(substring_index(categories,';',1))+2) as 2nd_txt from yelp_business

union all

select review_count,substring_index(2nd_txt,';',1) as txt, substr(2nd_txt,length(substring_index(2nd_txt,';',1))+2) as 2nd_txt from cte
where 2nd_txt != ''
)select txt, sum(review_count) from cte
group by 1
order by 2 desc;