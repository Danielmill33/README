 CREATE DATABASE CONFERENCE;

USE CONFERENCE;

CREATE TABLE AUTHOR(
    EmailAddr   VARCHAR(63)     NOT NULL    PRIMARY KEY,
    FirstName   VARCHAR(33)     NOT NULL,
    LastName    VARCHAR(33)     NOT NULL
    );

CREATE TABLE PAPER(
    Id              INT             NOT NULL    PRIMARY KEY,
    Author_email    VARCHAR(63)     NOT NULL,
    Title           VARCHAR(33)     NOT NULL,
    Abstract        MEDIUMTEXT      NOT NULL,
    FileNames       VARCHAR(128)    NOT NULL,
    FOREIGN KEY(Author_email) REFERENCES AUTHOR(EmailAddr),
    UNIQUE(Author_email)
    );

CREATE TABLE REVIEWER(
    EmailAddr               VARCHAR(63)     NOT NULL    PRIMARY KEY,
    FirstName               VARCHAR(33)     NOT NULL,
    LastName                VARCHAR(33)     NOT NULL,
    PhoneNum                VARCHAR(16)     NOT NULL,
    Affiliation             VARCHAR(33)     NOT NULL,
    AuthorFeedback          VARCHAR(128),
    CommiteeFeedback        VARCHAR(128)
    );

CREATE TABLE TOPIC(
    Id              INT             NOT NULL    PRIMARY KEY     AUTO_INCREMENT,
    Reviewer_Email  VARCHAR(63)     NOT NULL,
    TopicName       VARCHAR(63),
    FOREIGN KEY(Reviewer_Email) REFERENCES REVIEWER(EmailAddr),
    CONSTRAINT no_double_record UNIQUE(Reviewer_Email, TopicName)
);

CREATE TABLE ASSIGNED(
    PaperId             INT             NOT NULL,
    Reviewer_Email      VARCHAR(63)     NOT NULL,
    FOREIGN KEY(PaperId) REFERENCES PAPER(Id),
    FOREIGN KEY(Reviewer_Email) REFERENCES REVIEWER(EmailAddr)
);

CREATE TABLE REVIEW(
    Id                  INT             NOT NULL    PRIMARY KEY     AUTO_INCREMENT,
    PaperId             INT             NOT NULL,
    Reviewer_Email      VARCHAR(63)     NOT NULL,
    Recommendation      MEDIUMTEXT      NOT NULL,
    MeritScore          ENUM('1','2','3','4','5','6','7','8','9','10')  NOT NULL,
    ReadabilityScore    ENUM('1','2','3','4','5','6','7','8','9','10')  NOT NULL,
    OriginalityScore    ENUM('1','2','3','4','5','6','7','8','9','10')  NOT NULL,
    RelevanceScore      ENUM('1','2','3','4','5','6','7','8','9','10')  NOT NULL,
    FOREIGN KEY(PaperId) REFERENCES PAPER(Id),
    FOREIGN KEY(Reviewer_Email) REFERENCES REVIEWER(EmailAddr),
    CONSTRAINT no_double_review UNIQUE(PaperId, Reviewer_Email)
);
	USE CONFERENCE;
	

	INSERT INTO AUTHOR VALUES ('alohomora@pou.com', 'Andrea', 'Bocelli');
	INSERT INTO AUTHOR VALUES('untra@jhygd.com', 'Raul', 'Ritz');
	INSERT INTO AUTHOR VALUES('esti@mhk.com', 'Eleonore', 'Rose');
	INSERT INTO AUTHOR VALUES('tyuih@rou.aol', 'Andrew', 'Rooney');
	

	INSERT INTO PAPER VALUES('1', 'alohomora@pou.com', 'Spells', 'Each spell''s cast by a wizard', 'spells.jpg');
	INSERT INTO PAPER VALUES('2', 'untra@jhygd.com', 'Different classes of Mirrors', 'The multiverse of a mirror.', 'mirror.jpg');
	INSERT INTO PAPER VALUES('3', 'esti@mhk.com', 'Different kind of tvs', 'There are many kind of flat screens', 'screens.jpg');
	INSERT INTO PAPER VALUES('4', 'tyuih@rou.aol', 'Paints', 'The variety of paints is unbelievable', 'paint.jpg');
	

	INSERT INTO REVIEWER VALUES('popolopu@gmail.com', 'Aloha', 'Retzo', '908-5902362', 'Alcoholic Anonymous', NULL, NULL);
	INSERT INTO REVIEWER VALUES('utah@hotmail.com', 'Raul', 'Trota', '212-453-5431', 'Poet Society', NULL, NULL);
	INSERT INTO REVIEWER VALUES('yermano@ret@hotmail.com', 'Ponte ', 'Ziad', '212-132-3132', 'Tennis Youth NYC', NULL, NULL);
	INSERT INTO REVIEWER VALUES('e.parker@gmail.com', 'Zara', 'Parker', '212-668-0668', 'Tennis Youth NYC', NULL, NULL);
	INSERT INTO REVIEWER VALUES('westrnunion@lola.edu', 'John', 'Pierce', '212-404-6404', 'Tennis Youth NYC', NULL, NULL);
	INSERT INTO REVIEWER VALUES('estrapolacion@er.com', 'Wendy', 'Robertson', '212-232-7232', 'Poet Society', NULL, NULL);
	INSERT INTO REVIEWER VALUES('s.campbell@gmail.com', 'Sandra', 'Campbell', '212-954-7954', 'Alcoholic Anonymous', NULL, NULL);
	INSERT INTO REVIEWER VALUES('a.green@yahoo.com', 'Angela', 'Green', '654-756-6354', 'Tennis Youth NYC', NULL, NULL);
	INSERT INTO REVIEWER VALUES('yeouyh@tojn.com', 'Aloha', 'Hopkins', '212-553-5553', 'Poet Society', NULL, NULL);
	INSERT INTO REVIEWER VALUES('jojojo@gmail.com', 'Elizabeth', 'Mills', '212-361-6361', 'Alcoholic Anonymous', NULL, NULL);
	

	INSERT INTO TOPIC VALUES(NULL, 'popolopu@gmail.com', 'Paint');
	INSERT INTO TOPIC VALUES(NULL, 'utah@hotmail.com', 'Science');
	INSERT INTO TOPIC VALUES(NULL, 'westrnunion@lola.edu', 'Art');
	INSERT INTO TOPIC VALUES(NULL, 'estrapolacion@er.com', 'Science');
	INSERT INTO TOPIC VALUES(NULL, 's.campbell@gmail.com', 'Paint');
	INSERT INTO TOPIC VALUES(NULL, 'a.green@yahoo.com', 'Art');
	INSERT INTO TOPIC VALUES(NULL, 'yeouyh@tojn.com', 'Science');
	INSERT INTO TOPIC VALUES(NULL, 'jojojo@gmail.com', 'Paint');
	INSERT INTO TOPIC VALUES(NULL, 'yermano@ret@hotmail.com', 'Art');
	INSERT INTO TOPIC VALUES(NULL, 'e.parker@gmail.com', 'Art');
	

	INSERT INTO ASSIGNED VALUES('4','popolopu@gmail.com');
	INSERT INTO ASSIGNED VALUES('3','utah@hotmail.com');
	INSERT INTO ASSIGNED VALUES('1','westrnunion@lola.edu');
	INSERT INTO ASSIGNED VALUES('3','estrapolacion@er.com');
	INSERT INTO ASSIGNED VALUES('4','s.campbell@gmail.com');
	INSERT INTO ASSIGNED VALUES('1','a.green@yahoo.com');
	INSERT INTO ASSIGNED VALUES('3','yeouyh@tojn.com');
	INSERT INTO ASSIGNED VALUES('4','jojojo@gmail.com');
	INSERT INTO ASSIGNED VALUES('2','yermano@ret@hotmail.com');
	INSERT INTO ASSIGNED VALUES('2','e.parker@gmail.com');
	

	INSERT INTO REVIEW VALUES(NULL,'4', 'popolopu@gmail.com', 'Excellent!','10','9','10','9');
	INSERT INTO REVIEW VALUES(NULL,'3','utah@hotmail.com', 'Outstanding!','9','10','10','9');
	INSERT INTO REVIEW VALUES(NULL,'1','westrnunion@lola.edu', 'Exceptional!','10','8','10','10');
	INSERT INTO REVIEW VALUES(NULL,'3', 'estrapolacion@er.com', 'Highest Standard!','9','10','10','10');
	INSERT INTO REVIEW VALUES(NULL,'4', 's.campbell@gmail.com', 'Sobresalient!','10','10','9','10');
	INSERT INTO REVIEW VALUES(NULL,'1', 'a.green@yahoo.com', 'Supreme!','10','10','10','10');
	INSERT INTO REVIEW VALUES(NULL,'3', 'yeouyh@tojn.com', 'Highest Quality!','10','8','10','9');
	INSERT INTO REVIEW VALUES(NULL,'4', 'jojojo@gmail.com', 'Good Job!','9','10','10','10');
	INSERT INTO REVIEW VALUES(NULL,'2', 'yermano@ret@hotmail.com', 'Deserves Nobel!','10','9','10','10');
	INSERT INTO REVIEW VALUES(NULL,'2', 'e.parker@gmail.com', 'Eminent!','10','10','10','10');