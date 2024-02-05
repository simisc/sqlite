DROP TABLE IF EXISTS tests;
CREATE TABLE IF NOT EXISTS tests (
    -- uuid and name are taken from the test.toml file
    uuid TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    -- The following section is needed by the online test-runner
    status TEXT DEFAULT 'fail', 
    message TEXT,
    output TEXT,
    test_code TEXT,
    task_id INTEGER DEFAULT NULL,
    -- Here are columns for the actual tests
    task TEXT,
    item TEXT,
    score INT NOT NULL,
    expected TEXT
);

-- Note: the strings below contain literal tab, newline, carriage returns.

INSERT INTO tests (uuid, name, task, item, score, expected)
    VALUES
        ('17fc7296-2440-4ac4-ad7b-d07c321bc5a0', 'not allergic to anything', 'allergicTo', 'eggs', 0, 'false'),
        ('07ced27b-1da5-4c2e-8ae2-cb2791437546', 'allergic only to eggs', 'allergicTo', 'eggs', 1, 'true'),
        ('5035b954-b6fa-4b9b-a487-dae69d8c5f96', 'allergic to eggs and something else', 'allergicTo', 'eggs', 3, 'true'),
        ('64a6a83a-5723-4b5b-a896-663307403310', 'allergic to something, but not eggs', 'allergicTo', 'eggs', 2, 'false'),
        ('90c8f484-456b-41c4-82ba-2d08d93231c6', 'allergic to everything', 'allergicTo', 'eggs', 255, 'true'),
        ('d266a59a-fccc-413b-ac53-d57cb1f0db9d', 'not allergic to anything', 'allergicTo', 'peanuts', 0, 'false'),
        ('ea210a98-860d-46b2-a5bf-50d8995b3f2a', 'allergic only to peanuts', 'allergicTo', 'peanuts', 2, 'true'),
        ('eac69ae9-8d14-4291-ac4b-7fd2c73d3a5b', 'allergic to peanuts and something else', 'allergicTo', 'peanuts', 7, 'true'),
        ('9152058c-ce39-4b16-9b1d-283ec6d25085', 'allergic to something, but not peanuts', 'allergicTo', 'peanuts', 5, 'false'),
        ('d2d71fd8-63d5-40f9-a627-fbdaf88caeab', 'allergic to everything', 'allergicTo', 'peanuts', 255, 'true'),
        ('b948b0a1-cbf7-4b28-a244-73ff56687c80', 'not allergic to anything', 'allergicTo', 'shellfish', 0, 'false'),
        ('9ce9a6f3-53e9-4923-85e0-73019047c567', 'allergic only to shellfish', 'allergicTo', 'shellfish', 4, 'true'),
        ('b272fca5-57ba-4b00-bd0c-43a737ab2131', 'allergic to shellfish and something else', 'allergicTo', 'shellfish', 14, 'true'),
        ('21ef8e17-c227-494e-8e78-470a1c59c3d8', 'allergic to something, but not shellfish', 'allergicTo', 'shellfish', 10, 'false'),
        ('cc789c19-2b5e-4c67-b146-625dc8cfa34e', 'allergic to everything', 'allergicTo', 'shellfish', 255, 'true'),
        ('651bde0a-2a74-46c4-ab55-02a0906ca2f5', 'not allergic to anything', 'allergicTo', 'strawberries', 0, 'false'),
        ('b649a750-9703-4f5f-b7f7-91da2c160ece', 'allergic only to strawberries', 'allergicTo', 'strawberries', 8, 'true'),
        ('50f5f8f3-3bac-47e6-8dba-2d94470a4bc6', 'allergic to strawberries and something else', 'allergicTo', 'strawberries', 28, 'true'),
        ('23dd6952-88c9-48d7-a7d5-5d0343deb18d', 'allergic to something, but not strawberries', 'allergicTo', 'strawberries', 20, 'false'),
        ('74afaae2-13b6-43a2-837a-286cd42e7d7e', 'allergic to everything', 'allergicTo', 'strawberries', 255, 'true'),
        ('c49a91ef-6252-415e-907e-a9d26ef61723', 'not allergic to anything', 'allergicTo', 'tomatoes', 0, 'false'),
        ('b69c5131-b7d0-41ad-a32c-e1b2cc632df8', 'allergic only to tomatoes', 'allergicTo', 'tomatoes', 16, 'true'),
        ('1ca50eb1-f042-4ccf-9050-341521b929ec', 'allergic to tomatoes and something else', 'allergicTo', 'tomatoes', 56, 'true'),
        ('e9846baa-456b-4eff-8025-034b9f77bd8e', 'allergic to something, but not tomatoes', 'allergicTo', 'tomatoes', 40, 'false'),
        ('b2414f01-f3ad-4965-8391-e65f54dad35f', 'allergic to everything', 'allergicTo', 'tomatoes', 255, 'true'),
        ('978467ab-bda4-49f7-b004-1d011ead947c', 'not allergic to anything', 'allergicTo', 'chocolate', 0, 'false'),
        ('59cf4e49-06ea-4139-a2c1-d7aad28f8cbc', 'allergic only to chocolate', 'allergicTo', 'chocolate', 32, 'true'),
        ('b0a7c07b-2db7-4f73-a180-565e07040ef1', 'allergic to chocolate and something else', 'allergicTo', 'chocolate', 112, 'true'),
        ('f5506893-f1ae-482a-b516-7532ba5ca9d2', 'allergic to something, but not chocolate', 'allergicTo', 'chocolate', 80, 'false'),
        ('02debb3d-d7e2-4376-a26b-3c974b6595c6', 'allergic to everything', 'allergicTo', 'chocolate', 255, 'true'),
        ('17f4a42b-c91e-41b8-8a76-4797886c2d96', 'not allergic to anything', 'allergicTo', 'pollen', 0, 'false'),
        ('7696eba7-1837-4488-882a-14b7b4e3e399', 'allergic only to pollen', 'allergicTo', 'pollen', 64, 'true'),
        ('9a49aec5-fa1f-405d-889e-4dfc420db2b6', 'allergic to pollen and something else', 'allergicTo', 'pollen', 224, 'true'),
        ('3cb8e79f-d108-4712-b620-aa146b1954a9', 'allergic to something, but not pollen', 'allergicTo', 'pollen', 160, 'false'),
        ('1dc3fe57-7c68-4043-9d51-5457128744b2', 'allergic to everything', 'allergicTo', 'pollen', 255, 'true'),
        ('d3f523d6-3d50-419b-a222-d4dfd62ce314', 'not allergic to anything', 'allergicTo', 'cats', 0, 'false'),
        ('eba541c3-c886-42d3-baef-c048cb7fcd8f', 'allergic only to cats', 'allergicTo', 'cats', 128, 'true'),
        ('ba718376-26e0-40b7-bbbe-060287637ea5', 'allergic to cats and something else', 'allergicTo', 'cats', 192, 'true'),
        ('3c6dbf4a-5277-436f-8b88-15a206f2d6c4', 'allergic to something, but not cats', 'allergicTo', 'cats', 64, 'false'),
        ('1faabb05-2b98-4995-9046-d83e4a48a7c1', 'allergic to everything', 'allergicTo', 'cats', 255, 'true'),
        ('f9c1b8e7-7dc5-4887-aa93-cebdcc29dd8f', 'no allergies', 'list', '', 0, ''),
        ('9e1a4364-09a6-4d94-990f-541a94a4c1e8', 'just eggs', 'list', '', 1, 'eggs'),
        ('8851c973-805e-4283-9e01-d0c0da0e4695', 'just peanuts', 'list', '', 2, 'peanuts'),
        ('2c8943cb-005e-435f-ae11-3e8fb558ea98', 'just strawberries', 'list', '', 8, 'strawberries'),
        ('6fa95d26-044c-48a9-8a7b-9ee46ec32c5c', 'eggs and peanuts', 'list', '', 3, 'eggs, peanuts'),
        ('19890e22-f63f-4c5c-a9fb-fb6eacddfe8e', 'more than eggs but not peanuts', 'list', '', 5, 'eggs, shellfish'),
        ('4b68f470-067c-44e4-889f-c9fe28917d2f', 'lots of stuff', 'list', '', 248, 'strawberries, tomatoes, chocolate, pollen, cats'),
        ('0881b7c5-9efa-4530-91bd-68370d054bc7', 'everything', 'list', '', 255, 'eggs, peanuts, shellfish, strawberries, tomatoes, chocolate, pollen, cats'),
        ('12ce86de-b347-42a0-ab7c-2e0570f0c65b', 'no allergen score parts', 'list', '', 509, 'eggs, shellfish, strawberries, tomatoes, chocolate, pollen, cats'),
        ('93c2df3e-4f55-4fed-8116-7513092819cd', 'no allergen score parts without highest valid score', 'list', '', 257, 'eggs');