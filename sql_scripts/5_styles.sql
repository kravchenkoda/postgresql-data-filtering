CREATE TABLE IF NOT EXISTS beer.styles(
   id   INTEGER NOT NULL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   created_at TIMESTAMP without TIME ZONE DEFAULT (now() at time zone 'utc'),
   updated_at TIMESTAMP without TIME ZONE DEFAULT (now() at time zone 'utc')
);
    SELECT beer.trigger_creation('beer','styles','tr_b_styles');
INSERT INTO beer.styles(id,name) VALUES (1,'American Pale Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (2,'American Pale Ale (APA)') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (3,'American IPA') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (4,'American Double / Imperial IPA') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (5,'Oatmeal Stout') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (6,'American Porter') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (7,'Saison / Farmhouse Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (8,'Belgian IPA') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (9,'Cider') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (10,'Baltic Porter') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (11,'Tripel') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (12,'American Barleywine') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (13,'Winter Warmer') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (14,'American Stout') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (15,'Fruit / Vegetable Beer') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (16,'English Strong Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (17,'American Black Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (18,'Belgian Dark Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (19,'American Blonde Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (20,'American Amber / Red Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (21,'Berliner Weissbier') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (22,'American Brown Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (23,'American Pale Wheat Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (24,'Belgian Strong Dark Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (25,'Kölsch') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (26,'English Pale Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (27,'American Amber / Red Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (28,'English Barleywine') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (29,'Milk / Sweet Stout') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (30,'German Pilsener') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (31,'Pumpkin Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (32,'Belgian Pale Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (33,'American Pilsner') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (34,'American Wild Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (35,'English Brown Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (36,'Altbier') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (37,'California Common / Steam Beer') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (38,'Gose') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (39,'Cream Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (40,'Vienna Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (41,'Witbier') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (42,'American Double / Imperial Stout') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (43,'Munich Helles Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (44,'Schwarzbier') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (45,'Märzen / Oktoberfest') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (46,'Extra Special / Strong Bitter (ESB)') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (47,'Rye Beer') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (48,'Euro Dark Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (49,'Hefeweizen') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (50,'Foreign / Export Stout') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (51,'Other') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (52,'English India Pale Ale (IPA)') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (53,'Czech Pilsener') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (54,'American Strong Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (55,'Mead') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (56,'Euro Pale Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (57,'American White IPA') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (58,'Dortmunder / Export Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (59,'Irish Dry Stout') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (60,'Scotch Ale / Wee Heavy') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (61,'Munich Dunkel Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (62,'Radler') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (63,'Bock') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (64,'English Dark Mild Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (65,'Irish Red Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (66,'Rauchbier') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (67,'Bière de Garde') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (68,'Doppelbock') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (69,'Dunkelweizen') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (70,'Belgian Strong Pale Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (71,'Dubbel') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (72,'Quadrupel (Quad)') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (73,'Russian Imperial Stout') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (74,'English Pale Mild Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (75,'Maibock / Helles Bock') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (76,'Herbed / Spiced Beer') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (77,'American Adjunct Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (78,'Scottish Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (79,'Smoked Beer') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (80,'Light Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (81,'Abbey Single Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (82,'Roggenbier') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (83,'Kristalweizen') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (84,'American Dark Wheat Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (85,'English Stout') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (86,'Old Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (87,'American Double / Imperial Pilsner') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (88,'Flanders Red Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (89,'Keller Bier / Zwickel Bier') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (90,'American India Pale Lager') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (91,'Shandy') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (92,'Wheat Ale') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (93,'American Malt Liquor') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (94,'English Bitter') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (95,'Chile Beer') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (96,'Grisette') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (97,'Flanders Oud Bruin') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (98,'Braggot') ON CONFLICT DO NOTHING;
INSERT INTO beer.styles(id,name) VALUES (99,'Low Alcohol Beer') ON CONFLICT DO NOTHING;