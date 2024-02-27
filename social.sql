create database social;
use social;

CREATE TABLE `social`.`users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `coverpic` VARCHAR(100) NULL,
  `profilepic` VARCHAR(100) NULL,
  `city` VARCHAR(45) NULL,
  `website` VARCHAR(45) NULL);

CREATE TABLE `social`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `desc` VARCHAR(200) NULL,
  `img` VARCHAR(200) NULL,
  `createdAT` DATETIME,
  `userId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `userId_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `social`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    

CREATE TABLE `social`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `desc` VARCHAR(200) NOT NULL,
  `createdAt` DATETIME NULL,
  `commentUserid` INT NOT NULL,
  `postId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `commentUserid_idx` (`commentUserid` ASC) VISIBLE,
  INDEX `postId_idx` (`postId` ASC) VISIBLE,
  CONSTRAINT `commentUserid`
    FOREIGN KEY (`commentUserid`)
    REFERENCES `social`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `postId`
    FOREIGN KEY (`postId`)
    REFERENCES `social`.`posts` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `social`.`stories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `img` VARCHAR(200) NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userId_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `social`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    CREATE TABLE `social`.`relationships` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `followerUserid` INT NOT NULL,
  `followedUserid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `followerUserid_idx` (`followerUserid` ASC) VISIBLE,
  INDEX `followedUserid_idx` (`followedUserid` ASC) VISIBLE,
  CONSTRAINT `followerUserid`
    FOREIGN KEY (`followerUserid`)
    REFERENCES `social`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `followedUserid`
    FOREIGN KEY (`followedUserid`)
    REFERENCES `social`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
CREATE TABLE `social`.`likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `postId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userId_idx` (`userId` ASC) VISIBLE,
  INDEX `postId_idx` (`postId` ASC) VISIBLE,
  CONSTRAINT `fk_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `social`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_postId`
    FOREIGN KEY (`postId`)
    REFERENCES `social`.`posts` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
