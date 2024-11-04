CREATE DATABASE smartclick_data_warehouse;
\c smartclick_data_warehouse
CREATE TABLE CONSUMER (
    consumer_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(90) NOT NULL,
    age_group VARCHAR(3) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    phone VARCHAR(25) NOT NULL
);

CREATE TABLE PRODUCT (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(80) NOT NULL
);

CREATE TABLE LOCATION (
    location_id SERIAL PRIMARY KEY,
    location_name VARCHAR(85) NOT NULL,
    city VARCHAR(85) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE INTERACTION_TYPE (
    interaction_type_id SERIAL PRIMARY KEY,
    interaction_type_name VARCHAR(25) NOT NULL
);

CREATE TABLE SESSION (
    session_id SERIAL PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    os_used  VARCHAR(50) NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE COMPANY_WEBSITE (
    company_website_id SERIAL PRIMARY KEY,
    website_name VARCHAR(255) NOT NULL
);

CREATE TABLE SERVICE (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(50) NOT NULL,
    service_type VARCHAR(50) NOT NULL
);

CREATE TABLE CONSUMER_INTERACTION (
    consumer_interaction_id SERIAL PRIMARY KEY,
    consumer_id INT NOT NULL,
    company_website_id INT NOT NULL,
    session_id INT NOT NULL,
    service_id INT,
    product_id INT,
    location_id INT NOT NULL,
    interaction_type_id INT NOT NULL,
    total_items_viewed_or_purchased INT NOT NULL,
    total_potential_or_paid_price INT NOT NULL,
    FOREIGN KEY (consumer_id) REFERENCES CONSUMER(consumer_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    FOREIGN KEY (location_id) REFERENCES LOCATION(location_id),
    FOREIGN KEY (interaction_type_id) REFERENCES INTERACTION_TYPE(interaction_type_id),
    FOREIGN KEY (session_id) REFERENCES SESSION(session_id),
    FOREIGN KEY (company_website_id) REFERENCES COMPANY_WEBSITE(company_website_id),
    FOREIGN KEY (service_id) REFERENCES SERVICE(service_id)
);

CREATE TABLE MEANS_USED_TO_WEBSITE (
    reach_id SERIAL PRIMARY KEY,
    reach_means VARCHAR(50) NOT NULL
);

CREATE TABLE CAMPAIGN (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(255) NOT NULL,
    date_from DATE NOT NULL,
    date_to DATE NOT NULL
);

CREATE TABLE MARKETING_PERFORMANCE (
    marketing_performance_id SERIAL PRIMARY KEY,
    campaign_id INT NOT NULL,
    consumer_id INT NOT NULL,
    company_website_id INT NOT NULL,
    reach_id INT NOT NULL,
    session_id INT NOT NULL,
    total_impressions INT NOT NULL,
    total_clicks INT NOT NULL,
    total_revenue_generated INT NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES CAMPAIGN(campaign_id),
    FOREIGN KEY (consumer_id) REFERENCES CONSUMER(consumer_id),
    FOREIGN KEY (reach_id) REFERENCES MEANS_USED_TO_WEBSITE(reach_id),
    FOREIGN KEY (session_id) REFERENCES SESSION(session_id),
    FOREIGN KEY (company_website_id) REFERENCES COMPANY_WEBSITE(company_website_id)
);

/* Inserting data into the tables */

/* Inserting data into the CONSUMER table */
insert into consumer (name, email, age_group, gender, phone) values ('Kristos Ivanonko', 'kivanonko0@mit.edu', 47, 'Male', '6754825100');
insert into consumer (name, email, age_group, gender, phone) values ('Baudoin Rosnau', 'brosnau1@dagondesign.com', 77, 'Male', '5868241205');
insert into consumer (name, email, age_group, gender, phone) values ('Lowrance Rickertsen', 'lrickertsen2@macromedia.com', 40, 'Male', '5945895091');
insert into consumer (name, email, age_group, gender, phone) values ('Farlee MacAlroy', 'fmacalroy3@51.la', 43, 'Male', '1898752696');
insert into consumer (name, email, age_group, gender, phone) values ('Courtney Jaram', 'cjaram4@amazon.com', 23, 'Male', '9104391055');
insert into consumer (name, email, age_group, gender, phone) values ('Tallie Bretherton', 'tbretherton5@usnews.com', 82, 'Female', '1563264848');
insert into consumer (name, email, age_group, gender, phone) values ('Nisse Padkin', 'npadkin6@wikia.com', 91, 'Female', '1188651263');
insert into consumer (name, email, age_group, gender, phone) values ('Modesta Cordy', 'mcordy7@smugmug.com', 67, 'Female', '5974596569');
insert into consumer (name, email, age_group, gender, phone) values ('Kingsley McGawn', 'kmcgawn8@msn.com', 93, 'Male', '3875163774');
insert into consumer (name, email, age_group, gender, phone) values ('Whitman Pancast', 'wpancast9@wikimedia.org', 42, 'Male', '5092222925');
insert into consumer (name, email, age_group, gender, phone) values ('Windy Broadbear', 'wbroadbeara@amazon.co.uk', 53, 'Female', '9271820479');
insert into consumer (name, email, age_group, gender, phone) values ('Korella Watts', 'kwattsb@plala.or.jp', 52, 'Female', '8527936079');
insert into consumer (name, email, age_group, gender, phone) values ('Stacia Bettam', 'sbettamc@mlb.com', 66, 'Female', '7796403955');
insert into consumer (name, email, age_group, gender, phone) values ('Phillipe Chater', 'pchaterd@prlog.org', 37, 'Male', '5505774367');
insert into consumer (name, email, age_group, gender, phone) values ('Lelah Billinge', 'lbillingee@constantcontact.com', 84, 'Female', '2765550762');
insert into consumer (name, email, age_group, gender, phone) values ('Dell Hanselman', 'dhanselmanf@latimes.com', 52, 'Female', '5348013822');
insert into consumer (name, email, age_group, gender, phone) values ('Idaline Maestrini', 'imaestrinig@yelp.com', 37, 'Polygender', '2875263445');
insert into consumer (name, email, age_group, gender, phone) values ('Abigale Lickorish', 'alickorishh@rakuten.co.jp', 91, 'Female', '4772912548');
insert into consumer (name, email, age_group, gender, phone) values ('Micah Smithson', 'msmithsoni@bbb.org', 51, 'Male', '3113978522');
insert into consumer (name, email, age_group, gender, phone) values ('Quincey Purcell', 'qpurcellj@vimeo.com', 67, 'Male', '9915134436');
insert into consumer (name, email, age_group, gender, phone) values ('Nara Zoanetti', 'nzoanettik@gnu.org', 78, 'Genderfluid', '6369071911');
insert into consumer (name, email, age_group, gender, phone) values ('Hortensia Steely', 'hsteelyl@linkedin.com', 70, 'Female', '9708967368');
insert into consumer (name, email, age_group, gender, phone) values ('Bradney Bodiam', 'bbodiamm@stumbleupon.com', 45, 'Male', '1856458422');
insert into consumer (name, email, age_group, gender, phone) values ('Redford Ackery', 'rackeryn@va.gov', 41, 'Male', '7752754609');
insert into consumer (name, email, age_group, gender, phone) values ('Juli Sorrill', 'jsorrillo@quantcast.com', 44, 'Female', '1552765754');
insert into consumer (name, email, age_group, gender, phone) values ('Vivian Domino', 'vdominop@trellian.com', 67, 'Female', '5808542671');
insert into consumer (name, email, age_group, gender, phone) values ('Josh Hamson', 'jhamsonq@elpais.com', 52, 'Male', '3995454540');
insert into consumer (name, email, age_group, gender, phone) values ('Salim Blewett', 'sblewettr@hatena.ne.jp', 36, 'Male', '3973967674');
insert into consumer (name, email, age_group, gender, phone) values ('Ruperta Coils', 'rcoilss@gov.uk', 64, 'Female', '8133886078');
insert into consumer (name, email, age_group, gender, phone) values ('Kingston Spini', 'kspinit@bbb.org', 76, 'Male', '2063593671');
insert into consumer (name, email, age_group, gender, phone) values ('Taddeusz Lismer', 'tlismeru@cargocollective.com', 60, 'Male', '3738523851');
insert into consumer (name, email, age_group, gender, phone) values ('Beth McAuley', 'bmcauleyv@seattletimes.com', 37, 'Female', '9277582564');
insert into consumer (name, email, age_group, gender, phone) values ('Melli Leonard', 'mleonardw@google.nl', 79, 'Female', '5245568892');
insert into consumer (name, email, age_group, gender, phone) values ('Hilliary Jacobsz', 'hjacobszx@cbsnews.com', 66, 'Female', '5424866126');
insert into consumer (name, email, age_group, gender, phone) values ('Robin Fernier', 'rferniery@addtoany.com', 49, 'Male', '3143025704');
insert into consumer (name, email, age_group, gender, phone) values ('Arlen Leggen', 'aleggenz@europa.eu', 57, 'Male', '4597867342');
insert into consumer (name, email, age_group, gender, phone) values ('Ralina Dennis', 'rdennis10@dropbox.com', 39, 'Female', '1837601892');
insert into consumer (name, email, age_group, gender, phone) values ('Basilio Norquay', 'bnorquay11@de.vu', 60, 'Male', '5137301707');
insert into consumer (name, email, age_group, gender, phone) values ('Clarine Richard', 'crichard12@tiny.cc', 41, 'Female', '3968307660');
insert into consumer (name, email, age_group, gender, phone) values ('Olag Rubbert', 'orubbert13@fda.gov', 97, 'Male', '5393331346');
insert into consumer (name, email, age_group, gender, phone) values ('Lilias Puncher', 'lpuncher14@imdb.com', 56, 'Female', '9042384843');
insert into consumer (name, email, age_group, gender, phone) values ('Arnold Trebble', 'atrebble15@facebook.com', 51, 'Male', '3808439076');
insert into consumer (name, email, age_group, gender, phone) values ('Andrey La Vigne', 'ala16@cpanel.net', 19, 'Male', '9641603965');
insert into consumer (name, email, age_group, gender, phone) values ('Moina MacKomb', 'mmackomb17@constantcontact.com', 25, 'Female', '3054172210');
insert into consumer (name, email, age_group, gender, phone) values ('Carce Jakubovics', 'cjakubovics18@youtu.be', 88, 'Male', '5897975231');
insert into consumer (name, email, age_group, gender, phone) values ('Maynard Allum', 'mallum19@huffingtonpost.com', 45, 'Male', '9899529116');
insert into consumer (name, email, age_group, gender, phone) values ('Malanie Clarricoates', 'mclarricoates1a@xing.com', 99, 'Female', '6843277337');
insert into consumer (name, email, age_group, gender, phone) values ('Demetri Kyndred', 'dkyndred1b@blog.com', 45, 'Male', '2427416982');
insert into consumer (name, email, age_group, gender, phone) values ('Cissy McGuiness', 'cmcguiness1c@furl.net', 79, 'Female', '2026470955');
insert into consumer (name, email, age_group, gender, phone) values ('Annamaria Wallentin', 'awallentin1d@weebly.com', 79, 'Female', '3728311880');
insert into consumer (name, email, age_group, gender, phone) values ('Dela Life', 'dlife1e@nih.gov', 57, 'Female', '7389035115');
insert into consumer (name, email, age_group, gender, phone) values ('Ab Fitchett', 'afitchett1f@wired.com', 50, 'Male', '4099269085');
insert into consumer (name, email, age_group, gender, phone) values ('Flo Grigs', 'fgrigs1g@printfriendly.com', 78, 'Female', '5665663218');
insert into consumer (name, email, age_group, gender, phone) values ('Vikky D''Souza', 'vdsouza1h@goodreads.com', 88, 'Female', '4108476083');
insert into consumer (name, email, age_group, gender, phone) values ('Korey Bleas', 'kbleas1i@webs.com', 85, 'Male', '9645947019');
insert into consumer (name, email, age_group, gender, phone) values ('Siffre Gascoine', 'sgascoine1j@gnu.org', 76, 'Male', '4324078608');
insert into consumer (name, email, age_group, gender, phone) values ('Jermayne Basketfield', 'jbasketfield1k@theatlantic.com', 84, 'Genderfluid', '1576402143');
insert into consumer (name, email, age_group, gender, phone) values ('Marv Godilington', 'mgodilington1l@hugedomains.com', 73, 'Male', '2911155068');
insert into consumer (name, email, age_group, gender, phone) values ('Belle Gruszecki', 'bgruszecki1m@apple.com', 27, 'Female', '6252933060');
insert into consumer (name, email, age_group, gender, phone) values ('Levey Roebottom', 'lroebottom1n@wunderground.com', 59, 'Bigender', '5399473509');
insert into consumer (name, email, age_group, gender, phone) values ('Ardys Genthner', 'agenthner1o@imdb.com', 46, 'Female', '8975524384');
insert into consumer (name, email, age_group, gender, phone) values ('Davey Cuer', 'dcuer1p@hp.com', 18, 'Male', '5487288016');
insert into consumer (name, email, age_group, gender, phone) values ('Elizabet Tomlinson', 'etomlinson1q@phoca.cz', 99, 'Bigender', '9792512122');
insert into consumer (name, email, age_group, gender, phone) values ('Leeland Marmion', 'lmarmion1r@purevolume.com', 97, 'Male', '3751916044');
insert into consumer (name, email, age_group, gender, phone) values ('Davey Struijs', 'dstruijs1s@soup.io', 68, 'Male', '7196197873');
insert into consumer (name, email, age_group, gender, phone) values ('Rosco De Roeck', 'rde1t@sakura.ne.jp', 83, 'Bigender', '2012390498');
insert into consumer (name, email, age_group, gender, phone) values ('Maryl Hartill', 'mhartill1u@reddit.com', 33, 'Female', '4177630505');
insert into consumer (name, email, age_group, gender, phone) values ('Alvis Petzold', 'apetzold1v@opensource.org', 22, 'Male', '2878054786');
insert into consumer (name, email, age_group, gender, phone) values ('Charlot Cranmor', 'ccranmor1w@vimeo.com', 25, 'Female', '3532947232');
insert into consumer (name, email, age_group, gender, phone) values ('Valentina Packham', 'vpackham1x@etsy.com', 71, 'Female', '1233738140');
insert into consumer (name, email, age_group, gender, phone) values ('Trefor Cockell', 'tcockell1y@buzzfeed.com', 28, 'Male', '9708214718');
insert into consumer (name, email, age_group, gender, phone) values ('Abel Napoli', 'anapoli1z@mac.com', 87, 'Non-binary', '8096388454');
insert into consumer (name, email, age_group, gender, phone) values ('Sergent Meiklejohn', 'smeiklejohn20@163.com', 95, 'Male', '4562735962');
insert into consumer (name, email, age_group, gender, phone) values ('Darlleen Lere', 'dlere21@google.es', 35, 'Female', '6064685594');
insert into consumer (name, email, age_group, gender, phone) values ('Janella Hayselden', 'jhayselden22@ycombinator.com', 57, 'Female', '9931807815');
insert into consumer (name, email, age_group, gender, phone) values ('Avrom Iacofo', 'aiacofo23@fema.gov', 29, 'Male', '1614456438');
insert into consumer (name, email, age_group, gender, phone) values ('Corine Rennebach', 'crennebach24@java.com', 92, 'Female', '3211245327');
insert into consumer (name, email, age_group, gender, phone) values ('Alfredo Tute', 'atute25@imgur.com', 97, 'Male', '2856611312');
insert into consumer (name, email, age_group, gender, phone) values ('Sula Whorf', 'swhorf26@joomla.org', 50, 'Female', '7339173121');
insert into consumer (name, email, age_group, gender, phone) values ('Kanya Hayler', 'khayler27@wikia.com', 45, 'Female', '3914955162');
insert into consumer (name, email, age_group, gender, phone) values ('Odella Hawthorn', 'ohawthorn28@com.com', 57, 'Female', '5776410513');
insert into consumer (name, email, age_group, gender, phone) values ('Lydon Gartland', 'lgartland29@live.com', 46, 'Male', '9972092666');
insert into consumer (name, email, age_group, gender, phone) values ('Cherida Knapman', 'cknapman2a@myspace.com', 63, 'Female', '4888914597');
insert into consumer (name, email, age_group, gender, phone) values ('Jaquelyn Brower', 'jbrower2b@amazon.com', 83, 'Non-binary', '3926714516');
insert into consumer (name, email, age_group, gender, phone) values ('Ginni Spybey', 'gspybey2c@cmu.edu', 42, 'Female', '5926864522');
insert into consumer (name, email, age_group, gender, phone) values ('Carce Seals', 'cseals2d@soundcloud.com', 36, 'Male', '3204269181');
insert into consumer (name, email, age_group, gender, phone) values ('Clemmy Graalman', 'cgraalman2e@nasa.gov', 96, 'Male', '5472177388');
insert into consumer (name, email, age_group, gender, phone) values ('Cy Burdon', 'cburdon2f@feedburner.com', 95, 'Male', '4492651230');
insert into consumer (name, email, age_group, gender, phone) values ('Maudie Marnes', 'mmarnes2g@angelfire.com', 54, 'Female', '7827624182');
insert into consumer (name, email, age_group, gender, phone) values ('Estell Featherstonhalgh', 'efeatherstonhalgh2h@ask.com', 94, 'Female', '6376216676');
insert into consumer (name, email, age_group, gender, phone) values ('Isaac Hale', 'ihale2i@yahoo.com', 66, 'Male', '6012794786');
insert into consumer (name, email, age_group, gender, phone) values ('Gerek Libri', 'glibri2j@harvard.edu', 70, 'Agender', '9805282981');
insert into consumer (name, email, age_group, gender, phone) values ('Chrysler Girtin', 'cgirtin2k@instagram.com', 18, 'Female', '6106225640');
insert into consumer (name, email, age_group, gender, phone) values ('Roch Older', 'rolder2l@cnbc.com', 53, 'Female', '8589073447');
insert into consumer (name, email, age_group, gender, phone) values ('Kirby Pietruszka', 'kpietruszka2m@liveinternet.ru', 79, 'Female', '1816265341');
insert into consumer (name, email, age_group, gender, phone) values ('Spike Rastrick', 'srastrick2n@admin.ch', 50, 'Male', '6346610005');
insert into consumer (name, email, age_group, gender, phone) values ('Chen Robjant', 'crobjant2o@fc2.com', 64, 'Male', '8836240604');
insert into consumer (name, email, age_group, gender, phone) values ('Broddie Biggadyke', 'bbiggadyke2p@nature.com', 30, 'Male', '1672180129');
insert into consumer (name, email, age_group, gender, phone) values ('Nickolai Camacke', 'ncamacke2q@imageshack.us', 55, 'Male', '8592255293');
insert into consumer (name, email, age_group, gender, phone) values ('Morry Paull', 'mpaull2r@bigcartel.com', 89, 'Male', '1172720587');

/* Inserting data into the Location table */
insert into location (location_name, city, country) values ('Namekagon', 'Bolanon', 'Philippines');
insert into location (location_name, city, country) values ('Dryden', 'Velká Dobrá', 'Czech Republic');
insert into location (location_name, city, country) values ('Hazelcrest', 'Manukaka', 'Indonesia');
insert into location (location_name, city, country) values ('Longview', 'Sorongan', 'Indonesia');
insert into location (location_name, city, country) values ('Rigney', 'Changgai', 'China');
insert into location (location_name, city, country) values ('Clyde Gallagher', 'Novoshakhtinskiy', 'Russia');
insert into location (location_name, city, country) values ('Huxley', 'Lukou', 'China');
insert into location (location_name, city, country) values ('Lien', 'Nāḩiyat Baḩār', 'Iraq');
insert into location (location_name, city, country) values ('Knutson', 'Barueri', 'Brazil');
insert into location (location_name, city, country) values ('Everett', 'La Trinidad', 'Philippines');
insert into location (location_name, city, country) values ('Longview', 'Stockholm', 'Sweden');
insert into location (location_name, city, country) values ('Ludington', 'Uherské Hradiště', 'Czech Republic');
insert into location (location_name, city, country) values ('Green Ridge', 'Jianjiang', 'China');
insert into location (location_name, city, country) values ('Farwell', 'Taourirt', 'Morocco');
insert into location (location_name, city, country) values ('Eggendart', 'Wādī as Sīr', 'Jordan');
insert into location (location_name, city, country) values ('Main', 'Oskarshamn', 'Sweden');
insert into location (location_name, city, country) values ('Morrow', 'Lazaro Cardenas', 'Mexico');
insert into location (location_name, city, country) values ('Acker', 'Bantay', 'Philippines');
insert into location (location_name, city, country) values ('Muir', 'Unión', 'Paraguay');
insert into location (location_name, city, country) values ('Rutledge', 'Mişrātah', 'Libya');
insert into location (location_name, city, country) values ('Mendota', 'Yeşilköy', 'Turkey');
insert into location (location_name, city, country) values ('Acker', 'Taiping', 'China');
insert into location (location_name, city, country) values ('Judy', 'Dorval', 'Canada');
insert into location (location_name, city, country) values ('Village', 'Oklahoma City', 'United States');
insert into location (location_name, city, country) values ('Weeping Birch', 'Saint-Augustin', 'Canada');
insert into location (location_name, city, country) values ('Blue Bill Park', 'Tomteboda', 'Sweden');
insert into location (location_name, city, country) values ('4th', 'Badulla', 'Sri Lanka');
insert into location (location_name, city, country) values ('Independence', 'Ágios Spyrídon', 'Greece');
insert into location (location_name, city, country) values ('Hintze', 'Ljungskile', 'Sweden');
insert into location (location_name, city, country) values ('Badeau', 'Santol', 'Philippines');
insert into location (location_name, city, country) values ('Melvin', 'Kristiansand S', 'Norway');
insert into location (location_name, city, country) values ('Lien', 'Ituverava', 'Brazil');
insert into location (location_name, city, country) values ('Novick', 'Eséka', 'Cameroon');
insert into location (location_name, city, country) values ('Rowland', 'Sumberbening', 'Indonesia');
insert into location (location_name, city, country) values ('Meadow Vale', 'Yuquan', 'China');
insert into location (location_name, city, country) values ('Tony', 'Paris 09', 'France');
insert into location (location_name, city, country) values ('Ruskin', 'San Agustin', 'Philippines');
insert into location (location_name, city, country) values ('Trailsway', 'Shizuoka-shi', 'Japan');
insert into location (location_name, city, country) values ('Mandrake', 'Sīnah', 'Iraq');
insert into location (location_name, city, country) values ('Summerview', 'Atlanta', 'United States');
insert into location (location_name, city, country) values ('Division', 'Kende', 'Nigeria');
insert into location (location_name, city, country) values ('Summit', 'Cô Tô', 'Vietnam');
insert into location (location_name, city, country) values ('Anderson', 'Halmstad', 'Sweden');
insert into location (location_name, city, country) values ('Kipling', 'Dangshun', 'China');
insert into location (location_name, city, country) values ('Cherokee', 'Illéla', 'Niger');
insert into location (location_name, city, country) values ('Northland', 'Pirava', 'Macedonia');
insert into location (location_name, city, country) values ('Nobel', 'Salimbao', 'Philippines');
insert into location (location_name, city, country) values ('Donald', 'Ciepielów', 'Poland');
insert into location (location_name, city, country) values ('Warbler', 'Pho Thong', 'Thailand');
insert into location (location_name, city, country) values ('Hooker', 'Pasto', 'Colombia');

/* Inserting data into the Product table */
insert into product (product_name) values ('Milk - Chocolate 250 Ml');
insert into product (product_name) values ('Flower - Potmums');
insert into product (product_name) values ('Fib N9 - Prague Powder');
insert into product (product_name) values ('Salmon Atl.whole 8 - 10 Lb');
insert into product (product_name) values ('Coffee - Frthy Coffee Crisp');
insert into product (product_name) values ('Lid - 10,12,16 Oz');
insert into product (product_name) values ('Lamb - Whole, Frozen');
insert into product (product_name) values ('Jagermeister');
insert into product (product_name) values ('Rice Pilaf, Dry,package');
insert into product (product_name) values ('Creme De Menth - White');
insert into product (product_name) values ('Joint Security Area (Gongdong gyeongbi guyeok JSA)');
insert into product (product_name) values ('Karlsson on the Roof');
insert into product (product_name) values ('Revenge of the Nerds III: The Next Generation');
insert into product (product_name) values ('Border Run (Mule, The)');
insert into product (product_name) values ('Rosewood Lane');
insert into product (product_name) values ('Look Who''s Talking Now');
insert into product (product_name) values ('Take, The');
insert into product (product_name) values ('Queen of Outer Space');
insert into product (product_name) values ('Murder à la Mod');
insert into product (product_name) values ('At the Earth''s Core');
insert into product (product_name) values ('Nokia 3128');
insert into product (product_name) values ('Plum Check LTE');
insert into product (product_name) values ('ZTE Max XL');
insert into product (product_name) values ('Parla Minu P123');
insert into product (product_name) values ('Icemobile Apollo 3G');
insert into product (product_name) values ('alcatel Roadsign');
insert into product (product_name) values ('Panasonic KX-TU301');
insert into product (product_name) values ('LG K8 (2017)');
insert into product (product_name) values ('Spice QT-50');
insert into product (product_name) values ('Nokia Lumia 925');

/* Inserting data into SESSION table */
insert into session (start_time, end_time, os_used, date) values ('0:18', '6:43', 'Feature phone', '21/01/2020');
insert into session (start_time, end_time, os_used, date) values ('7:22', '9:02', 'Feature phone', '21/07/2023');
insert into session (start_time, end_time, os_used, date) values ('12:43', '23:03', 'Android 3.0, up to 3.2', '28/09/2021');
insert into session (start_time, end_time, os_used, date) values ('10:54', '4:14', 'Microsoft Windows Mobile 6.5 Standard', '16/02/2022');
insert into session (start_time, end_time, os_used, date) values ('1:42', '3:33', 'Android 4.4.2', '01/08/2020');
insert into session (start_time, end_time, os_used, date) values ('2:43', '4:34', 'Feature phone', '27/03/2023');
insert into session (start_time, end_time, os_used, date) values ('0:07', '22:46', 'Android 4.1.2, EMUI 1.6', '13/09/2024');
insert into session (start_time, end_time, os_used, date) values ('7:52', '6:07', 'Feature phone', '13/04/2024');
insert into session (start_time, end_time, os_used, date) values ('16:32', '0:11', 'Feature phone', '04/06/2019');
insert into session (start_time, end_time, os_used, date) values ('17:22', '7:51', 'Feature phone', '20/12/2020');
insert into session (start_time, end_time, os_used, date) values ('1:04', '14:24', 'Feature phone', '13/08/2022');
insert into session (start_time, end_time, os_used, date) values ('12:52', '8:57', 'Microsoft Windows Phone 7.8', '30/05/2023');
insert into session (start_time, end_time, os_used, date) values ('7:53', '2:52', 'Feature phone', '20/09/2022');
insert into session (start_time, end_time, os_used, date) values ('7:37', '15:11', 'Android 11', '22/11/2022');
insert into session (start_time, end_time, os_used, date) values ('23:41', '23:49', 'Symbian 9.4, Series 60 rel. 5', '17/04/2024');
insert into session (start_time, end_time, os_used, date) values ('20:18', '6:00', 'Android 2.3', '21/07/2024');
insert into session (start_time, end_time, os_used, date) values ('14:00', '0:13', 'Android 6.0.1, eUI 5.8', '14/06/2023');
insert into session (start_time, end_time, os_used, date) values ('21:13', '12:28', 'Feature phone', '15/03/2022');
insert into session (start_time, end_time, os_used, date) values ('3:54', '20:46', 'Android 4.2.2, up to 5.0', '01/07/2022');
insert into session (start_time, end_time, os_used, date) values ('10:09', '6:30', 'Microsoft Windows Mobile 6.5 Professional', '24/11/2019');
insert into session (start_time, end_time, os_used, date) values ('18:28', '11:19', 'Feature phone', '25/12/2020');
insert into session (start_time, end_time, os_used, date) values ('1:42', '21:29', 'Feature phone', '23/05/2024');
insert into session (start_time, end_time, os_used, date) values ('23:05', '8:42', 'Android 4.2.2', '21/11/2020');
insert into session (start_time, end_time, os_used, date) values ('5:13', '14:10', 'Microsoft Windows Mobile 5.0 PocketPC', '28/08/2020');
insert into session (start_time, end_time, os_used, date) values ('14:51', '16:07', 'Android 8.1 Oreo', '16/04/2019');
insert into session (start_time, end_time, os_used, date) values ('0:47', '11:21', 'BlackBerry OS', '04/06/2021');
insert into session (start_time, end_time, os_used, date) values ('7:54', '16:36', 'Android 6.0.1', '06/10/2021');
insert into session (start_time, end_time, os_used, date) values ('1:51', '5:03', 'Feature phone', '23/04/2020');
insert into session (start_time, end_time, os_used, date) values ('3:33', '3:42', 'Android 4.4.2', '23/01/2024');
insert into session (start_time, end_time, os_used, date) values ('15:00', '13:14', 'Android 6.0.1, up to 7.1.1', '04/07/2024');
insert into session (start_time, end_time, os_used, date) values ('4:06', '16:46', 'Feature phone', '05/10/2024');
insert into session (start_time, end_time, os_used, date) values ('16:38', '8:03', 'Microsoft Windows Mobile 6.5 Professional', '25/04/2020');
insert into session (start_time, end_time, os_used, date) values ('1:00', '0:21', 'Android 4.0', '10/04/2022');
insert into session (start_time, end_time, os_used, date) values ('0:40', '0:54', 'Android 5.1', '22/02/2024');
insert into session (start_time, end_time, os_used, date) values ('4:50', '13:18', 'Android 9.0, Funtouch 9.2', '18/08/2019');
insert into session (start_time, end_time, os_used, date) values ('19:08', '22:50', 'iOS 9, up to iPadOS 14.6', '27/03/2023');
insert into session (start_time, end_time, os_used, date) values ('1:42', '18:41', 'Feature phone', '21/04/2022');
insert into session (start_time, end_time, os_used, date) values ('17:14', '7:45', 'Android 4.2.2', '29/07/2020');
insert into session (start_time, end_time, os_used, date) values ('17:21', '8:13', 'Android 6.0', '14/08/2020');
insert into session (start_time, end_time, os_used, date) values ('10:06', '11:37', 'Microsoft Windows Phone 8.1', '21/01/2020');
insert into session (start_time, end_time, os_used, date) values ('14:36', '3:12', 'Microsoft Windows Mobile 6.5 Professional', '26/03/2024');
insert into session (start_time, end_time, os_used, date) values ('22:31', '13:13', 'Android 4.0.4, up to 4.1', '11/12/2020');
insert into session (start_time, end_time, os_used, date) values ('2:33', '6:55', 'Android 5.1', '02/02/2024');
insert into session (start_time, end_time, os_used, date) values ('13:20', '4:51', 'Android 7.1, up to Android 8.0', '26/01/2023');
insert into session (start_time, end_time, os_used, date) values ('2:32', '12:18', 'Feature phone', '18/08/2023');
insert into session (start_time, end_time, os_used, date) values ('9:52', '23:16', 'Feature phone', '18/09/2023');
insert into session (start_time, end_time, os_used, date) values ('22:51', '6:36', 'Android 5.1', '07/11/2022');
insert into session (start_time, end_time, os_used, date) values ('21:13', '7:59', 'Android 6.0.1, up to 7.0, Sense UI', '04/07/2022');
insert into session (start_time, end_time, os_used, date) values ('10:42', '10:26', 'Feature phone', '31/05/2020');
insert into session (start_time, end_time, os_used, date) values ('5:11', '7:56', 'Microsoft Windows Mobile 6.0 Professional', '07/06/2019');
insert into session (start_time, end_time, os_used, date) values ('15:46', '0:57', 'Android 6.0.1', '13/05/2024');
insert into session (start_time, end_time, os_used, date) values ('16:35', '13:39', 'Android 9.0', '02/03/2022');
insert into session (start_time, end_time, os_used, date) values ('3:07', '11:10', 'Android 5.1', '22/04/2024');
insert into session (start_time, end_time, os_used, date) values ('6:18', '22:28', 'Android 5.1', '29/03/2023');
insert into session (start_time, end_time, os_used, date) values ('7:42', '14:45', 'Feature phone', '16/06/2020');
insert into session (start_time, end_time, os_used, date) values ('1:07', '20:47', 'Feature phone', '26/04/2022');
insert into session (start_time, end_time, os_used, date) values ('3:17', '8:33', 'Symbian Anna OS', '26/11/2021');
insert into session (start_time, end_time, os_used, date) values ('20:01', '21:01', 'Android 7.0', '01/01/2024');
insert into session (start_time, end_time, os_used, date) values ('7:57', '6:04', 'Android 4.2', '19/02/2023');
insert into session (start_time, end_time, os_used, date) values ('10:53', '2:22', 'Feature phone', '12/05/2023');
insert into session (start_time, end_time, os_used, date) values ('5:19', '21:38', 'Android 10, iQOO UI 1.0', '04/09/2023');
insert into session (start_time, end_time, os_used, date) values ('22:20', '21:06', 'Android 4.2', '17/01/2024');
insert into session (start_time, end_time, os_used, date) values ('16:00', '13:58', 'Android 10, up to Android 11, One UI 3.1', '11/02/2021');
insert into session (start_time, end_time, os_used, date) values ('6:50', '20:51', 'Android 9', '14/10/2020');
insert into session (start_time, end_time, os_used, date) values ('3:44', '2:23', 'Android 5.1', '25/07/2024');
insert into session (start_time, end_time, os_used, date) values ('2:09', '7:04', 'Android 2.2, up to 2.3', '17/04/2021');
insert into session (start_time, end_time, os_used, date) values ('17:34', '4:03', 'Android 10, Realme UI', '29/03/2020');
insert into session (start_time, end_time, os_used, date) values ('23:00', '20:20', 'Android 10, One UI 2.0', '16/12/2023');
insert into session (start_time, end_time, os_used, date) values ('20:19', '2:50', 'Feature phone', '11/01/2023');
insert into session (start_time, end_time, os_used, date) values ('19:00', '10:56', 'Feature phone', '11/04/2021');
insert into session (start_time, end_time, os_used, date) values ('5:40', '23:19', 'Feature phone', '19/07/2024');
insert into session (start_time, end_time, os_used, date) values ('15:09', '18:55', 'Android 6.0', '07/12/2022');
insert into session (start_time, end_time, os_used, date) values ('20:10', '12:09', 'Android 8.1', '04/09/2023');
insert into session (start_time, end_time, os_used, date) values ('0:59', '20:04', 'Android 5.1, Flyme 5', '18/09/2022');
insert into session (start_time, end_time, os_used, date) values ('11:48', '16:48', 'Android 5.0, up to 6.0', '31/12/2019');
insert into session (start_time, end_time, os_used, date) values ('16:28', '23:10', 'Feature phone', '12/06/2020');
insert into session (start_time, end_time, os_used, date) values ('13:42', '21:54', 'Feature phone', '21/07/2022');
insert into session (start_time, end_time, os_used, date) values ('2:35', '0:52', 'Android 4.1', '07/08/2020');
insert into session (start_time, end_time, os_used, date) values ('12:06', '18:09', 'Feature phone', '10/12/2022');
insert into session (start_time, end_time, os_used, date) values ('4:09', '6:35', 'Feature phone', '15/07/2024');
insert into session (start_time, end_time, os_used, date) values ('9:00', '6:08', 'Android 8.1 Oreo', '01/10/2020');
insert into session (start_time, end_time, os_used, date) values ('7:10', '8:38', 'Android 8.0', '31/07/2020');
insert into session (start_time, end_time, os_used, date) values ('5:45', '8:59', 'Android 6.0', '21/09/2022');
insert into session (start_time, end_time, os_used, date) values ('6:11', '21:55', 'Android 4.4.2', '22/05/2024');
insert into session (start_time, end_time, os_used, date) values ('18:48', '8:33', 'Feature phone', '22/02/2024');
insert into session (start_time, end_time, os_used, date) values ('23:26', '7:53', 'Feature phone', '09/03/2024');
insert into session (start_time, end_time, os_used, date) values ('20:54', '3:58', 'Feature phone', '28/04/2022');
insert into session (start_time, end_time, os_used, date) values ('10:42', '18:45', 'Microsoft Windows Mobile 5.0 Smartphone', '20/08/2022');
insert into session (start_time, end_time, os_used, date) values ('8:35', '5:23', 'Android 8.1', '27/12/2021');
insert into session (start_time, end_time, os_used, date) values ('15:48', '6:33', 'Feature phone', '27/05/2021');
insert into session (start_time, end_time, os_used, date) values ('5:58', '2:45', 'Android 5.1', '27/01/2021');
insert into session (start_time, end_time, os_used, date) values ('21:42', '23:26', 'Feature phone', '03/09/2020');
insert into session (start_time, end_time, os_used, date) values ('10:36', '22:54', 'Feature phone', '11/05/2022');
insert into session (start_time, end_time, os_used, date) values ('12:03', '11:47', 'Android 4.4, EMUI 2.3', '03/10/2021');
insert into session (start_time, end_time, os_used, date) values ('19:34', '15:44', 'Android 10', '26/07/2019');
insert into session (start_time, end_time, os_used, date) values ('16:11', '16:13', 'Android 7.0', '03/12/2022');
insert into session (start_time, end_time, os_used, date) values ('14:32', '16:58', 'Android 3.1', '31/08/2020');
insert into session (start_time, end_time, os_used, date) values ('19:56', '3:19', 'Android 4.4.2', '16/09/2023');
insert into session (start_time, end_time, os_used, date) values ('5:18', '2:54', 'Android 5.1, up to 6.0', '03/09/2022');
insert into session (start_time, end_time, os_used, date) values ('10:55', '3:43', 'Feature phone', '11/08/2024');

/* Inserting data into the Interaction_type table */
insert into interaction_type (interaction_type_name) values ('Click');
insert into interaction_type (interaction_type_name) values ('View');
insert into interaction_type (interaction_type_name) values ('Add to basket');
insert into interaction_type (interaction_type_name) values ('Purchase');

/* Inserting data into the means_used_to_website table */
insert into means_used_to_website (reach_means) values ('Direct');
insert into means_used_to_website (reach_means) values ('Organic Web Search');
insert into means_used_to_website (reach_means) values ('Social Media');
insert into means_used_to_website (reach_means) values ('Email Link');
insert into means_used_to_website (reach_means) values ('Web Ad');
insert into means_used_to_website (reach_means) values ('Other');

/* Inserting data into the campaign table */
insert into campaign (campaign_name, date_from, date_to) values ('Exclusive system-worthy matrix', '14/03/2022', '24/01/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Automated web-enabled service-desk', '21/11/2021', '08/09/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Ergonomic 5th generation workforce', '21/07/2021', '17/05/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Right-sized static info-mediaries', '26/11/2021', '10/10/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Down-sized cohesive algorithm', '12/01/2022', '17/11/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Public-key upward-trending encoding', '07/10/2021', '09/08/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Stand-alone 24 hour model', '12/05/2021', '21/06/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Centralized reciprocal standardization', '29/11/2021', '31/08/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Monitored hybrid hierarchy', '19/05/2021', '29/10/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Customizable scalable complexity', '28/06/2021', '10/06/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Future-proofed local function', '12/10/2021', '27/06/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Extended background info-mediaries', '26/10/2021', '23/07/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Innovative intangible attitude', '26/05/2021', '19/10/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Versatile user-facing ability', '06/12/2021', '24/03/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Function-based multi-tasking attitude', '09/06/2021', '04/10/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Virtual mobile process improvement', '06/12/2021', '23/09/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Right-sized intermediate matrices', '11/08/2021', '16/10/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Assimilated hybrid hub', '05/07/2021', '21/08/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Adaptive maximized intranet', '09/10/2021', '27/03/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Enhanced interactive intranet', '11/12/2021', '18/12/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Up-sized global protocol', '08/07/2021', '20/02/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Digitized incremental superstructure', '04/01/2022', '29/08/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Profound secondary function', '11/11/2021', '05/02/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Right-sized holistic installation', '29/04/2022', '17/11/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Business-focused mobile analyzer', '19/07/2021', '13/07/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Function-based background data-warehouse', '16/07/2021', '17/01/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Sharable methodical hardware', '23/06/2021', '21/03/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Ameliorated background circuit', '09/05/2021', '08/08/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Realigned multi-tasking collaboration', '16/04/2022', '10/11/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Multi-channelled bi-directional frame', '20/02/2022', '03/01/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Multi-layered solution-oriented internet solution', '17/09/2021', '03/08/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Quality-focused encompassing complexity', '08/09/2021', '29/05/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Devolved scalable product', '26/10/2021', '11/10/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Robust user-facing Graphic Interface', '30/03/2022', '30/04/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Proactive system-worthy migration', '09/04/2022', '10/09/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Vision-oriented coherent utilisation', '28/11/2021', '02/09/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Business-focused responsive access', '02/01/2022', '22/08/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Grass-roots attitude-oriented leverage', '10/01/2022', '03/09/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Horizontal scalable productivity', '30/06/2021', '23/01/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Centralized bifurcated core', '20/10/2021', '22/07/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Multi-channelled optimizing attitude', '03/12/2021', '13/10/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Total coherent middleware', '14/03/2022', '12/06/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Enhanced demand-driven extranet', '08/01/2022', '27/02/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Proactive context-sensitive solution', '19/10/2021', '18/09/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Mandatory full-range emulation', '07/04/2022', '22/11/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Cross-platform methodical database', '30/09/2021', '14/07/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Re-contextualized methodical superstructure', '21/11/2021', '13/07/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Innovative zero administration database', '18/11/2021', '29/10/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Persevering grid-enabled core', '24/06/2021', '19/10/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Front-line multi-state data-warehouse', '07/09/2021', '27/07/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Virtual maximized knowledge user', '28/05/2021', '04/09/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Operative 6th generation matrix', '02/09/2021', '14/08/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Intuitive next generation website', '23/02/2022', '10/05/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Devolved context-sensitive hierarchy', '12/03/2022', '30/08/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Horizontal mobile application', '06/02/2022', '13/12/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Re-engineered background open architecture', '13/04/2022', '07/09/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Versatile web-enabled capacity', '16/06/2021', '17/11/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Multi-layered cohesive middleware', '10/10/2021', '27/10/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Integrated solution-oriented hub', '06/08/2021', '07/09/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Stand-alone solution-oriented secured line', '22/11/2021', '27/12/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Digitized composite utilisation', '15/09/2021', '28/05/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Customer-focused disintermediate toolset', '24/10/2021', '31/05/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Multi-layered national knowledge user', '22/09/2021', '12/10/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Open-architected client-driven process improvement', '24/08/2021', '26/09/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Down-sized well-modulated algorithm', '28/03/2022', '09/04/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Multi-channelled next generation extranet', '22/11/2021', '04/01/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Function-based bifurcated array', '19/07/2021', '29/06/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Future-proofed tangible intranet', '04/01/2022', '27/06/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Open-source tertiary benchmark', '15/05/2021', '25/10/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Phased exuding website', '07/08/2021', '19/12/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Fundamental composite standardization', '24/08/2021', '13/11/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Stand-alone modular function', '25/05/2021', '18/06/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Innovative radical software', '16/01/2022', '12/05/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Robust reciprocal conglomeration', '02/02/2022', '05/01/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Synergistic dedicated structure', '11/12/2021', '03/09/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Focused static utilisation', '10/04/2022', '11/07/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Progressive multimedia encryption', '22/12/2021', '27/10/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Mandatory user-facing methodology', '22/05/2021', '08/04/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Exclusive multimedia archive', '05/12/2021', '26/03/2023');
insert into campaign (campaign_name, date_from, date_to) values ('User-friendly static utilisation', '13/10/2021', '24/06/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Streamlined bandwidth-monitored neural-net', '25/03/2022', '14/03/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Advanced multimedia workforce', '17/04/2022', '15/09/2022');
insert into campaign (campaign_name, date_from, date_to) values ('Devolved dynamic middleware', '22/11/2021', '03/08/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Multi-tiered stable encryption', '25/12/2021', '25/06/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Persistent uniform software', '15/06/2021', '18/07/2024');
insert into campaign (campaign_name, date_from, date_to) values ('Progressive full-range function', '30/09/2021', '17/07/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Reactive didactic contingency', '07/10/2021', '12/11/2023');
insert into campaign (campaign_name, date_from, date_to) values ('Phased web-enabled parallelism', '02/05/2021', '19/02/2023');

/* Inserting data into the company_website table */
insert into company_website (website_name) values ('cam.ac.uk');
insert into company_website (website_name) values ('ow.ly');
insert into company_website (website_name) values ('themeforest.net');
insert into company_website (website_name) values ('spiegel.de');
insert into company_website (website_name) values ('feedburner.com');
insert into company_website (website_name) values ('oaic.gov.au');
insert into company_website (website_name) values ('fda.gov');
insert into company_website (website_name) values ('deviantart.com');
insert into company_website (website_name) values ('dmoz.org');
insert into company_website (website_name) values ('mac.com');
insert into company_website (website_name) values ('slate.com');
insert into company_website (website_name) values ('friendfeed.com');
insert into company_website (website_name) values ('reference.com');
insert into company_website (website_name) values ('themeforest.net');
insert into company_website (website_name) values ('ehow.com');
insert into company_website (website_name) values ('purevolume.com');
insert into company_website (website_name) values ('sohu.com');
insert into company_website (website_name) values ('hexun.com');
insert into company_website (website_name) values ('craigslist.org');
insert into company_website (website_name) values ('ucla.edu');
insert into company_website (website_name) values ('hhs.gov');
insert into company_website (website_name) values ('google.es');
insert into company_website (website_name) values ('chron.com');
insert into company_website (website_name) values ('vistaprint.com');
insert into company_website (website_name) values ('paypal.com');
insert into company_website (website_name) values ('blogger.com');
insert into company_website (website_name) values ('slideshare.net');
insert into company_website (website_name) values ('state.gov');
insert into company_website (website_name) values ('wufoo.com');
insert into company_website (website_name) values ('goo.ne.jp');
insert into company_website (website_name) values ('go.com');
insert into company_website (website_name) values ('drupal.org');
insert into company_website (website_name) values ('wikimedia.org');
insert into company_website (website_name) values ('last.fm');
insert into company_website (website_name) values ('paypal.com');
insert into company_website (website_name) values ('chron.com');
insert into company_website (website_name) values ('quantcast.com');
insert into company_website (website_name) values ('hud.gov');
insert into company_website (website_name) values ('hubpages.com');
insert into company_website (website_name) values ('usatoday.com');
insert into company_website (website_name) values ('google.it');
insert into company_website (website_name) values ('prnewswire.com');
insert into company_website (website_name) values ('bandcamp.com');
insert into company_website (website_name) values ('hc360.com');
insert into company_website (website_name) values ('slashdot.org');
insert into company_website (website_name) values ('hhs.gov');
insert into company_website (website_name) values ('si.edu');
insert into company_website (website_name) values ('sogou.com');
insert into company_website (website_name) values ('posterous.com');
insert into company_website (website_name) values ('guardian.co.uk');
insert into company_website (website_name) values ('dailymail.co.uk');
insert into company_website (website_name) values ('theglobeandmail.com');
insert into company_website (website_name) values ('com.com');
insert into company_website (website_name) values ('myspace.com');
insert into company_website (website_name) values ('surveymonkey.com');
insert into company_website (website_name) values ('amazonaws.com');
insert into company_website (website_name) values ('wix.com');
insert into company_website (website_name) values ('dmoz.org');
insert into company_website (website_name) values ('answers.com');
insert into company_website (website_name) values ('topsy.com');
insert into company_website (website_name) values ('technorati.com');
insert into company_website (website_name) values ('elegantthemes.com');
insert into company_website (website_name) values ('scientificamerican.com');
insert into company_website (website_name) values ('wordpress.org');
insert into company_website (website_name) values ('microsoft.com');
insert into company_website (website_name) values ('posterous.com');
insert into company_website (website_name) values ('drupal.org');
insert into company_website (website_name) values ('google.es');
insert into company_website (website_name) values ('yandex.ru');
insert into company_website (website_name) values ('yandex.ru');
insert into company_website (website_name) values ('hhs.gov');
insert into company_website (website_name) values ('ebay.co.uk');
insert into company_website (website_name) values ('unesco.org');
insert into company_website (website_name) values ('google.fr');
insert into company_website (website_name) values ('last.fm');
insert into company_website (website_name) values ('wufoo.com');
insert into company_website (website_name) values ('google.it');
insert into company_website (website_name) values ('bandcamp.com');
insert into company_website (website_name) values ('utexas.edu');
insert into company_website (website_name) values ('discovery.com');
insert into company_website (website_name) values ('sun.com');
insert into company_website (website_name) values ('nsw.gov.au');
insert into company_website (website_name) values ('blinklist.com');
insert into company_website (website_name) values ('delicious.com');
insert into company_website (website_name) values ('nba.com');
insert into company_website (website_name) values ('feedburner.com');
insert into company_website (website_name) values ('networkadvertising.org');
insert into company_website (website_name) values ('aboutads.info');
insert into company_website (website_name) values ('delicious.com');
insert into company_website (website_name) values ('constantcontact.com');
insert into company_website (website_name) values ('icio.us');
insert into company_website (website_name) values ('ocn.ne.jp');
insert into company_website (website_name) values ('ihg.com');
insert into company_website (website_name) values ('discovery.com');
insert into company_website (website_name) values ('va.gov');
insert into company_website (website_name) values ('disqus.com');
insert into company_website (website_name) values ('rediff.com');
insert into company_website (website_name) values ('vistaprint.com');
insert into company_website (website_name) values ('vinaora.com');
insert into company_website (website_name) values ('twitter.com');

/* Inserting data into the service table */
INSERT INTO SERVICE (service_name, service_type)
VALUES
('Personalized Product Recommendations', 'Digital Marketing'),
('Automated Email Campaigns', 'Digital Marketing'),
('SEO Optimization', 'Web Optimization'),
('Social Media Management', 'Digital Marketing'),
('Website Usability Testing', 'Quality Assurance'),
('Mobile App Development', 'Software Development'),
('Content Creation', 'Digital Marketing'),
('Consumer Behavior Analytics', 'Analytics'),
('Data Visualization Reports', 'Analytics'),
('Online Ad Placement', 'Advertising'),
('Customer Support Chatbot', 'Customer Support'),
('Customer Satisfaction Survey Analysis', 'Customer Support'),
('Inventory Management Optimization', 'Supply Chain Management'),
('Virtual Fitting Room', 'E-commerce Enhancement'),
('Fraud Detection System', 'Security'),
('Video Content Production', 'Content Creation'),
('Live Chat Assistance', 'Customer Support'),
('Shipping Cost Optimization', 'Supply Chain Management'),
('Product Photography', 'Content Creation'),
('Web Traffic Analysis', 'Analytics'),
('Order Tracking System', 'E-commerce Enhancement'),
('Loyalty Program Management', 'Customer Retention'),
('Subscription Renewal Reminders', 'Customer Retention'),
('User Feedback Collection', 'Quality Assurance'),
('Product Review Moderation', 'Content Moderation'),
('AI-driven Price Optimization', 'Pricing Strategy'),
('Multilingual Support Services', 'Customer Support'),
('Market Trends Analysis', 'Analytics'),
('Banner Ad Design', 'Advertising'),
('Return and Refund Management', 'Customer Support');

/* Inserting data into the consumer_interaction table */
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (6, 99, 90, 5, null, 8, 2, 15, 1092.65);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (55, 75, 84, 7, 26, 13, 4, 15, 511.2);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (88, 73, 77, null, 21, 9, 3, 44, 643.73);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (94, 76, 27, null, 21, 35, 1, 9, 866.86);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (91, 36, 81, null, null, 3, 1, 45, 23.01);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (52, 15, 76, 1, null, 33, 4, 26, 1465.59);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (52, 31, 37, null, 26, 33, 3, 25, 545.63);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (40, 38, 12, 13, 12, 37, 3, 1, 1377.83);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (62, 64, 46, null, 10, 44, 1, 45, 287.06);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (17, 9, 88, null, null, 33, 1, 13, 918.81);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (86, 81, 41, 21, null, 29, 1, 37, 137.31);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (51, 75, 84, null, 17, 4, 3, 41, 1489.22);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (29, 79, 32, null, 16, 21, 2, 16, 426.08);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (5, 6, 66, 26, null, 42, 1, 41, 411.08);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (1, 85, 39, 11, 17, 44, 1, 24, 961.33);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (9, 48, 32, 16, 8, 31, 4, 8, 1472.03);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (86, 90, 71, null, 11, 45, 3, 19, 1412.93);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (100, 81, 29, 27, 23, 22, 2, 9, 188.1);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (75, 66, 77, null, 28, 30, 4, 10, 111.22);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (94, 99, 65, null, null, 41, 3, 1, 218.61);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (53, 3, 33, 17, 6, 12, 1, 47, 568.75);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (78, 41, 8, 1, 29, 12, 3, 20, 457.21);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (1, 95, 95, null, 13, 29, 4, 39, 1176.42);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (13, 65, 48, 9, null, 13, 1, 28, 205.12);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (30, 3, 68, 6, 28, 42, 4, 1, 1423.32);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (45, 37, 54, 27, 24, 29, 4, 36, 325.96);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (65, 13, 62, null, 27, 15, 4, 27, 796.27);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (75, 58, 14, null, 23, 44, 2, 24, 905.3);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (6, 69, 19, 24, null, 38, 2, 36, 1391.13);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (65, 25, 25, 30, 11, 15, 4, 42, 1482.44);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (34, 27, 86, 23, 28, 36, 4, 44, 93.08);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (92, 64, 38, null, null, 8, 1, 5, 722.15);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (9, 83, 12, null, 7, 8, 4, 38, 581.11);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (12, 22, 58, 2, null, 14, 3, 22, 1117.36);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (72, 16, 49, 20, null, 2, 3, 50, 330.14);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (54, 14, 20, 21, 26, 5, 4, 20, 1339.73);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (28, 41, 63, 22, null, 9, 1, 20, 1264.05);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (4, 63, 3, 16, 4, 49, 4, 11, 988.59);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (73, 42, 70, null, null, 50, 3, 23, 175.2);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (6, 61, 15, 25, null, 19, 2, 17, 1367.09);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (93, 85, 26, null, null, 31, 4, 28, 956.59);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (26, 79, 47, null, null, 15, 4, 31, 433.07);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (53, 37, 57, 4, 9, 28, 2, 25, 1073.26);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (22, 85, 33, 23, null, 39, 2, 29, 1466.51);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (2, 32, 14, 17, null, 49, 2, 1, 1398.17);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (67, 10, 60, 4, null, 36, 3, 20, 844.14);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (23, 78, 66, null, null, 17, 3, 40, 204.39);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (63, 82, 1, null, null, 5, 2, 36, 517.78);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (10, 42, 27, null, 29, 35, 2, 3, 1089.23);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (85, 55, 21, 4, null, 48, 3, 3, 1447.39);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (86, 97, 69, 11, null, 10, 4, 37, 897.25);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (27, 81, 79, null, null, 46, 1, 6, 449.3);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (23, 15, 65, null, 6, 38, 2, 21, 585.57);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (72, 87, 79, 17, 29, 28, 1, 19, 612.52);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (73, 50, 38, null, null, 16, 2, 15, 564.25);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (6, 99, 9, 26, null, 44, 3, 13, 825.83);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (55, 67, 82, null, null, 26, 4, 40, 261.23);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (12, 25, 49, 16, 11, 5, 2, 17, 1177.5);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (67, 10, 77, null, null, 6, 3, 42, 206.46);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (80, 10, 46, null, null, 40, 3, 3, 499.49);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (39, 78, 14, 8, 10, 11, 1, 48, 1457.5);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (45, 67, 96, null, null, 23, 1, 7, 1356.37);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (72, 62, 69, null, 28, 43, 4, 6, 679.16);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (24, 34, 26, 1, null, 19, 2, 46, 1022.26);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (56, 39, 61, null, null, 42, 4, 36, 269.81);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (12, 19, 41, 23, null, 35, 3, 37, 49.56);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (25, 78, 38, 3, 14, 39, 1, 31, 651.68);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (18, 53, 62, 24, 12, 16, 1, 12, 1040.52);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (40, 6, 77, 7, 2, 1, 2, 33, 1321.01);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (85, 30, 61, null, null, 28, 3, 40, 1044.98);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (65, 37, 54, 28, 24, 24, 2, 43, 1331.36);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (17, 40, 51, 12, 5, 44, 1, 22, 1048.22);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (42, 34, 59, null, 12, 17, 2, 34, 516.98);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (45, 62, 14, null, null, 13, 4, 45, 1366.96);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (55, 96, 8, null, 8, 24, 3, 29, 685.95);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (33, 56, 84, 21, 9, 50, 4, 2, 168.66);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (10, 4, 54, null, null, 34, 4, 42, 1156.76);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (41, 81, 67, null, null, 22, 2, 37, 52.75);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (79, 31, 26, null, null, 6, 4, 11, 863.21);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (76, 24, 54, 7, null, 34, 2, 5, 461.23);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (55, 66, 46, null, 5, 41, 3, 31, 1300.95);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (36, 59, 14, 30, null, 24, 1, 15, 252.46);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (19, 39, 63, 27, 8, 37, 1, 17, 1313.3);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (97, 57, 91, 29, null, 34, 2, 43, 547.14);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (61, 7, 99, 2, 20, 11, 4, 2, 457.29);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (95, 21, 90, 23, 27, 17, 1, 36, 1103.8);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (46, 45, 93, null, 1, 11, 3, 11, 1133.17);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (30, 22, 5, 18, null, 5, 3, 19, 1488.56);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (19, 94, 29, null, null, 25, 1, 40, 271.04);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (34, 78, 97, null, null, 50, 2, 38, 1151.75);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (47, 69, 46, null, null, 38, 4, 9, 1268.16);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (56, 33, 12, 7, null, 2, 3, 9, 331.59);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (30, 68, 64, null, 14, 19, 2, 26, 1126.84);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (32, 13, 34, 26, null, 17, 2, 4, 44.96);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (50, 64, 97, 12, null, 38, 3, 3, 921.26);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (30, 66, 92, 23, 4, 25, 1, 29, 653.43);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (57, 41, 71, 5, 24, 28, 2, 50, 677.26);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (88, 69, 66, 24, 26, 10, 2, 21, 257.11);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (43, 78, 12, null, null, 27, 4, 32, 754.34);
insert into consumer_interaction (consumer_id, company_website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed_or_purchased, total_potential_or_paid_price) values (53, 89, 3, null, 25, 45, 3, 35, 1089.58);

/* Inserting data into the marketing_performance table */
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (70, 44, 58, 3, 16, 295064, 469853, 117107.0);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (32, 18, 87, 5, 83, 484715, 313139, 86255.25);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (9, 4, 97, 4, 100, 948843, 568055, 9302.53);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (60, 39, 93, 3, 82, 627112, 438132, 9617.36);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (30, 96, 54, 3, 64, 41188, 750337, 102247.91);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (49, 60, 21, 4, 73, 797570, 322690, 131831.12);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (84, 84, 44, 4, 89, 985743, 616177, 92950.16);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (8, 30, 99, 3, 51, 416793, 355896, 63214.95);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (13, 33, 42, 5, 65, 415548, 204180, 60772.55);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (42, 11, 86, 3, 1, 559409, 321508, 90538.39);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (9, 61, 15, 5, 50, 347899, 528241, 131743.2);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (34, 30, 87, 1, 89, 937077, 274404, 51747.21);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (77, 14, 70, 6, 90, 125158, 678290, 26080.43);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (33, 71, 30, 4, 5, 969458, 127804, 105511.07);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (28, 31, 35, 3, 23, 262088, 731372, 51440.45);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (31, 22, 80, 1, 33, 702059, 634559, 16595.74);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (23, 33, 43, 6, 8, 634569, 537699, 80714.42);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (72, 42, 74, 5, 77, 815463, 707714, 3932.96);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (72, 57, 13, 3, 38, 468386, 222365, 42020.64);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (41, 33, 10, 2, 92, 19265, 716321, 75020.65);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (76, 30, 45, 4, 64, 3129, 99986, 144134.26);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (42, 9, 18, 3, 54, 932651, 288905, 93605.06);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (7, 84, 68, 5, 30, 155522, 661343, 147964.58);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (86, 1, 93, 1, 3, 847461, 408818, 57666.24);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (45, 100, 43, 5, 22, 845267, 462626, 126594.29);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (13, 57, 88, 3, 62, 241029, 308745, 71525.38);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (82, 41, 75, 2, 46, 68426, 560304, 123606.97);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (35, 2, 26, 6, 62, 460027, 357455, 65173.2);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (41, 77, 24, 3, 81, 871077, 101847, 134002.91);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (73, 97, 56, 6, 12, 650998, 255944, 43437.67);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (55, 5, 57, 2, 56, 92441, 402374, 5780.55);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (61, 82, 92, 2, 33, 632851, 380898, 149562.69);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (60, 20, 1, 3, 89, 269578, 845081, 30331.72);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (26, 78, 65, 3, 40, 724626, 21653, 74312.64);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (55, 44, 3, 5, 86, 449414, 8252, 61046.7);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (53, 1, 21, 6, 64, 173271, 431213, 43202.6);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (38, 19, 1, 4, 76, 585535, 480862, 84369.45);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (78, 44, 71, 6, 24, 344610, 609116, 41342.85);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (41, 74, 37, 6, 100, 11765, 415293, 4932.65);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (5, 4, 64, 2, 36, 487581, 131355, 105994.4);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (52, 19, 48, 3, 60, 170260, 296978, 62897.7);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (78, 79, 6, 6, 74, 512055, 337415, 82721.32);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (55, 75, 82, 2, 81, 609185, 650084, 38388.36);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (25, 52, 94, 6, 66, 19040, 750029, 109070.45);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (20, 10, 40, 4, 45, 975333, 630674, 59878.58);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (46, 23, 18, 4, 82, 538474, 181875, 65225.61);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (9, 50, 100, 3, 63, 389300, 434229, 35937.74);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (72, 53, 61, 4, 8, 181323, 719684, 101711.71);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (19, 99, 43, 3, 32, 474591, 382603, 19293.08);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (9, 50, 84, 2, 87, 99805, 67047, 31451.13);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (62, 49, 35, 6, 100, 117725, 691628, 121014.03);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (46, 23, 98, 3, 62, 774935, 151423, 22007.49);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (43, 40, 98, 3, 70, 164924, 453769, 18941.35);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (5, 61, 89, 5, 32, 582373, 158556, 26316.8);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (39, 51, 44, 1, 60, 814976, 659772, 5647.37);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (36, 22, 41, 2, 57, 175400, 396625, 101109.58);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (15, 44, 11, 1, 86, 590557, 799300, 30040.4);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (9, 33, 79, 2, 3, 723524, 500032, 8191.42);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (61, 5, 64, 2, 39, 590941, 549240, 115866.95);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (45, 63, 69, 1, 34, 906488, 242046, 88862.78);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (26, 68, 5, 6, 17, 177241, 113755, 55799.98);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (4, 93, 89, 2, 25, 878095, 311364, 30839.29);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (79, 1, 79, 1, 21, 457962, 28783, 145375.21);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (73, 61, 2, 2, 65, 541459, 283341, 20451.64);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (21, 41, 64, 6, 52, 423060, 348648, 90095.89);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (72, 16, 86, 2, 84, 334839, 603067, 39489.7);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (71, 50, 73, 1, 31, 53321, 480190, 96975.89);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (77, 57, 43, 3, 59, 624615, 86113, 129551.04);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (68, 71, 37, 5, 63, 649343, 725815, 134351.85);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (57, 21, 80, 3, 50, 889464, 745767, 116598.32);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (18, 90, 54, 3, 49, 403170, 76145, 18911.72);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (71, 55, 7, 1, 52, 263292, 351581, 25107.5);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (9, 83, 74, 2, 96, 397576, 567494, 68644.82);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (5, 42, 23, 1, 34, 972880, 598293, 86825.12);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (58, 40, 65, 5, 63, 889490, 59677, 3305.59);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (4, 22, 40, 2, 26, 404937, 216293, 91783.74);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (16, 51, 5, 4, 92, 121756, 150838, 47807.11);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (71, 57, 3, 1, 40, 10405, 275291, 60834.79);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (13, 15, 26, 6, 27, 368316, 718820, 74543.3);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (63, 4, 81, 5, 7, 393997, 836561, 84666.32);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (51, 51, 48, 1, 93, 958, 327710, 128060.28);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (33, 40, 57, 1, 63, 741694, 648563, 124692.7);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (70, 90, 68, 4, 94, 382810, 329629, 1066.9);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (68, 29, 63, 2, 13, 588275, 451803, 15352.77);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (31, 80, 3, 3, 49, 152512, 382171, 3841.33);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (44, 3, 25, 1, 91, 156776, 420436, 144991.69);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (55, 42, 48, 5, 11, 859066, 303624, 132771.17);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (56, 81, 2, 3, 6, 560303, 354538, 121440.8);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (21, 73, 100, 2, 63, 723340, 669016, 116130.71);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (79, 68, 9, 5, 55, 921473, 496789, 21073.97);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (73, 47, 90, 1, 69, 198216, 307090, 43150.58);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (14, 87, 20, 2, 100, 309071, 79163, 102922.15);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (33, 63, 25, 3, 36, 978904, 316930, 136134.2);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (45, 14, 56, 6, 11, 784690, 697186, 101762.02);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (48, 66, 68, 3, 32, 251700, 462918, 19998.67);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (59, 87, 42, 6, 11, 56096, 456999, 140675.14);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (63, 40, 90, 3, 52, 507590, 2471, 122926.0);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (18, 14, 41, 2, 44, 234469, 508391, 14730.79);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (81, 52, 50, 3, 29, 443680, 569241, 101688.45);
insert into marketing_performance (campaign_id, consumer_id, company_website_id, reach_id, session_id, total_impressions, total_clicks, total_revenue_generated) values (52, 2, 27, 3, 17, 413432, 666269, 38138.75);