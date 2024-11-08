DROP DATABASE IF EXISTS smartclick_data_warehouse;
CREATE DATABASE smartclick_data_warehouse;
\c smartclick_data_warehouse
CREATE TABLE CONSUMER (
    consumer_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(90) NOT NULL,
    age VARCHAR(3) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    phone_number VARCHAR(25) NOT NULL
);

CREATE TABLE CATEGORY (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUCT (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(80) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
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
    date DATE NOT NULL
);

CREATE TABLE COMPANY_WEBSITE (
    website_id SERIAL PRIMARY KEY,
    website_name VARCHAR(255) NOT NULL
);

CREATE TABLE SERVICE_TYPE (
    service_type_id SERIAL PRIMARY KEY,
    service_type VARCHAR(50) NOT NULL
);

CREATE TABLE SERVICE (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(50) NOT NULL,
    service_type_id INT NOT NULL,
    FOREIGN KEY (service_type_id) REFERENCES SERVICE_TYPE(service_type_id)
);

CREATE TABLE DEVICE_TYPE (
    device_type_id SERIAL PRIMARY KEY,
    device_name VARCHAR(50) NOT NULL,
    os VARCHAR(50) NOT NULL
);

CREATE TABLE CONSUMER_INTERACTION (
    consumer_interaction_id SERIAL PRIMARY KEY,
    consumer_id INT NOT NULL,
    device_type_id INT NOT NULL,
    website_id INT NOT NULL,
    session_id INT NOT NULL,
    service_id INT,
    product_id INT,
    location_id INT NOT NULL,
    interaction_type_id INT NOT NULL,
    total_items_viewed INT,
    total_items_purchased INT,
    basket_subtotal DECIMAL(8, 2),
    total_checkout_price DECIMAL(8, 2),
    FOREIGN KEY (consumer_id) REFERENCES CONSUMER(consumer_id),
    FOREIGN KEY (device_type_id) REFERENCES DEVICE_TYPE(device_type_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    FOREIGN KEY (location_id) REFERENCES LOCATION(location_id),
    FOREIGN KEY (interaction_type_id) REFERENCES INTERACTION_TYPE(interaction_type_id),
    FOREIGN KEY (session_id) REFERENCES SESSION(session_id),
    FOREIGN KEY (website_id) REFERENCES COMPANY_WEBSITE(website_id),
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
    device_type_id INT NOT NULL,
    website_id INT NOT NULL,
    reach_id INT NOT NULL,
    session_id INT NOT NULL,
    total_impressions INT NOT NULL,
    total_clicks INT NOT NULL,
    return_on_investment INT NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES CAMPAIGN(campaign_id),
    FOREIGN KEY (consumer_id) REFERENCES CONSUMER(consumer_id),
    FOREIGN KEY (device_type_id) REFERENCES DEVICE_TYPE(device_type_id),
    FOREIGN KEY (reach_id) REFERENCES MEANS_USED_TO_WEBSITE(reach_id),
    FOREIGN KEY (session_id) REFERENCES SESSION(session_id),
    FOREIGN KEY (website_id) REFERENCES COMPANY_WEBSITE(website_id)
);

/* Inserting data into the tables */

/* Inserting data into the CONSUMER table */
insert into consumer (name, email, age, gender, phone_number) values ('Kristos Ivanonko', 'kivanonko0@mit.edu', 47, 'Male', '6754825100');
insert into consumer (name, email, age, gender, phone_number) values ('Baudoin Rosnau', 'brosnau1@dagondesign.com', 77, 'Male', '5868241205');
insert into consumer (name, email, age, gender, phone_number) values ('Lowrance Rickertsen', 'lrickertsen2@macromedia.com', 40, 'Male', '5945895091');
insert into consumer (name, email, age, gender, phone_number) values ('Farlee MacAlroy', 'fmacalroy3@51.la', 43, 'Male', '1898752696');
insert into consumer (name, email, age, gender, phone_number) values ('Courtney Jaram', 'cjaram4@amazon.com', 23, 'Male', '9104391055');
insert into consumer (name, email, age, gender, phone_number) values ('Tallie Bretherton', 'tbretherton5@usnews.com', 82, 'Female', '1563264848');
insert into consumer (name, email, age, gender, phone_number) values ('Nisse Padkin', 'npadkin6@wikia.com', 91, 'Female', '1188651263');
insert into consumer (name, email, age, gender, phone_number) values ('Modesta Cordy', 'mcordy7@smugmug.com', 67, 'Female', '5974596569');
insert into consumer (name, email, age, gender, phone_number) values ('Kingsley McGawn', 'kmcgawn8@msn.com', 93, 'Male', '3875163774');
insert into consumer (name, email, age, gender, phone_number) values ('Whitman Pancast', 'wpancast9@wikimedia.org', 42, 'Male', '5092222925');
insert into consumer (name, email, age, gender, phone_number) values ('Windy Broadbear', 'wbroadbeara@amazon.co.uk', 53, 'Female', '9271820479');
insert into consumer (name, email, age, gender, phone_number) values ('Korella Watts', 'kwattsb@plala.or.jp', 52, 'Female', '8527936079');
insert into consumer (name, email, age, gender, phone_number) values ('Stacia Bettam', 'sbettamc@mlb.com', 66, 'Female', '7796403955');
insert into consumer (name, email, age, gender, phone_number) values ('Phillipe Chater', 'pchaterd@prlog.org', 37, 'Male', '5505774367');
insert into consumer (name, email, age, gender, phone_number) values ('Lelah Billinge', 'lbillingee@constantcontact.com', 84, 'Female', '2765550762');
insert into consumer (name, email, age, gender, phone_number) values ('Dell Hanselman', 'dhanselmanf@latimes.com', 52, 'Female', '5348013822');
insert into consumer (name, email, age, gender, phone_number) values ('Idaline Maestrini', 'imaestrinig@yelp.com', 37, 'Polygender', '2875263445');
insert into consumer (name, email, age, gender, phone_number) values ('Abigale Lickorish', 'alickorishh@rakuten.co.jp', 91, 'Female', '4772912548');
insert into consumer (name, email, age, gender, phone_number) values ('Micah Smithson', 'msmithsoni@bbb.org', 51, 'Male', '3113978522');
insert into consumer (name, email, age, gender, phone_number) values ('Quincey Purcell', 'qpurcellj@vimeo.com', 67, 'Male', '9915134436');
insert into consumer (name, email, age, gender, phone_number) values ('Nara Zoanetti', 'nzoanettik@gnu.org', 78, 'Genderfluid', '6369071911');
insert into consumer (name, email, age, gender, phone_number) values ('Hortensia Steely', 'hsteelyl@linkedin.com', 70, 'Female', '9708967368');
insert into consumer (name, email, age, gender, phone_number) values ('Bradney Bodiam', 'bbodiamm@stumbleupon.com', 45, 'Male', '1856458422');
insert into consumer (name, email, age, gender, phone_number) values ('Redford Ackery', 'rackeryn@va.gov', 41, 'Male', '7752754609');
insert into consumer (name, email, age, gender, phone_number) values ('Juli Sorrill', 'jsorrillo@quantcast.com', 44, 'Female', '1552765754');
insert into consumer (name, email, age, gender, phone_number) values ('Vivian Domino', 'vdominop@trellian.com', 67, 'Female', '5808542671');
insert into consumer (name, email, age, gender, phone_number) values ('Josh Hamson', 'jhamsonq@elpais.com', 52, 'Male', '3995454540');
insert into consumer (name, email, age, gender, phone_number) values ('Salim Blewett', 'sblewettr@hatena.ne.jp', 36, 'Male', '3973967674');
insert into consumer (name, email, age, gender, phone_number) values ('Ruperta Coils', 'rcoilss@gov.uk', 64, 'Female', '8133886078');
insert into consumer (name, email, age, gender, phone_number) values ('Kingston Spini', 'kspinit@bbb.org', 76, 'Male', '2063593671');
insert into consumer (name, email, age, gender, phone_number) values ('Taddeusz Lismer', 'tlismeru@cargocollective.com', 60, 'Male', '3738523851');
insert into consumer (name, email, age, gender, phone_number) values ('Beth McAuley', 'bmcauleyv@seattletimes.com', 37, 'Female', '9277582564');
insert into consumer (name, email, age, gender, phone_number) values ('Melli Leonard', 'mleonardw@google.nl', 79, 'Female', '5245568892');
insert into consumer (name, email, age, gender, phone_number) values ('Hilliary Jacobsz', 'hjacobszx@cbsnews.com', 66, 'Female', '5424866126');
insert into consumer (name, email, age, gender, phone_number) values ('Robin Fernier', 'rferniery@addtoany.com', 49, 'Male', '3143025704');
insert into consumer (name, email, age, gender, phone_number) values ('Arlen Leggen', 'aleggenz@europa.eu', 57, 'Male', '4597867342');
insert into consumer (name, email, age, gender, phone_number) values ('Ralina Dennis', 'rdennis10@dropbox.com', 39, 'Female', '1837601892');
insert into consumer (name, email, age, gender, phone_number) values ('Basilio Norquay', 'bnorquay11@de.vu', 60, 'Male', '5137301707');
insert into consumer (name, email, age, gender, phone_number) values ('Clarine Richard', 'crichard12@tiny.cc', 41, 'Female', '3968307660');
insert into consumer (name, email, age, gender, phone_number) values ('Olag Rubbert', 'orubbert13@fda.gov', 97, 'Male', '5393331346');
insert into consumer (name, email, age, gender, phone_number) values ('Lilias Puncher', 'lpuncher14@imdb.com', 56, 'Female', '9042384843');
insert into consumer (name, email, age, gender, phone_number) values ('Arnold Trebble', 'atrebble15@facebook.com', 51, 'Male', '3808439076');
insert into consumer (name, email, age, gender, phone_number) values ('Andrey La Vigne', 'ala16@cpanel.net', 19, 'Male', '9641603965');
insert into consumer (name, email, age, gender, phone_number) values ('Moina MacKomb', 'mmackomb17@constantcontact.com', 25, 'Female', '3054172210');
insert into consumer (name, email, age, gender, phone_number) values ('Carce Jakubovics', 'cjakubovics18@youtu.be', 88, 'Male', '5897975231');
insert into consumer (name, email, age, gender, phone_number) values ('Maynard Allum', 'mallum19@huffingtonpost.com', 45, 'Male', '9899529116');
insert into consumer (name, email, age, gender, phone_number) values ('Malanie Clarricoates', 'mclarricoates1a@xing.com', 99, 'Female', '6843277337');
insert into consumer (name, email, age, gender, phone_number) values ('Demetri Kyndred', 'dkyndred1b@blog.com', 45, 'Male', '2427416982');
insert into consumer (name, email, age, gender, phone_number) values ('Cissy McGuiness', 'cmcguiness1c@furl.net', 79, 'Female', '2026470955');
insert into consumer (name, email, age, gender, phone_number) values ('Annamaria Wallentin', 'awallentin1d@weebly.com', 79, 'Female', '3728311880');
insert into consumer (name, email, age, gender, phone_number) values ('Dela Life', 'dlife1e@nih.gov', 57, 'Female', '7389035115');
insert into consumer (name, email, age, gender, phone_number) values ('Ab Fitchett', 'afitchett1f@wired.com', 50, 'Male', '4099269085');
insert into consumer (name, email, age, gender, phone_number) values ('Flo Grigs', 'fgrigs1g@printfriendly.com', 78, 'Female', '5665663218');
insert into consumer (name, email, age, gender, phone_number) values ('Vikky D''Souza', 'vdsouza1h@goodreads.com', 88, 'Female', '4108476083');
insert into consumer (name, email, age, gender, phone_number) values ('Korey Bleas', 'kbleas1i@webs.com', 85, 'Male', '9645947019');
insert into consumer (name, email, age, gender, phone_number) values ('Siffre Gascoine', 'sgascoine1j@gnu.org', 76, 'Male', '4324078608');
insert into consumer (name, email, age, gender, phone_number) values ('Jermayne Basketfield', 'jbasketfield1k@theatlantic.com', 84, 'Genderfluid', '1576402143');
insert into consumer (name, email, age, gender, phone_number) values ('Marv Godilington', 'mgodilington1l@hugedomains.com', 73, 'Male', '2911155068');
insert into consumer (name, email, age, gender, phone_number) values ('Belle Gruszecki', 'bgruszecki1m@apple.com', 27, 'Female', '6252933060');
insert into consumer (name, email, age, gender, phone_number) values ('Levey Roebottom', 'lroebottom1n@wunderground.com', 59, 'Bigender', '5399473509');
insert into consumer (name, email, age, gender, phone_number) values ('Ardys Genthner', 'agenthner1o@imdb.com', 46, 'Female', '8975524384');
insert into consumer (name, email, age, gender, phone_number) values ('Davey Cuer', 'dcuer1p@hp.com', 18, 'Male', '5487288016');
insert into consumer (name, email, age, gender, phone_number) values ('Elizabet Tomlinson', 'etomlinson1q@phoca.cz', 99, 'Bigender', '9792512122');
insert into consumer (name, email, age, gender, phone_number) values ('Leeland Marmion', 'lmarmion1r@purevolume.com', 97, 'Male', '3751916044');
insert into consumer (name, email, age, gender, phone_number) values ('Davey Struijs', 'dstruijs1s@soup.io', 68, 'Male', '7196197873');
insert into consumer (name, email, age, gender, phone_number) values ('Rosco De Roeck', 'rde1t@sakura.ne.jp', 83, 'Bigender', '2012390498');
insert into consumer (name, email, age, gender, phone_number) values ('Maryl Hartill', 'mhartill1u@reddit.com', 33, 'Female', '4177630505');
insert into consumer (name, email, age, gender, phone_number) values ('Alvis Petzold', 'apetzold1v@opensource.org', 22, 'Male', '2878054786');
insert into consumer (name, email, age, gender, phone_number) values ('Charlot Cranmor', 'ccranmor1w@vimeo.com', 25, 'Female', '3532947232');
insert into consumer (name, email, age, gender, phone_number) values ('Valentina Packham', 'vpackham1x@etsy.com', 71, 'Female', '1233738140');
insert into consumer (name, email, age, gender, phone_number) values ('Trefor Cockell', 'tcockell1y@buzzfeed.com', 28, 'Male', '9708214718');
insert into consumer (name, email, age, gender, phone_number) values ('Abel Napoli', 'anapoli1z@mac.com', 87, 'Non-binary', '8096388454');
insert into consumer (name, email, age, gender, phone_number) values ('Sergent Meiklejohn', 'smeiklejohn20@163.com', 95, 'Male', '4562735962');
insert into consumer (name, email, age, gender, phone_number) values ('Darlleen Lere', 'dlere21@google.es', 35, 'Female', '6064685594');
insert into consumer (name, email, age, gender, phone_number) values ('Janella Hayselden', 'jhayselden22@ycombinator.com', 57, 'Female', '9931807815');
insert into consumer (name, email, age, gender, phone_number) values ('Avrom Iacofo', 'aiacofo23@fema.gov', 29, 'Male', '1614456438');
insert into consumer (name, email, age, gender, phone_number) values ('Corine Rennebach', 'crennebach24@java.com', 92, 'Female', '3211245327');
insert into consumer (name, email, age, gender, phone_number) values ('Alfredo Tute', 'atute25@imgur.com', 97, 'Male', '2856611312');
insert into consumer (name, email, age, gender, phone_number) values ('Sula Whorf', 'swhorf26@joomla.org', 50, 'Female', '7339173121');
insert into consumer (name, email, age, gender, phone_number) values ('Kanya Hayler', 'khayler27@wikia.com', 45, 'Female', '3914955162');
insert into consumer (name, email, age, gender, phone_number) values ('Odella Hawthorn', 'ohawthorn28@com.com', 57, 'Female', '5776410513');
insert into consumer (name, email, age, gender, phone_number) values ('Lydon Gartland', 'lgartland29@live.com', 46, 'Male', '9972092666');
insert into consumer (name, email, age, gender, phone_number) values ('Cherida Knapman', 'cknapman2a@myspace.com', 63, 'Female', '4888914597');
insert into consumer (name, email, age, gender, phone_number) values ('Jaquelyn Brower', 'jbrower2b@amazon.com', 83, 'Non-binary', '3926714516');
insert into consumer (name, email, age, gender, phone_number) values ('Ginni Spybey', 'gspybey2c@cmu.edu', 42, 'Female', '5926864522');
insert into consumer (name, email, age, gender, phone_number) values ('Carce Seals', 'cseals2d@soundcloud.com', 36, 'Male', '3204269181');
insert into consumer (name, email, age, gender, phone_number) values ('Clemmy Graalman', 'cgraalman2e@nasa.gov', 96, 'Male', '5472177388');
insert into consumer (name, email, age, gender, phone_number) values ('Cy Burdon', 'cburdon2f@feedburner.com', 95, 'Male', '4492651230');
insert into consumer (name, email, age, gender, phone_number) values ('Maudie Marnes', 'mmarnes2g@angelfire.com', 54, 'Female', '7827624182');
insert into consumer (name, email, age, gender, phone_number) values ('Estell Featherstonhalgh', 'efeatherstonhalgh2h@ask.com', 94, 'Female', '6376216676');
insert into consumer (name, email, age, gender, phone_number) values ('Isaac Hale', 'ihale2i@yahoo.com', 66, 'Male', '6012794786');
insert into consumer (name, email, age, gender, phone_number) values ('Gerek Libri', 'glibri2j@harvard.edu', 70, 'Agender', '9805282981');
insert into consumer (name, email, age, gender, phone_number) values ('Chrysler Girtin', 'cgirtin2k@instagram.com', 18, 'Female', '6106225640');
insert into consumer (name, email, age, gender, phone_number) values ('Roch Older', 'rolder2l@cnbc.com', 53, 'Female', '8589073447');
insert into consumer (name, email, age, gender, phone_number) values ('Kirby Pietruszka', 'kpietruszka2m@liveinternet.ru', 79, 'Female', '1816265341');
insert into consumer (name, email, age, gender, phone_number) values ('Spike Rastrick', 'srastrick2n@admin.ch', 50, 'Male', '6346610005');
insert into consumer (name, email, age, gender, phone_number) values ('Chen Robjant', 'crobjant2o@fc2.com', 64, 'Male', '8836240604');
insert into consumer (name, email, age, gender, phone_number) values ('Broddie Biggadyke', 'bbiggadyke2p@nature.com', 30, 'Male', '1672180129');
insert into consumer (name, email, age, gender, phone_number) values ('Nickolai Camacke', 'ncamacke2q@imageshack.us', 55, 'Male', '8592255293');
insert into consumer (name, email, age, gender, phone_number) values ('Morry Paull', 'mpaull2r@bigcartel.com', 89, 'Male', '11727205');

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

/* Inserting data into the Category table */
insert into category (category_name) values ('Electronics');
insert into category (category_name) values ('Books');
insert into category (category_name) values ('Clothing');
insert into category (category_name) values ('Home & Garden');
insert into category (category_name) values ('Health & Beauty');
insert into category (category_name) values ('Toys & Hobbies');
insert into category (category_name) values ('Sporting Goods');
insert into category (category_name) values ('Food & Beverages');
insert into category (category_name) values ('Miscelleneous');

/* Inserting data into the Product table */
insert into product (product_name, category_id) values ('Milk - Chocolate 250 Ml', 8);
insert into product (product_name, category_id) values ('Flower - Potmums', 4);
insert into product (product_name, category_id) values ('Fib N9 - Prague Powder', 5);
insert into product (product_name, category_id) values ('Salmon Atl.whole 8 - 10 Lb', 8);
insert into product (product_name, category_id) values ('Coffee - Frthy Coffee Crisp', 8);
insert into product (product_name, category_id) values ('Lid - 10,12,16 Oz', 8);
insert into product (product_name, category_id) values ('Lamb - Whole, Frozen', 8);
insert into product (product_name, category_id) values ('Jagermeister', 8);
insert into product (product_name, category_id) values ('Rice Pilaf, Dry,package', 8);
insert into product (product_name, category_id) values ('Creme De Menth - White', 8);
insert into product (product_name, category_id) values ('Joint Security Area (Gongdong gyeongbi guyeok JSA)', 2);
insert into product (product_name, category_id) values ('Karlsson on the Roof', 9);
insert into product (product_name, category_id) values ('Revenge of the Nerds III: The Next Generation', 2);
insert into product (product_name, category_id) values ('Border Run (Mule, The)', 2);
insert into product (product_name, category_id) values ('Rosewood Lane', 2);
insert into product (product_name, category_id) values ('Look Who''s Talking Now', 2);
insert into product (product_name, category_id) values ('Take, The', 2);
insert into product (product_name, category_id) values ('Queen of Outer Space', 2);
insert into product (product_name, category_id) values ('Murder à la Mod', 6);
insert into product (product_name, category_id) values ('At the Earth''s Core', 3);
insert into product (product_name, category_id) values ('Nokia 3128', 1);
insert into product (product_name, category_id) values ('Plum Check LTE', 1);
insert into product (product_name, category_id) values ('ZTE Max XL', 1);
insert into product (product_name, category_id) values ('Parla Minu P123', 7);
insert into product (product_name, category_id) values ('Icemobile Apollo 3G', 1);
insert into product (product_name, category_id) values ('alcatel Roadsign', 6);
insert into product (product_name, category_id) values ('Panasonic KX-TU301', 1);
insert into product (product_name, category_id) values ('LG K8 (2017)', 1);
insert into product (product_name, category_id) values ('Spice QT-50', 1);
insert into product (product_name, category_id) values ('Nokia Lumia 925', 1);

/* Inserting data into SESSION table */
insert into session (start_time, end_time, date) values ('10:04', '1:22', '16/03/2024');
insert into session (start_time, end_time, date) values ('6:06', '20:42', '04/01/2024');
insert into session (start_time, end_time, date) values ('3:50', '4:49', '30/01/2024');
insert into session (start_time, end_time, date) values ('1:52', '6:51', '16/11/2022');
insert into session (start_time, end_time, date) values ('19:55', '14:58', '16/06/2022');
insert into session (start_time, end_time, date) values ('8:27', '15:33', '08/03/2021');
insert into session (start_time, end_time, date) values ('15:39', '21:14', '25/02/2021');
insert into session (start_time, end_time, date) values ('8:41', '6:04', '27/03/2021');
insert into session (start_time, end_time, date) values ('0:00', '22:54', '23/12/2023');
insert into session (start_time, end_time, date) values ('17:24', '19:30', '25/11/2021');
insert into session (start_time, end_time, date) values ('19:20', '11:15', '10/10/2021');
insert into session (start_time, end_time, date) values ('23:19', '23:07', '23/02/2023');
insert into session (start_time, end_time, date) values ('7:37', '20:39', '29/01/2024');
insert into session (start_time, end_time, date) values ('17:58', '8:03', '02/05/2024');
insert into session (start_time, end_time, date) values ('7:35', '14:54', '01/06/2021');
insert into session (start_time, end_time, date) values ('16:52', '1:55', '14/01/2023');
insert into session (start_time, end_time, date) values ('22:16', '16:32', '03/08/2020');
insert into session (start_time, end_time, date) values ('17:36', '11:58', '27/09/2021');
insert into session (start_time, end_time, date) values ('11:52', '4:34', '16/12/2023');
insert into session (start_time, end_time, date) values ('4:25', '2:20', '13/08/2023');
insert into session (start_time, end_time, date) values ('2:27', '6:58', '05/05/2024');
insert into session (start_time, end_time, date) values ('20:16', '7:22', '16/07/2022');
insert into session (start_time, end_time, date) values ('21:07', '22:18', '25/08/2024');
insert into session (start_time, end_time, date) values ('9:10', '14:00', '16/03/2024');
insert into session (start_time, end_time, date) values ('7:24', '20:11', '31/01/2021');
insert into session (start_time, end_time, date) values ('0:52', '4:42', '18/08/2020');
insert into session (start_time, end_time, date) values ('10:50', '7:58', '23/07/2020');
insert into session (start_time, end_time, date) values ('16:21', '22:25', '29/07/2022');
insert into session (start_time, end_time, date) values ('18:51', '5:21', '31/03/2024');
insert into session (start_time, end_time, date) values ('10:51', '2:22', '13/08/2023');
insert into session (start_time, end_time, date) values ('9:49', '0:19', '21/05/2020');
insert into session (start_time, end_time, date) values ('14:37', '11:57', '17/01/2022');
insert into session (start_time, end_time, date) values ('8:26', '21:03', '03/10/2024');
insert into session (start_time, end_time, date) values ('18:14', '5:42', '21/04/2023');
insert into session (start_time, end_time, date) values ('19:37', '21:09', '14/09/2020');
insert into session (start_time, end_time, date) values ('10:34', '7:07', '27/05/2024');
insert into session (start_time, end_time, date) values ('18:18', '14:20', '14/06/2024');
insert into session (start_time, end_time, date) values ('9:55', '14:13', '16/10/2023');
insert into session (start_time, end_time, date) values ('18:21', '18:24', '13/09/2024');
insert into session (start_time, end_time, date) values ('17:50', '0:35', '22/08/2022');
insert into session (start_time, end_time, date) values ('6:55', '18:56', '28/08/2023');
insert into session (start_time, end_time, date) values ('20:32', '4:09', '09/09/2024');
insert into session (start_time, end_time, date) values ('23:17', '21:55', '25/09/2024');
insert into session (start_time, end_time, date) values ('18:25', '18:40', '16/09/2024');
insert into session (start_time, end_time, date) values ('18:27', '6:33', '11/09/2020');
insert into session (start_time, end_time, date) values ('11:56', '13:21', '18/12/2022');
insert into session (start_time, end_time, date) values ('12:20', '12:11', '30/09/2022');
insert into session (start_time, end_time, date) values ('21:20', '4:32', '26/02/2021');
insert into session (start_time, end_time, date) values ('8:26', '7:48', '26/09/2021');
insert into session (start_time, end_time, date) values ('21:03', '23:06', '22/01/2022');
insert into session (start_time, end_time, date) values ('0:51', '19:25', '06/07/2020');
insert into session (start_time, end_time, date) values ('6:22', '19:09', '04/04/2021');
insert into session (start_time, end_time, date) values ('5:48', '16:30', '15/10/2021');
insert into session (start_time, end_time, date) values ('10:59', '18:55', '11/03/2021');
insert into session (start_time, end_time, date) values ('5:03', '12:48', '24/08/2020');
insert into session (start_time, end_time, date) values ('6:38', '15:00', '16/05/2020');
insert into session (start_time, end_time, date) values ('10:07', '5:29', '03/03/2023');
insert into session (start_time, end_time, date) values ('19:34', '22:37', '04/02/2024');
insert into session (start_time, end_time, date) values ('11:09', '1:47', '22/03/2022');
insert into session (start_time, end_time, date) values ('7:15', '20:34', '15/05/2024');
insert into session (start_time, end_time, date) values ('15:27', '4:23', '18/07/2021');
insert into session (start_time, end_time, date) values ('20:46', '19:31', '30/12/2023');
insert into session (start_time, end_time, date) values ('12:51', '11:21', '27/03/2024');
insert into session (start_time, end_time, date) values ('10:11', '11:30', '22/12/2022');
insert into session (start_time, end_time, date) values ('21:10', '11:32', '09/03/2022');
insert into session (start_time, end_time, date) values ('12:48', '2:50', '27/06/2022');
insert into session (start_time, end_time, date) values ('6:14', '5:24', '20/08/2022');
insert into session (start_time, end_time, date) values ('21:51', '7:34', '04/09/2024');
insert into session (start_time, end_time, date) values ('16:04', '21:56', '15/07/2022');
insert into session (start_time, end_time, date) values ('1:12', '22:04', '17/07/2022');
insert into session (start_time, end_time, date) values ('3:10', '19:17', '12/01/2021');
insert into session (start_time, end_time, date) values ('5:31', '21:08', '28/12/2020');
insert into session (start_time, end_time, date) values ('8:53', '13:30', '07/06/2024');
insert into session (start_time, end_time, date) values ('3:17', '2:29', '18/06/2022');
insert into session (start_time, end_time, date) values ('6:44', '18:15', '06/07/2020');
insert into session (start_time, end_time, date) values ('12:25', '17:35', '26/04/2021');
insert into session (start_time, end_time, date) values ('7:24', '7:04', '29/09/2020');
insert into session (start_time, end_time, date) values ('16:45', '21:03', '07/08/2021');
insert into session (start_time, end_time, date) values ('2:22', '20:19', '18/11/2020');
insert into session (start_time, end_time, date) values ('19:40', '13:38', '11/06/2021');
insert into session (start_time, end_time, date) values ('8:05', '21:00', '22/10/2022');
insert into session (start_time, end_time, date) values ('7:02', '11:18', '03/06/2022');
insert into session (start_time, end_time, date) values ('23:34', '21:18', '20/02/2023');
insert into session (start_time, end_time, date) values ('10:11', '15:08', '21/05/2022');
insert into session (start_time, end_time, date) values ('15:50', '13:52', '09/09/2022');
insert into session (start_time, end_time, date) values ('6:46', '3:12', '08/06/2024');
insert into session (start_time, end_time, date) values ('14:55', '15:16', '17/06/2022');
insert into session (start_time, end_time, date) values ('18:31', '15:18', '05/08/2021');
insert into session (start_time, end_time, date) values ('20:47', '13:36', '13/05/2020');
insert into session (start_time, end_time, date) values ('7:39', '20:42', '08/12/2022');
insert into session (start_time, end_time, date) values ('11:41', '13:21', '18/10/2021');
insert into session (start_time, end_time, date) values ('15:12', '9:55', '10/10/2021');
insert into session (start_time, end_time, date) values ('16:47', '4:55', '08/08/2020');
insert into session (start_time, end_time, date) values ('2:21', '23:52', '29/03/2022');
insert into session (start_time, end_time, date) values ('18:30', '19:14', '04/03/2024');
insert into session (start_time, end_time, date) values ('0:01', '7:03', '24/10/2023');
insert into session (start_time, end_time, date) values ('17:36', '7:50', '24/06/2022');
insert into session (start_time, end_time, date) values ('20:13', '10:22', '14/03/2023');
insert into session (start_time, end_time, date) values ('17:44', '12:40', '05/06/2023');
insert into session (start_time, end_time, date) values ('20:24', '1:24', '03/11/2022');

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

/* Inserting data into the service_type table*/
insert into service_type (service_type) values ('Digital Marketing');
insert into service_type (service_type) values ('Web Optimization');
insert into service_type (service_type) values ('Quality Assurance');
insert into service_type (service_type) values ('Software Development');
insert into service_type (service_type) values ('Analytics');
insert into service_type (service_type) values ('Advertising');
insert into service_type (service_type) values ('Customer Support');     
insert into service_type (service_type) values ('Supply Chain Management');
insert into service_type (service_type) values ('E-commerce Enhancement');
insert into service_type (service_type) values ('Security');
insert into service_type (service_type) values ('Content Creation');
insert into service_type (service_type) values ('Customer Retention');
insert into service_type (service_type) values ('Content Moderation');
insert into service_type (service_type) values ('Pricing Strategy');

/* Inserting data into the service table */
INSERT INTO SERVICE (service_name, service_type_id)
VALUES
('Personalized Product Recommendations', 1),
('Automated Email Campaigns', 1),
('SEO Optimization', 1),
('Social Media Management', 1),
('Website Usability Testing', 3),
('Mobile App Development', 4),
('Content Creation', 1),
('Consumer Behavior Analytics', 5),
('Data Visualization Reports', 5),
('Online Ad Placement', 6),
('Customer Support Chatbot', 7),
('Customer Satisfaction Survey Analysis', 7),
('Inventory Management Optimization', 8),
('Virtual Fitting Room', 9),
('Fraud Detection System', 10),
('Video Content Production', 11),
('Live Chat Assistance', 7),
('Shipping Cost Optimization', 8),
('Product Photography', 11),
('Web Traffic Analysis', 5),
('Order Tracking System', 9),
('Loyalty Program Management', 12),
('Subscription Renewal Reminders', 12),
('User Feedback Collection', 3),
('Product Review Moderation', 13),
('AI-driven Price Optimization', 14),
('Multilingual Support Services', 7),
('Market Trends Analysis', 5),
('Banner Ad Design', 6),
('Return and Refund Management', 7);

/* Inserting data into the device_type table */
insert into device_type (device_name, os) values ('BLU Dash Music', 'Android 2.3');
insert into device_type (device_name, os) values ('Acer Iconia Tab A500', 'Android 3.0, up to 4.0');
insert into device_type (device_name, os) values ('Samsung Galaxy Fame Lite S6790', 'Android 4.1.2');
insert into device_type (device_name, os) values ('Celkon C75', 'Feature phone');
insert into device_type (device_name, os) values ('Nokia 1112', 'Feature phone');
insert into device_type (device_name, os) values ('Lenovo LePad S2007', 'Android 2.3, up to 4.0');
insert into device_type (device_name, os) values ('LG G2 Lite', 'Android 4.4.2');
insert into device_type (device_name, os) values ('Maxon MX-C90', 'Feature phone');
insert into device_type (device_name, os) values ('Xiaomi Redmi 6A', 'Android 8.1, planned upgrade to 10, MIUI 12');
insert into device_type (device_name, os) values ('Huawei P8max', 'Android 5.0.2/5.1.1, up to 6.0, EMUI');

/* Inserting data into the consumer_interaction table */
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (82, 3, 37, 44, 22, null, 23, 3, 355, 224, 330.38, 537.32);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (96, 6, 37, 88, null, 5, 22, 3, 550, 426, 586.42, 531.95);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (65, 2, 86, 59, 25, 10, 41, 3, 916, 218, 17.98, 703.78);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (44, 2, 41, 77, 26, null, 16, 1, 753, 430, 790.12, 607.92);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (80, 8, 33, 30, 30, 13, 40, 4, 818, 471, 654.58, 130.23);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (42, 1, 44, 51, 28, null, 40, 4, 712, 453, 109.72, 363.14);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (47, 9, 48, 48, null, null, 17, 2, 594, 155, 510.07, 493.66);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (63, 7, 15, 55, null, null, 42, 2, 16, 825, 894.54, 875.66);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (54, 5, 89, 50, null, 25, 48, 3, 731, 690, 882.17, 92.28);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (100, 1, 32, 9, null, null, 24, 2, 25, 476, 60.14, 673.71);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (97, 2, 65, 85, null, null, 34, 1, 763, 263, 44.54, 134.67);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (54, 3, 37, 81, 21, null, 35, 1, 182, 448, 984.17, 290.85);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (40, 7, 8, 81, null, null, 5, 4, 803, 17, 900.79, 245.98);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (33, 7, 18, 39, 29, null, 48, 2, 594, 342, 565.56, 332.79);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (51, 3, 72, 5, 21, 20, 14, 1, 790, 825, 928.42, 832.49);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (76, 4, 45, 59, 19, 21, 20, 2, 271, 259, 467.11, 761.82);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (18, 7, 55, 79, 3, null, 44, 1, 665, 460, 239.35, null);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (18, 4, 7, 61, null, 12, 33, 1, 380, 937, 856.31, 593.36);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (13, 10, 41, 86, null, 23, 14, 2, 70, 215, 855.24, 403.35);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (98, 6, 6, 59, null, null, 9, 4, 623, 783, 576.19, 258.69);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (34, 1, 94, 31, 16, 16, 3, 4, 422, 626, 814.69, 362.11);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (50, 3, 7, 24, null, 6, 31, 1, 230, 837, 935.18, 879.48);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (5, 8, 16, 34, null, 8, 27, 4, 534, 400, 589.31, 45.76);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (85, 6, 92, 86, null, null, 15, 4, 611, 578, 126.1, 396.11);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (89, 7, 32, 92, 16, null, 27, 1, 158, 749, 667.91, 599.36);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (27, 1, 80, 93, 1, 28, 25, 3, 744, 169, 906.68, 240.74);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (59, 10, 36, 52, null, 5, 3, 2, 86, 728, 993.0, 127.3);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (4, 1, 34, 31, null, null, 39, 3, 765, 901, 854.82, 669.02);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (5, 8, 72, 41, 9, 27, 4, 1, 465, 832, 620.48, null);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (86, 8, 39, 43, null, null, 50, 4, 121, 642, 796.97, 196.51);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (15, 8, 97, 29, 14, 21, 2, 1, 783, 371, 520.91, 781.05);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (80, 3, 39, 38, null, null, 6, 4, 976, 147, 433.51, 559.48);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (70, 10, 4, 28, 3, null, 9, 1, 864, 31, 651.31, 619.41);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (58, 2, 52, 26, null, null, 4, 2, 130, 754, 718.15, 361.57);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (63, 7, 58, 37, null, null, 3, 2, 353, 353, 469.78, 356.59);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (2, 5, 97, 65, 28, null, 11, 2, 363, 212, 353.53, 326.75);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (51, 7, 51, 64, 1, null, 47, 3, 86, null, 182.1, 715.21);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (36, 6, 96, 64, null, 24, 40, 1, 45, 889, 68.97, 523.27);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (17, 3, 87, 57, null, 22, 32, 4, 485, 171, 180.24, 674.48);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (36, 5, 62, 12, null, null, 48, 4, 195, 149, 80.38, 44.59);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (74, 1, 50, 91, null, 13, 35, 3, 275, 287, 693.04, 981.65);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (8, 8, 65, 88, null, null, 8, 4, 40, 322, 807.75, 710.85);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (39, 2, 100, 90, null, 5, 36, 4, 257, 889, 582.59, 117.5);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (14, 1, 23, 36, 4, null, 17, 1, 987, 268, 218.57, 125.4);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (11, 9, 22, 23, null, null, 2, 1, 572, 374, 660.57, 800.75);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (55, 2, 13, 16, 11, null, 41, 3, 450, 905, 955.28, 725.65);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (30, 3, 22, 60, null, null, 26, 3, 619, 97, 877.2, 840.24);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (85, 9, 2, 92, 10, null, 28, 4, 82, 416, 513.01, 171.4);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (29, 6, 16, 27, 25, null, 21, 1, 229, 52, 595.49, 240.72);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (38, 9, 37, 26, null, null, 34, 1, 168, 461, 164.05, 10.93);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (87, 10, 65, 23, 27, 19, 40, 2, 464, 87, 525.35, 260.07);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (50, 10, 23, 27, null, null, 1, 3, 474, null, 892.25, 414.01);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (29, 2, 17, 26, 16, 15, 43, 1, 710, 319, 437.58, 480.84);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (32, 9, 62, 100, null, null, 47, 4, 410, 628, 702.86, 966.21);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (71, 5, 38, 35, 4, null, 9, 2, 751, 163, 425.5, 927.14);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (63, 1, 73, 40, null, 8, 30, 3, 109, 86, 811.15, 247.5);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (64, 5, 88, 30, 4, null, 49, 2, 876, 845, 261.89, 774.92);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (30, 8, 91, 43, null, 6, 42, 1, 72, 993, 27.49, 463.31);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (3, 3, 54, 85, null, 13, 17, 2, 890, 151, 174.47, 27.13);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (71, 8, 25, 7, 2, null, 47, 3, 198, 408, 325.39, 533.15);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (50, 4, 49, 64, null, null, 31, 1, 61, 131, 835.93, 949.78);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (58, 2, 25, 12, 8, null, 6, 3, 998, 625, 470.58, null);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (82, 4, 80, 29, null, 6, 2, 3, 173, 56, 650.43, 754.07);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (24, 6, 75, 92, null, 9, 36, 1, 939, 162, 500.25, 661.01);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (34, 9, 71, 51, 19, 15, 29, 2, 747, 366, 9.5, 182.04);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (36, 3, 41, 19, 9, 5, 12, 2, 107, 735, 872.18, 544.78);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (40, 1, 14, 26, null, null, 36, 4, 257, 290, 167.65, 487.88);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (91, 6, 18, 59, null, null, 16, 4, 850, 412, 469.14, 527.76);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (70, 8, 27, 80, 22, null, 22, 3, 469, 754, 258.66, 838.19);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (100, 3, 18, 40, 15, null, 33, 1, 293, 780, 582.17, 377.03);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (91, 8, 83, 78, 29, 14, 7, 2, 295, 934, 4.78, 329.99);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (46, 3, 9, 25, null, 9, 9, 1, 948, 219, 331.58, null);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (34, 2, 92, 93, 13, null, 42, 2, 473, 445, 417.78, null);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (81, 4, 47, 11, null, 25, 39, 4, 887, 733, 625.46, 236.42);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (71, 6, 77, 4, null, null, 7, 2, 334, 203, 127.73, 599.07);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (31, 5, 52, 45, 14, 3, 41, 2, 242, 750, 576.76, 456.25);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (20, 8, 38, 95, 13, null, 26, 3, 108, 198, 417.79, 341.91);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (69, 9, 27, 21, 29, 11, 10, 1, 175, 796, 25.94, 726.76);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (3, 10, 62, 100, 24, 7, 1, 3, 201, 108, 602.34, 485.56);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (33, 10, 24, 69, 19, null, 33, 1, 982, null, 809.32, 158.75);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (10, 2, 68, 24, null, 21, 7, 3, 25, 721, 391.5, 720.38);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (24, 7, 95, 60, null, 6, 34, 1, 986, 400, 427.21, 75.57);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (66, 10, 9, 32, 12, 13, 22, 1, 906, 100, 849.18, null);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (3, 5, 27, 89, 6, 7, 2, 4, 398, 5, 751.54, 150.36);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (57, 6, 6, 88, 7, 15, 32, 4, 970, 566, 412.56, 72.5);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (34, 1, 60, 75, null, null, 26, 1, 754, 336, 480.32, 750.92);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (28, 8, 91, 3, null, 11, 3, 2, 898, 534, 162.61, 127.61);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (18, 1, 53, 24, null, null, 13, 4, 196, null, 493.09, 205.91);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (13, 1, 79, 31, null, 7, 1, 3, 307, 406, 392.83, 932.04);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (74, 7, 95, 30, null, null, 49, 3, 205, 422, 673.12, 637.04);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (99, 9, 64, 58, 22, null, 12, 3, 504, 939, 655.18, 190.23);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (20, 9, 85, 83, null, null, 30, 2, 876, 247, 849.66, 953.63);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (62, 2, 51, 19, 23, null, 31, 2, 599, 795, 807.43, null);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (96, 7, 36, 15, null, null, 10, 4, 990, 226, 130.31, 559.78);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (78, 9, 63, 56, 18, null, 15, 3, 493, 249, 551.14, 95.74);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (99, 8, 41, 74, 12, null, 20, 1, 549, 995, 621.25, 501.23);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (69, 3, 48, 72, 21, null, 9, 1, 282, 630, 109.05, 995.18);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (72, 7, 10, 95, 24, 24, 13, 4, 587, 233, 275.5, 36.48);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (29, 7, 62, 6, 30, null, 7, 3, 439, 843, 616.59, 486.64);
insert into consumer_interaction (consumer_id, device_type_id, website_id, session_id, service_id, product_id, location_id, interaction_type_id, total_items_viewed, total_items_purchased, basket_subtotal, total_checkout_price) values (82, 6, 74, 64, null, 2, 11, 3, 447, 307, 358.39, null);

/* Inserting data into the marketing_performance table */
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (79, 3, 5, 7, 1, 18, 942901, 517105, 50132.24);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (78, 97, 7, 68, 4, 41, 575637, 164719, 93152.87);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (47, 64, 9, 41, 1, 19, 902350, 991111, 87690.97);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (7, 89, 5, 42, 1, 68, 972745, 314747, 37506.77);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (63, 20, 7, 67, 3, 23, 155204, 176103, 84900.26);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (82, 75, 10, 12, 1, 44, 116455, 322483, 52076.38);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (50, 88, 6, 30, 4, 53, 110615, 335418, 58190.41);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (7, 13, 4, 14, 5, 52, 788691, 576679, 88274.16);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (26, 17, 1, 65, 4, 1, 46678, 981089, 32138.34);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (69, 38, 10, 8, 3, 91, 38013, 563939, 36923.73);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (86, 21, 2, 28, 3, 28, 368554, 537653, 4832.83);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (32, 61, 3, 63, 5, 100, 381069, 224910, 59760.01);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (62, 40, 6, 87, 6, 77, 510096, 946455, 71198.9);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (14, 48, 5, 73, 6, 29, 74730, 784648, 78933.47);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (72, 32, 8, 93, 2, 15, 483660, 962982, 69521.08);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (87, 3, 10, 62, 4, 56, 894894, 731021, 97076.5);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (88, 75, 4, 42, 2, 75, 729754, 958208, 75668.67);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (38, 18, 3, 28, 6, 61, 76816, 353629, 27147.2);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (82, 54, 10, 15, 2, 30, 317337, 847052, 63978.31);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (69, 76, 2, 11, 4, 56, 846404, 649475, 14955.71);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (24, 26, 10, 30, 1, 92, 401815, 69082, 23475.71);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (64, 10, 3, 27, 6, 38, 877568, 881870, 41731.82);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (50, 95, 1, 81, 4, 98, 321900, 757551, 52588.05);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (69, 88, 2, 97, 5, 77, 847832, 683771, 35625.44);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (59, 42, 3, 59, 4, 95, 204322, 210153, 31273.11);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (9, 34, 8, 37, 1, 67, 194080, 202908, 64761.86);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (21, 83, 9, 94, 1, 15, 844791, 743460, 11188.5);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (26, 94, 6, 29, 2, 92, 175354, 433398, 81767.02);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (17, 41, 1, 21, 5, 24, 862708, 326318, 24030.6);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (75, 2, 3, 24, 5, 36, 963416, 851233, 67287.78);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (8, 59, 3, 12, 4, 61, 244656, 639523, 34570.35);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (58, 31, 1, 11, 6, 21, 528954, 580027, 47240.59);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (6, 68, 8, 86, 4, 85, 333422, 794732, 13922.1);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (83, 63, 5, 81, 4, 2, 343332, 365984, 58162.96);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (69, 100, 5, 100, 3, 81, 223539, 440556, 40868.94);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (85, 12, 3, 3, 5, 27, 40128, 211533, 64663.06);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (67, 39, 6, 77, 5, 88, 746595, 529958, 55405.55);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (67, 36, 3, 3, 1, 16, 138816, 945239, 44831.27);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (84, 57, 5, 57, 6, 92, 370474, 605035, 93604.72);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (52, 22, 10, 12, 5, 30, 4430, 44967, 67168.77);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (26, 67, 7, 64, 1, 43, 148558, 604417, 88192.46);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (10, 100, 8, 28, 6, 66, 504961, 816671, 73267.65);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (82, 57, 1, 35, 2, 60, 42215, 960300, 10999.1);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (77, 38, 6, 60, 4, 68, 113784, 693679, 57848.15);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (54, 25, 7, 90, 1, 79, 841873, 478470, 11783.13);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (5, 5, 4, 17, 5, 46, 432122, 487867, 95870.16);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (14, 91, 3, 13, 1, 14, 978794, 754244, 81373.65);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (63, 40, 2, 1, 1, 48, 623961, 238762, 66006.19);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (67, 17, 2, 58, 2, 50, 76266, 319977, 2585.55);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (3, 60, 6, 6, 1, 72, 631337, 177585, 70831.84);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (43, 44, 4, 1, 6, 95, 167503, 827742, 57086.52);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (58, 18, 1, 40, 5, 81, 86176, 664946, 87862.5);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (58, 80, 1, 97, 1, 19, 473746, 776412, 52096.88);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (7, 98, 1, 49, 3, 79, 797637, 883960, 29901.92);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (83, 44, 8, 8, 2, 86, 656486, 92059, 12666.14);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (14, 97, 3, 31, 4, 55, 438719, 460468, 58228.57);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (15, 77, 7, 6, 5, 95, 710824, 355446, 96837.94);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (32, 7, 6, 100, 4, 60, 209808, 615385, 24257.45);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (76, 78, 3, 55, 2, 5, 859807, 37846, 3629.48);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (74, 55, 8, 20, 2, 34, 273214, 145060, 74941.67);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (67, 87, 1, 85, 4, 64, 992380, 217822, 59147.06);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (62, 33, 7, 86, 3, 66, 864611, 216707, 35383.87);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (45, 19, 1, 58, 4, 11, 424, 455891, 97344.93);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (47, 21, 5, 71, 3, 59, 559184, 262301, 43425.92);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (74, 58, 2, 25, 3, 67, 53315, 732645, 92248.41);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (77, 38, 7, 46, 4, 74, 403444, 840066, 14455.57);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (2, 21, 5, 10, 3, 13, 288643, 989461, 5336.06);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (56, 5, 3, 26, 6, 14, 881102, 697890, 63831.21);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (5, 77, 8, 64, 3, 52, 594829, 195102, 72571.51);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (85, 82, 8, 16, 2, 18, 156409, 795724, 55205.39);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (28, 66, 5, 17, 3, 47, 171804, 613772, 44324.49);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (41, 6, 4, 56, 4, 87, 665817, 54766, 5998.16);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (11, 96, 3, 48, 6, 78, 824037, 450769, 95462.51);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (63, 41, 3, 50, 5, 94, 878902, 785849, 29017.7);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (35, 41, 8, 97, 2, 93, 330793, 472876, 28112.15);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (47, 5, 6, 17, 1, 2, 410349, 885746, 66240.2);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (19, 60, 3, 92, 6, 99, 21028, 455861, 76358.94);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (11, 59, 4, 59, 2, 39, 618581, 586228, 8697.26);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (65, 55, 9, 40, 4, 93, 199347, 906929, 10213.91);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (34, 99, 7, 71, 2, 88, 583710, 216529, 2544.46);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (19, 34, 8, 71, 1, 17, 496848, 92984, 55963.27);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (43, 67, 7, 19, 6, 22, 908585, 244662, 80276.9);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (88, 100, 9, 2, 2, 68, 570024, 434468, 22551.35);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (44, 85, 6, 46, 5, 99, 168262, 674836, 40517.68);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (10, 17, 10, 93, 1, 55, 836152, 995933, 78778.4);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (87, 41, 2, 15, 6, 12, 707662, 589, 81528.33);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (9, 33, 3, 83, 6, 62, 84242, 806193, 8128.63);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (47, 74, 5, 74, 3, 83, 991552, 127111, 18644.03);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (80, 69, 10, 53, 4, 37, 359698, 325993, 72322.96);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (74, 35, 6, 20, 2, 71, 787751, 146570, 20075.96);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (14, 58, 6, 16, 2, 14, 139160, 117605, 55494.32);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (43, 33, 7, 94, 1, 79, 604186, 928862, 47151.22);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (86, 7, 6, 68, 1, 4, 725262, 270548, 35241.09);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (85, 85, 6, 21, 4, 99, 561221, 911181, 73881.97);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (10, 4, 9, 12, 1, 46, 102823, 564004, 32362.54);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (16, 51, 5, 75, 2, 45, 803252, 25154, 28356.57);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (61, 66, 5, 29, 4, 79, 803275, 55520, 52753.9);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (35, 51, 2, 24, 4, 12, 285166, 430811, 97375.59);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (30, 60, 6, 99, 2, 66, 366376, 593205, 36137.49);
insert into marketing_performance (campaign_id, consumer_id, device_type_id, website_id, reach_id, session_id, total_impressions, total_clicks, return_on_investment) values (12, 41, 1, 26, 4, 53, 190793, 813011, 38565.04);

/* Queries for the Data Warehouse */

/* Query 1: Get the total number of interactions on product categories */
SELECT 
    cat.category_name AS product_category,
    SUM(ci.total_items_viewed) AS total_items_viewed,
    SUM(ci.total_items_purchased) AS total_items_purchased
FROM 
    consumer_interaction ci
JOIN 
    product p ON ci.product_id = p.product_id
JOIN 
    category cat ON p.category_id = cat.category_id
GROUP BY 
    CUBE(cat.category_name)
ORDER BY 
    product_category;


/* Query 2: Get the total number of ad interactions by each consumer */
CREATE VIEW top_marketing_performance_campaigns AS
SELECT 
    ca.campaign_name AS campaign_name,
    SUM(mp.total_impressions) AS total_impressions,
    SUM(mp.total_clicks) AS total_clicks,
    SUM(mp.return_on_investment) AS total_roi,
    COUNT(DISTINCT mp.consumer_id) AS unique_consumers,
    COUNT(DISTINCT mp.device_type_id) AS unique_devices
FROM 
    marketing_performance mp
JOIN 
    campaign ca ON mp.campaign_id = ca.campaign_id
GROUP BY 
    ROLLUP(ca.campaign_name)
ORDER BY 
    total_roi DESC
LIMIT 20;

/* Query 3: Get the top 20 consumers with the highest total checkout price */
CREATE VIEW consumer_interaction_summary AS
SELECT 
    ci.consumer_id,
    c.name AS consumer_name,
    COUNT(*) AS total_interactions,
    SUM(ci.total_items_viewed) AS total_items_viewed,
    SUM(ci.total_items_purchased) AS total_items_purchased,
    SUM(ci.basket_subtotal) AS total_basket_subtotal,
    SUM(ci.total_checkout_price) AS total_checkout_price
FROM 
    CONSUMER_INTERACTION ci
JOIN 
    CONSUMER c ON ci.consumer_id = c.consumer_id
GROUP BY 
    ci.consumer_id, c.name 
ORDER BY 
    total_checkout_price DESC
LIMIT 20;

/* Query 4: Get the total return on investment by each reach means */
SELECT r.reach_means, SUM(mp.return_on_investment) AS total_roi
FROM marketing_performance mp
JOIN means_used_to_website r ON mp.reach_id = r.reach_id
JOIN campaign c ON mp.campaign_id = c.campaign_id
WHERE c.campaign_id = 1
GROUP BY r.reach_means;

/* Query 5: Get the average number of items purchased by each consumer */
SELECT ci.consumer_id, c.name AS consumer_name, ROUND(AVG(ci.total_items_purchased), 0) AS avg_items_purchased
FROM consumer_interaction ci
JOIN consumer c ON ci.consumer_id = c.consumer_id
GROUP BY ci.consumer_id, c.name
LIMIT 20;

/* Query 6: Get the total number of interactions by each ad campaign and channels used to get to it */
SELECT 
    c.campaign_name,
    mw.reach_means,
    SUM(mp.total_impressions) AS total_impressions,
    SUM(mp.total_clicks) AS total_clicks,
    SUM(mp.return_on_investment) AS total_roi
FROM 
    marketing_performance mp
JOIN 
    campaign c ON mp.campaign_id = c.campaign_id
JOIN 
    means_used_to_website mw ON mp.reach_id = mw.reach_id
GROUP BY 
    ROLLUP(c.campaign_name, mw.reach_means)
ORDER BY 
    c.campaign_name, mw.reach_means
LIMIT 20;