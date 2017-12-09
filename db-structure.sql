SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

-- -----------------------------------------------------
-- Table `faqs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faqs` ;

CREATE  TABLE IF NOT EXISTS `faqs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `title` TEXT NOT NULL ,
  `body` TEXT NOT NULL ,
  `created` DATETIME NOT NULL ,
  `deleted_date` DATETIME NOT NULL ,
  `deleted` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `user_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_groups` ;

CREATE  TABLE IF NOT EXISTS `user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NULL DEFAULT NULL ,
  `alias_name` VARCHAR(100) NULL DEFAULT NULL ,
  `allowRegistration` INT(1) NOT NULL DEFAULT '1' ,
  `created` DATETIME NULL DEFAULT NULL ,
  `modified` DATETIME NULL DEFAULT NULL ,
  `deleted_date` DATETIME NOT NULL ,
  `deleted` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `user_group_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_group_permissions` ;

CREATE  TABLE IF NOT EXISTS `user_group_permissions` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `controller` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL ,
  `action` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL ,
  `allowed` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `deleted_date` DATETIME NOT NULL ,
  `deleted` INT(11) NOT NULL DEFAULT '0' ,
  `user_groups_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_user_group_permissions_user_groups` (`user_groups_id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 513
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users` ;

CREATE  TABLE IF NOT EXISTS `users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(50) NULL DEFAULT NULL ,
  `password` VARCHAR(50) NULL DEFAULT NULL ,
  `email` VARCHAR(50) NULL DEFAULT NULL ,
  `created` DATETIME NULL DEFAULT NULL ,
  `modified` DATETIME NULL DEFAULT NULL ,
  `phone_address` VARCHAR(18) NOT NULL ,
  `ip_address` VARCHAR(16) NOT NULL ,
  `name` VARCHAR(200) NOT NULL ,
  `foto` VARCHAR(200) NOT NULL ,
  `description` TEXT NOT NULL ,
  `deleted` INT(11) NOT NULL ,
  `deleted_date` DATETIME NOT NULL ,
  `user_group_id` INT(11) NULL DEFAULT NULL ,
  `email_verified` TINYINT(3) NULL DEFAULT '0' ,
  `salt` VARCHAR(255) NULL DEFAULT NULL ,
  `active` INT(11) NOT NULL ,
  `user_groups_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `phone_address` (`phone_address` ASC) ,
  INDEX `ip_address` (`ip_address` ASC) ,
  INDEX `fk_users_user_groups1` (`user_groups_id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `booking` ;

CREATE  TABLE IF NOT EXISTS `booking` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL ,
  `user_id` INT(10) UNSIGNED NOT NULL ,
  `created` DATETIME NULL DEFAULT NULL ,
  `modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_booking_users1` (`user_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `booking_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `booking_details` ;

CREATE  TABLE IF NOT EXISTS `booking_details` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `key` VARCHAR(100) NULL ,
  `value` TEXT NULL ,
  `booking_id` INT NOT NULL ,
  `created` DATETIME NULL DEFAULT NULL ,
  `modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_booking_details_booking1` (`booking_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organizations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `organizations` ;

CREATE  TABLE IF NOT EXISTS `organizations` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `description` TEXT NULL ,
  `created` DATETIME NULL DEFAULT NULL ,
  `modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vehicle` ;

CREATE  TABLE IF NOT EXISTS `vehicle` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `plate_number` CHAR(10) NULL ,
  `note` VARCHAR(45) NULL ,
  `user_id` INT(10) UNSIGNED NOT NULL ,
  `organizations_id` INT NOT NULL ,
  `latlong` CHAR(100) NULL ,
  `created` DATETIME NULL DEFAULT NULL ,
  `modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_vehicle_users1` (`user_id` ASC) ,
  INDEX `fk_vehicle_organizations1` (`organizations_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE  TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `description` TEXT NULL ,
  `rate` CHAR(1) NULL ,
  `booking_id` INT NOT NULL ,
  `user_id` INT(10) UNSIGNED NOT NULL ,
  `created` DATETIME NULL DEFAULT NULL ,
  `modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_review_booking1` (`booking_id` ASC) ,
  INDEX `fk_review_users1` (`user_id` ASC) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
